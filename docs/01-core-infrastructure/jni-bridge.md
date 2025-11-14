# JNI Bridge Layer

## Purpose

The JNI Bridge provides a thin, type-safe layer between Nim code and Java code running on the Android Runtime (ART). It handles class loading, method invocation, type conversion, and reference management.

## Architecture

```
┌────────────────────────────────────────┐
│     High-Level Nim API                 │
│   audio.play("sound.mp3")              │
└────────────────┬───────────────────────┘
                 │
┌────────────────▼───────────────────────┐
│     Manager Layer (AudioManager)       │
│   - High-level business logic          │
│   - State management                   │
└────────────────┬───────────────────────┘
                 │
┌────────────────▼───────────────────────┐
│     JNI Bridge Layer (THIS)            │
│   - Class loading & caching            │
│   - Method ID resolution               │
│   - Type conversion                    │
│   - Reference management               │
│   - Exception bridging                 │
└────────────────┬───────────────────────┘
                 │
┌────────────────▼───────────────────────┐
│     JNI Functions (Native)             │
│   FindClass, GetMethodID, CallMethod*  │
└────────────────┬───────────────────────┘
                 │
┌────────────────▼───────────────────────┐
│     Android Framework (Java/Kotlin)    │
│   AudioManager, MediaPlayer, etc.      │
└────────────────────────────────────────┘
```

## Core Components

### 1. JNI Types (jni/types.nim)

```nim
# Raw JNI types (imported from C)
type
  JNIEnv* {.importc: "JNIEnv", header: "<jni.h>".} = object
  JavaVM* {.importc: "JavaVM", header: "<jni.h>".} = object

  jobject* {.importc: "jobject", header: "<jni.h>".} = pointer
  jclass* {.importc: "jclass", header: "<jni.h>".} = pointer
  jstring* {.importc: "jstring", header: "<jni.h>".} = pointer
  jarray* {.importc: "jarray", header: "<jni.h>".} = pointer
  jthrowable* {.importc: "jthrowable", header: "<jni.h>".} = pointer

  jmethodID* {.importc: "jmethodID", header: "<jni.h>".} = pointer
  jfieldID* {.importc: "jfieldID", header: "<jni.h>".} = pointer

  jboolean* {.importc: "jboolean", header: "<jni.h>".} = uint8
  jbyte* {.importc: "jbyte", header: "<jni.h>".} = int8
  jchar* {.importc: "jchar", header: "<jni.h>".} = uint16
  jshort* {.importc: "jshort", header: "<jni.h>".} = int16
  jint* {.importc: "jint", header: "<jni.h>".} = int32
  jlong* {.importc: "jlong", header: "<jni.h>".} = int64
  jfloat* {.importc: "jfloat", header: "<jni.h>".} = float32
  jdouble* {.importc: "jdouble", header: "<jni.h>".} = float64

  jsize* = jint

# Wrapped types for safety
type
  JClass* = distinct jclass
  JObject* = distinct jobject
  JString* = distinct jstring
  JMethodID* = distinct jmethodID
  JFieldID* = distinct jfieldID

# Reference types
type
  JNIRefKind = enum
    Local,    # Freed when native method returns
    Global,   # Persists until explicitly deleted
    Weak      # Can be GC'd by Java

  JNIRef*[T] = object
    raw: T
    kind: JNIRefKind
    env: ptr JNIEnv  # Environment that created this ref
```

### 2. JNI Environment Access (jni/bridge.nim)

```nim
# Global JavaVM pointer (set during JNI_OnLoad)
var gJavaVM: ptr JavaVM = nil

# Thread-local JNIEnv cache
var tlsEnv {.threadvar.}: ptr JNIEnv

proc getJNIEnv*(): ptr JNIEnv =
  ## Get JNIEnv for current thread
  ## Attaches thread if necessary
  if tlsEnv != nil:
    return tlsEnv

  # Attach current thread
  var env: ptr JNIEnv = nil
  let attachResult = gJavaVM.AttachCurrentThread(addr env, nil)
  if attachResult != JNI_OK:
    raise newException(JNIError, "Failed to attach thread to JVM")

  tlsEnv = env
  return env

proc JNI_OnLoad*(vm: ptr JavaVM, reserved: pointer): jint {.exportc, dynlib.} =
  ## Called when library is loaded
  ## Cache JavaVM pointer for later thread attachment
  gJavaVM = vm
  return JNI_VERSION_1_6
```

### 3. Class Loading & Caching (jni/bridge.nim)

```nim
type
  ClassCache = Table[string, jclass]

var classCache {.threadvar.}: ClassCache

proc findClass*(className: string): jclass =
  ## Load a Java class by name
  ## Uses cache to avoid repeated lookups
  ##
  ## Example: findClass("android/util/Log")

  # Check cache first
  if className in classCache:
    return classCache[className]

  let env = getJNIEnv()

  # Load class
  let clazz = env.FindClass(cstring(className))
  if clazz == nil:
    let exc = env.ExceptionOccurred()
    if exc != nil:
      env.ExceptionClear()
    raise newException(JNIClassNotFound,
      "Class not found: " & className)

  # Create global reference (so it persists)
  let globalRef = env.NewGlobalRef(clazz)
  env.DeleteLocalRef(clazz)

  # Cache it
  classCache[className] = globalRef
  return globalRef

proc getMethodID*(clazz: jclass, methodName: string,
                  signature: string, isStatic: bool = false): jmethodID =
  ## Get method ID for calling later
  ##
  ## Example: getMethodID(logClass, "d", "(Ljava/lang/String;Ljava/lang/String;)I")

  let env = getJNIEnv()

  let methodID = if isStatic:
    env.GetStaticMethodID(clazz, cstring(methodName), cstring(signature))
  else:
    env.GetMethodID(clazz, cstring(methodName), cstring(signature))

  if methodID == nil:
    env.ExceptionClear()
    raise newException(JNIMethodNotFound,
      "Method not found: " & methodName & " " & signature)

  return methodID
```

### 4. Type Conversions (jni/conversions.nim)

```nim
# Nim string → jstring
proc toJString*(s: string): jstring =
  let env = getJNIEnv()
  result = env.NewStringUTF(cstring(s))
  if result == nil:
    raise newException(JNIError, "Failed to create jstring")

# jstring → Nim string
proc fromJString*(js: jstring): string =
  if js == nil:
    return ""

  let env = getJNIEnv()

  # Get string bytes
  let cstr = env.GetStringUTFChars(js, nil)
  if cstr == nil:
    raise newException(JNIError, "Failed to get string chars")

  # Copy to Nim string
  result = $cstr

  # Release
  env.ReleaseStringUTFChars(js, cstr)

# Nim seq → jarray
proc toJArray*[T](s: seq[T]): jarray =
  let env = getJNIEnv()
  let len = s.len.jsize

  when T is int32:
    result = env.NewIntArray(len)
    if result == nil:
      raise newException(JNIError, "Failed to create int array")
    env.SetIntArrayRegion(result, 0, len, addr s[0])

  elif T is string:
    let stringClass = findClass("java/lang/String")
    result = env.NewObjectArray(len, stringClass, nil)
    if result == nil:
      raise newException(JNIError, "Failed to create String array")

    for i, str in s:
      let jstr = toJString(str)
      env.SetObjectArrayElement(result, i.jsize, jstr)
      env.DeleteLocalRef(jstr)

  # Add more type specializations as needed

# jarray → Nim seq
proc fromJArray*[T](jarr: jarray): seq[T] =
  if jarr == nil:
    return @[]

  let env = getJNIEnv()
  let len = env.GetArrayLength(jarr)

  result = newSeq[T](len)

  when T is int32:
    env.GetIntArrayRegion(jarr, 0, len, addr result[0])

  elif T is string:
    for i in 0..<len:
      let jstr = cast[jstring](env.GetObjectArrayElement(jarr, i))
      result[i] = fromJString(jstr)
      env.DeleteLocalRef(jstr)
```

### 5. Method Invocation (jni/bridge.nim)

```nim
# Call void method
proc callVoidMethod*(obj: jobject, methodID: jmethodID,
                     args: varargs[jvalue]) =
  let env = getJNIEnv()
  env.CallVoidMethodA(obj, methodID, unsafeAddr args[0])
  checkException()

# Call method returning object
proc callObjectMethod*(obj: jobject, methodID: jmethodID,
                       args: varargs[jvalue]): jobject =
  let env = getJNIEnv()
  result = env.CallObjectMethodA(obj, methodID, unsafeAddr args[0])
  checkException()

# Call method returning int
proc callIntMethod*(obj: jobject, methodID: jmethodID,
                    args: varargs[jvalue]): jint =
  let env = getJNIEnv()
  result = env.CallIntMethodA(obj, methodID, unsafeAddr args[0])
  checkException()

# Call method returning boolean
proc callBooleanMethod*(obj: jobject, methodID: jmethodID,
                        args: varargs[jvalue]): bool =
  let env = getJNIEnv()
  let jbool = env.CallBooleanMethodA(obj, methodID, unsafeAddr args[0])
  checkException()
  return jbool != 0

# Static method variants
proc callStaticVoidMethod*(clazz: jclass, methodID: jmethodID,
                           args: varargs[jvalue]) =
  let env = getJNIEnv()
  env.CallStaticVoidMethodA(clazz, methodID, unsafeAddr args[0])
  checkException()

proc callStaticIntMethod*(clazz: jclass, methodID: jmethodID,
                          args: varargs[jvalue]): jint =
  let env = getJNIEnv()
  result = env.CallStaticIntMethodA(clazz, methodID, unsafeAddr args[0])
  checkException()

# Helper for creating jvalue array
proc makeJValues*(args: varargs[JValue]): seq[jvalue] =
  result = newSeq[jvalue](args.len)
  for i, arg in args:
    result[i] = arg.raw
```

### 6. Exception Handling (jni/bridge.nim)

```nim
type
  JNIError* = object of CatchableError
  JNIClassNotFound* = object of JNIError
  JNIMethodNotFound* = object of JNIError
  JavaException* = object of CatchableError
    javaClassName*: string
    javaMessage*: string
    javaStackTrace*: string

proc checkException*() =
  ## Check if Java exception occurred and convert to Nim exception
  let env = getJNIEnv()

  let exc = env.ExceptionOccurred()
  if exc == nil:
    return

  # Clear so we can call JNI methods to inspect it
  env.ExceptionClear()

  # Get exception class name
  let excClass = env.GetObjectClass(exc)
  let classNameMethod = env.GetMethodID(excClass, "getName", "()Ljava/lang/String;")
  let classNameObj = cast[jstring](env.CallObjectMethod(excClass, classNameMethod))
  let className = fromJString(classNameObj)

  # Get exception message
  let messageMethod = env.GetMethodID(excClass, "getMessage", "()Ljava/lang/String;")
  let messageObj = cast[jstring](env.CallObjectMethod(exc, messageMethod))
  let message = fromJString(messageObj)

  # Get stack trace (optional, expensive)
  let stackTrace = "" # TODO: implement if needed

  # Clean up local refs
  env.DeleteLocalRef(excClass)
  env.DeleteLocalRef(classNameObj)
  env.DeleteLocalRef(messageObj)
  env.DeleteLocalRef(exc)

  # Raise Nim exception
  var nimExc = newException(JavaException,
    "Java exception: " & className & ": " & message)
  nimExc.javaClassName = className
  nimExc.javaMessage = message
  nimExc.javaStackTrace = stackTrace

  raise nimExc
```

### 7. Reference Management (jni/bridge.nim)

```nim
type
  LocalRef*[T] = object
    raw: T
    env: ptr JNIEnv

  GlobalRef*[T] = object
    raw: T

proc newLocalRef*[T](obj: T): LocalRef[T] =
  ## Wrap a jobject as a local reference
  ## Will be automatically cleaned up
  result.raw = obj
  result.env = getJNIEnv()

proc delete*[T](localRef: sink LocalRef[T]) =
  ## Explicitly delete local reference
  if localRef.raw != nil:
    localRef.env.DeleteLocalRef(cast[jobject](localRef.raw))

proc newGlobalRef*[T](obj: T): GlobalRef[T] =
  ## Create a global reference that persists
  let env = getJNIEnv()
  result.raw = cast[T](env.NewGlobalRef(cast[jobject](obj)))

proc delete*[T](globalRef: sink GlobalRef[T]) =
  ## Delete global reference
  if globalRef.raw != nil:
    let env = getJNIEnv()
    env.DeleteGlobalRef(cast[jobject](globalRef.raw))

# RAII helper for local refs
template withLocalFrame*(size: jint, body: untyped) =
  let env = getJNIEnv()
  discard env.PushLocalFrame(size)
  try:
    body
  finally:
    env.PopLocalFrame(nil)
```

## High-Level Wrapper Example

```nim
# High-level wrapper for android.util.Log
type
  AndroidLog* = object
    logClass: jclass
    debugMethod: jmethodID
    infoMethod: jmethodID
    errorMethod: jmethodID

proc initAndroidLog*(): AndroidLog =
  result.logClass = findClass("android/util/Log")
  result.debugMethod = getMethodID(result.logClass, "d",
    "(Ljava/lang/String;Ljava/lang/String;)I", isStatic = true)
  result.infoMethod = getMethodID(result.logClass, "i",
    "(Ljava/lang/String;Ljava/lang/String;)I", isStatic = true)
  result.errorMethod = getMethodID(result.logClass, "e",
    "(Ljava/lang/String;Ljava/lang/String;)I", isStatic = true)

proc debug*(log: AndroidLog, tag: string, message: string) =
  let tagJS = toJString(tag)
  let msgJS = toJString(message)

  discard callStaticIntMethod(log.logClass, log.debugMethod,
    makeJValues(tagJS, msgJS))

  # Clean up local refs
  let env = getJNIEnv()
  env.DeleteLocalRef(tagJS)
  env.DeleteLocalRef(msgJS)

# Usage:
let log = initAndroidLog()
log.debug("Druid", "Hello from Nim!")
```

## JNI Signature Reference

### Primitive Types
| Java Type | Signature |
|-----------|-----------|
| boolean   | Z         |
| byte      | B         |
| char      | C         |
| short     | S         |
| int       | I         |
| long      | J         |
| float     | F         |
| double    | D         |
| void      | V         |

### Reference Types
| Java Type | Signature |
|-----------|-----------|
| String    | Ljava/lang/String; |
| Object    | Ljava/lang/Object; |
| MyClass   | Lcom/example/MyClass; |

### Arrays
| Java Type | Signature |
|-----------|-----------|
| int[]     | [I        |
| String[]  | [Ljava/lang/String; |

### Methods
```
MethodName(param1, param2, ...)ReturnType

Examples:
void foo()                        → "()V"
int bar(String s)                 → "(Ljava/lang/String;)I"
String baz(int a, boolean b)      → "(IZ)Ljava/lang/String;"
void qux(String[] arr, Object o)  → "([Ljava/lang/String;Ljava/lang/Object;)V"
```

## Performance Optimization

### 1. Cache Everything
```nim
# BAD: Load class every time
proc slowLog(msg: string) =
  let logClass = findClass("android/util/Log")  # Slow!
  # ...

# GOOD: Load once, cache globally
var gLogClass: jclass = nil
var gLogDebugMethod: jmethodID = nil

proc initLog() =
  gLogClass = findClass("android/util/Log")
  gLogDebugMethod = getMethodID(gLogClass, "d", "(...)")

proc fastLog(msg: string) =
  # Use cached class and method
  discard callStaticIntMethod(gLogClass, gLogDebugMethod, ...)
```

### 2. Minimize JNI Calls
```nim
# BAD: Multiple calls
for i in 0..100:
  javaObj.callMethod("doSomething", i)  # 100 JNI calls

# GOOD: Batch if possible
let arr = toJArray(@[0..100])
javaObj.callMethod("doSomethingBatch", arr)  # 1 JNI call
```

### 3. Use Local Frames
```nim
# BAD: Creates many local refs
for i in 0..10000:
  let str = toJString("item" & $i)  # 10000 local refs!
  # ... use str

# GOOD: Use local frame to auto-cleanup
for i in 0..10000:
  withLocalFrame(10):
    let str = toJString("item" & $i)
    # ... use str
    # Automatically cleaned up at end of withLocalFrame
```

## Error Handling Patterns

```nim
# Pattern 1: Let exceptions bubble up
proc riskyOperation*() =
  let result = callObjectMethod(obj, method)
  checkException()  # Will raise JavaException if failed

# Pattern 2: Return Result type
proc safeOperation*(): Result[int, string] =
  try:
    let value = callIntMethod(obj, method)
    checkException()
    return ok(value)
  except JavaException as e:
    return err(e.msg)

# Pattern 3: Return Option type
proc maybeGetValue*(): Option[string] =
  try:
    let jstr = callObjectMethod(obj, method)
    checkException()
    if jstr == nil:
      return none(string)
    return some(fromJString(cast[jstring](jstr)))
  except JavaException:
    return none(string)
```

## Testing Strategy

### Unit Tests
```nim
# Test type conversions
test "string conversion roundtrip":
  let orig = "Hello, Android!"
  let jstr = toJString(orig)
  let back = fromJString(jstr)
  check back == orig

# Test class loading
test "load android.util.Log":
  let logClass = findClass("android/util/Log")
  check logClass != nil

# Test method invocation
test "call Log.d()":
  let log = initAndroidLog()
  log.debug("TEST", "This is a test")
  # Verify in logcat: adb logcat | grep TEST
```

### Integration Tests
```nim
# Test with real Android app
test "full JNI stack":
  # Initialize runtime
  let runtime = AndroidRuntime.init()

  # Use log
  runtime.log.debug("TEST", "Integration test")

  # Should not crash, should appear in logcat
```

## Common Pitfalls

### 1. Forgetting to Check Exceptions
```nim
# BAD
let result = env.CallObjectMethod(obj, method)
# If Java threw exception, result is undefined!

# GOOD
let result = env.CallObjectMethod(obj, method)
checkException()  # Will raise if Java exception occurred
```

### 2. Local Reference Leaks
```nim
# BAD
for i in 0..10000:
  let jstr = toJString("item" & $i)  # Creates local ref
  # Never deleted! Will crash after ~512 local refs

# GOOD
for i in 0..10000:
  let jstr = toJString("item" & $i)
  # ... use jstr
  env.DeleteLocalRef(jstr)  # Explicit cleanup
```

### 3. Wrong Thread JNIEnv
```nim
# BAD
var globalEnv: ptr JNIEnv = nil

proc init() =
  globalEnv = getJNIEnv()  # Gets env for current thread

proc worker() {.thread.} =
  # Using globalEnv here will crash!
  # JNIEnv is thread-specific

# GOOD
proc worker() {.thread.} =
  let env = getJNIEnv()  # Gets/creates env for THIS thread
  # Use env
```

### 4. Invalid Signatures
```nim
# BAD
let method = getMethodID(clazz, "toString", "()String")  # Wrong!

# GOOD
let method = getMethodID(clazz, "toString", "()Ljava/lang/String;")
# Note: Ljava/lang/String; not just String
```

## Next Steps

1. Implement all types in `jni/types.nim`
2. Implement core functions in `jni/bridge.nim`
3. Implement type conversions in `jni/conversions.nim`
4. Write unit tests for each function
5. Create high-level wrapper for android.util.Log as proof of concept
6. Test on real Android device

## References

- [JNI Specification](https://docs.oracle.com/javase/8/docs/technotes/guides/jni/spec/jniTOC.html)
- [Android JNI Tips](https://developer.android.com/training/articles/perf-jni)
- [Nim FFI Documentation](https://nim-lang.org/docs/manual.html#foreign-function-interface)
