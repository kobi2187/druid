## The JNI core: how Nim reaches Druid's Java side (android/druid, package
## `dev.druid`).
##
## Every service is a Java class of static methods with simple argument and
## result types, so one call primitive covers them all:
##
## ```nim
## let name = callStatic(string, "AppInfo", "packageName")
## callStatic(void, "Vibration", "vibrate", 300'i64, -1)
## ```
##
## The JNI signature is derived from the Nim types of the arguments and of the
## result, so it cannot disagree with them. Each call runs in its own JNI local
## frame (a native thread that never returns to Java would otherwise collect
## local references until the table overflows), and a Java exception becomes a
## `DruidError` (a `SecurityException` a `DruidPermissionError`).
##
## Strings cross as UTF-16, not "modified UTF-8": `NewStringUTF` with an emoji
## aborts the process under Android's CheckJNI.
##
## Before `startDruid` (and on a desktop build that never starts it) calls raise
## `DruidNotStarted`; the service modules answer neutral defaults instead, via
## `bridged`.

import std/[tables, locks, unicode, options, strutils]
import jnim/private/jni_wrapper

export jni_wrapper.JNIEnvPtr, jni_wrapper.JavaVMPtr, jni_wrapper.jobject,
       jni_wrapper.JClass, jni_wrapper.jint, jni_wrapper.jlong, jni_wrapper.jstring

type
  DruidError* = object of CatchableError
    ## A call into Android failed; the message names the Java exception.
  DruidPermissionError* = object of DruidError
    ## Android refused for want of a permission (a `SecurityException`).
  DruidNotStarted* = object of DruidError
    ## No JVM attached: `startDruid` was not called (or this is a desktop build).

  JArgKind = enum
    akBool, akInt, akLong, akFloat, akDouble, akString, akNull,
    akBytes, akInts, akLongs, akStrings

  JArg* = object
    ## One argument of a Java call. Made implicitly from bool, int/int32 (Java
    ## int), int64 (long), float32, float/float64 (double), string, seq[byte],
    ## seq[int32], seq[int64], seq[string]; `jnull` is a null String.
    case kind: JArgKind
    of akBool: b: bool
    of akInt: i: int32
    of akLong: l: int64
    of akFloat: f: float32
    of akDouble: d: float64
    of akString: s: string
    of akNull: discard
    of akBytes: bytes: seq[byte]
    of akInts: ints: seq[int32]
    of akLongs: longs: seq[int64]
    of akStrings: strings: seq[string]

  WakeHook* = proc() {.nimcall, gcsafe.}
    ## Called on the Java thread that posted an event. Keep it to waking a loop
    ## (it must not allocate: that thread is not a Nim thread).

const
  JNI_OK = 0.jint
  JNI_EDETACHED = -2.jint
  druidPackage = "dev/druid/"

proc toJArg*(x: bool): JArg = JArg(kind: akBool, b: x)
proc toJArg*(x: int): JArg = JArg(kind: akInt, i: int32(x))
proc toJArg*(x: int32): JArg = JArg(kind: akInt, i: x)
proc toJArg*(x: int64): JArg = JArg(kind: akLong, l: x)
proc toJArg*(x: float32): JArg = JArg(kind: akFloat, f: x)
proc toJArg*(x: float64): JArg = JArg(kind: akDouble, d: x)
proc toJArg*(x: string): JArg = JArg(kind: akString, s: x)
proc toJArg*(x: seq[byte]): JArg = JArg(kind: akBytes, bytes: x)
proc toJArg*(x: seq[int32]): JArg = JArg(kind: akInts, ints: x)
proc toJArg*(x: seq[int64]): JArg = JArg(kind: akLongs, longs: x)
proc toJArg*(x: seq[string]): JArg = JArg(kind: akStrings, strings: x)
proc toJArg*(x: Option[string]): JArg =
  if x.isSome: toJArg(x.get) else: JArg(kind: akNull)
proc toJArg*(x: JArg): JArg = x

const jnull* = JArg(kind: akNull)  ## A null String argument.

proc sig(a: JArg): string =
  case a.kind
  of akBool: "Z"
  of akInt: "I"
  of akLong: "J"
  of akFloat: "F"
  of akDouble: "D"
  of akString, akNull: "Ljava/lang/String;"
  of akBytes: "[B"
  of akInts: "[I"
  of akLongs: "[J"
  of akStrings: "[Ljava/lang/String;"

template retSig(T: typedesc): string =
  when T is void: "V"
  elif T is bool: "Z"
  elif T is int32 or T is int: "I"
  elif T is int64: "J"
  elif T is float32: "F"
  elif T is float64: "D"
  elif T is string or T is Option[string]: "Ljava/lang/String;"
  elif T is seq[string]: "[Ljava/lang/String;"
  elif T is seq[byte]: "[B"
  elif T is seq[int32] or T is seq[int]: "[I"
  elif T is seq[int64]: "[J"
  elif T is seq[float32]: "[F"
  elif T is seq[float64]: "[D"
  else: {.error: "callStatic: unsupported result type " & $T.}

proc jniSignature*(args: openArray[JArg], ret: string): string =
  ## The JNI method signature for `args` returning (JNI-typed) `ret`.
  result = "("
  for a in args: result.add sig(a)
  result.add ")"
  result.add ret

# ---- UTF-8 <-> UTF-16 ----

proc toUtf16*(s: string): seq[uint16] =
  ## `s` (UTF-8) as UTF-16 code units. Invalid UTF-8 (a stray byte, a
  ## truncated or overlong sequence, an encoded surrogate) becomes U+FFFD.
  result = newSeqOfCap[uint16](s.len)
  var i = 0
  while i < s.len:
    let b0 = int32(s[i])
    var cp = 0xFFFD'i32
    var need = 0
    var minCp = 0'i32
    if b0 < 0x80: cp = b0
    elif (b0 and 0xE0) == 0xC0: need = 1; cp = b0 and 0x1F; minCp = 0x80
    elif (b0 and 0xF0) == 0xE0: need = 2; cp = b0 and 0x0F; minCp = 0x800
    elif (b0 and 0xF8) == 0xF0: need = 3; cp = b0 and 0x07; minCp = 0x10000
    inc i
    if b0 >= 0x80 and need == 0:
      cp = 0xFFFD                                # a continuation byte or 0xF8..0xFF
    elif need > 0:
      var ok = true
      for k in 0 ..< need:
        if i < s.len and (int32(s[i]) and 0xC0) == 0x80:
          cp = (cp shl 6) or (int32(s[i]) and 0x3F)
          inc i
        else:
          ok = false
          break
      if not ok or cp < minCp or cp > 0x10FFFF or (cp >= 0xD800 and cp <= 0xDFFF):
        cp = 0xFFFD
    if cp >= 0x10000:
      let v = cp - 0x10000
      result.add uint16(0xD800 + (v shr 10))
      result.add uint16(0xDC00 + (v and 0x3FF))
    else:
      result.add uint16(cp)

proc fromUtf16*(units: openArray[uint16]): string =
  ## UTF-16 code units as UTF-8; a lone surrogate becomes U+FFFD.
  result = newStringOfCap(units.len)
  var i = 0
  while i < units.len:
    let u = int32(units[i])
    inc i
    if u >= 0xD800 and u <= 0xDBFF and i < units.len and
       units[i] >= 0xDC00'u16 and units[i] <= 0xDFFF'u16:
      let lo = int32(units[i])
      inc i
      result.add $Rune(0x10000 + ((u - 0xD800) shl 10) + (lo - 0xDC00))
    elif u >= 0xD800 and u <= 0xDFFF:
      result.add $Rune(0xFFFD)
    else:
      result.add $Rune(u)

# ---- state ----

var
  gLock: Lock
  gVm: JavaVMPtr
  gDruidClass: JClass                    # global ref
  gClasses: Table[string, JClass]        # global refs, by simple name
  gMethods: Table[string, jmethodID]
  gWake: WakeHook
initLock(gLock)

# A thread Druid attached must detach before it exits, or ART aborts the app
# ("thread exited while attached"). A pthread key's destructor does it for
# threads Druid attached itself -- RUI's, which never returns to Java.
when not defined(windows):
  import std/posix
  var gDetachKey: Pthread_key
  var gDetachKeyMade: bool

  proc detachOnExit(vm: pointer) {.noconv.} =
    let v = cast[JavaVMPtr](vm)
    if v != nil: discard v.DetachCurrentThread(v)

  proc detachWhenThreadExits(vm: JavaVMPtr) =
    {.cast(gcsafe).}:
      withLock gLock:
        if not gDetachKeyMade:
          gDetachKeyMade = pthread_key_create(addr gDetachKey, detachOnExit) == 0
      if gDetachKeyMade: discard pthread_setspecific(gDetachKey, cast[pointer](vm))

  proc forgetDetach() =
    {.cast(gcsafe).}:
      if gDetachKeyMade: discard pthread_setspecific(gDetachKey, nil)
else:
  proc detachWhenThreadExits(vm: JavaVMPtr) = discard
  proc forgetDetach() = discard

proc druidStarted*(): bool =
  ## Whether a JVM is attached (`startDruid` succeeded and `stopDruid` was not called).
  {.cast(gcsafe).}: gVm != nil

template bridged*(default, body: untyped): untyped =
  ## `body` when Druid is started, else `default`: how the service modules
  ## answer on the desktop, so one program builds for both.
  (if druidStarted(): body else: default)

proc currentEnv*(): JNIEnvPtr =
  ## This thread's JNIEnv, attaching the thread to the JVM if it is not yet.
  {.cast(gcsafe).}:
    let vm = gVm
  if vm == nil:
    raise newException(DruidNotStarted, "Druid is not started (call startDruid)")
  var p: pointer
  var rc = vm.GetEnv(vm, addr p, JNI_VERSION_1_6)
  if rc == JNI_EDETACHED:
    rc = vm.AttachCurrentThread(vm, addr p, nil)
    if rc == JNI_OK: detachWhenThreadExits(vm)
  if rc != JNI_OK or p == nil:
    raise newException(DruidError, "cannot attach this thread to the JVM (" & $rc & ")")
  cast[JNIEnvPtr](p)

proc detachThread*() =
  ## Detach the calling thread from the JVM now. Threads Druid attached are
  ## detached when they exit anyway; never call it on a thread Java started.
  {.cast(gcsafe).}:
    let vm = gVm
  forgetDetach()
  if vm != nil: discard vm.DetachCurrentThread(vm)

# ---- strings and arrays ----

proc newJString*(env: JNIEnvPtr, s: string): jstring =
  ## A Java String (a local reference) holding `s`, for your own JNI code.
  let u = toUtf16(s)
  env.NewString(env, if u.len > 0: cast[ptr jchar](unsafeAddr u[0]) else: nil, jsize(u.len))

proc toNim*(env: JNIEnvPtr, s: jstring): string =
  ## The text of Java String `s` ("" for null), for your own JNI code.
  if s == nil: return ""
  let n = env.GetStringLength(env, s)
  if n <= 0: return ""
  var u = newSeq[uint16](n)
  env.GetStringRegion(env, s, 0, n, cast[ptr jchar](addr u[0]))
  fromUtf16(u)

proc classOf(env: JNIEnvPtr, simple: string): JClass

proc checkException(env: JNIEnvPtr, what: string) =
  if env.ExceptionCheck(env) == JVM_FALSE: return
  let exc = env.ExceptionOccurred(env)
  env.ExceptionClear(env)
  var msg = "Java exception"
  if exc != nil:
    let c = env.GetObjectClass(env, exc)
    let toS = env.GetMethodID(env, c, "toString", "()Ljava/lang/String;")
    if toS != nil:
      let s = env.CallObjectMethodA(env, exc, toS, nil)
      if env.ExceptionCheck(env) != JVM_FALSE: env.ExceptionClear(env)
      else: msg = toNim(env, cast[jstring](s))
      if s != nil: env.DeleteLocalRef(env, s)
    else:
      env.ExceptionClear(env)
    env.DeleteLocalRef(env, c)
    env.DeleteLocalRef(env, exc)
  let full = what & ": " & msg
  if msg.startsWith("java.lang.SecurityException"):
    raise newException(DruidPermissionError, full)
  raise newException(DruidError, full)

proc toJValue(env: JNIEnvPtr, a: JArg): jvalue =
  case a.kind
  of akBool: result.z = if a.b: JVM_TRUE else: JVM_FALSE
  of akInt: result.i = a.i
  of akLong: result.j = a.l
  of akFloat: result.f = a.f
  of akDouble: result.d = a.d
  of akString: result.l = newJString(env, a.s)
  of akNull: result.l = nil
  of akBytes:
    let arr = env.NewByteArray(env, jsize(a.bytes.len))
    if a.bytes.len > 0:
      env.SetByteArrayRegion(env, arr, 0, jsize(a.bytes.len), cast[ptr jbyte](unsafeAddr a.bytes[0]))
    result.l = arr
  of akInts:
    let arr = env.NewIntArray(env, jsize(a.ints.len))
    if a.ints.len > 0:
      env.SetIntArrayRegion(env, arr, 0, jsize(a.ints.len), cast[ptr jint](unsafeAddr a.ints[0]))
    result.l = arr
  of akLongs:
    let arr = env.NewLongArray(env, jsize(a.longs.len))
    if a.longs.len > 0:
      env.SetLongArrayRegion(env, arr, 0, jsize(a.longs.len), cast[ptr jlong](unsafeAddr a.longs[0]))
    result.l = arr
  of akStrings:
    let strCls = env.FindClass(env, "java/lang/String")
    let arr = env.NewObjectArray(env, jsize(a.strings.len), strCls, nil)
    for k, s in a.strings:
      let js = newJString(env, s)
      env.SetObjectArrayElement(env, arr, jsize(k), js)
      env.DeleteLocalRef(env, js)
    result.l = arr

proc readStrings(env: JNIEnvPtr, o: jobject): seq[string] =
  if o == nil: return
  let arr = cast[jobjectArray](o)
  let n = env.GetArrayLength(env, arr)
  for k in 0 ..< n:
    let e = env.GetObjectArrayElement(env, arr, k)
    result.add toNim(env, cast[jstring](e))
    if e != nil: env.DeleteLocalRef(env, e)

proc readBytes(env: JNIEnvPtr, o: jobject): seq[byte] =
  if o == nil: return
  let n = env.GetArrayLength(env, cast[jarray](o))
  result = newSeq[byte](n)
  if n > 0: env.GetByteArrayRegion(env, cast[jbyteArray](o), 0, n, cast[ptr jbyte](addr result[0]))

proc readInts(env: JNIEnvPtr, o: jobject): seq[int32] =
  if o == nil: return
  let n = env.GetArrayLength(env, cast[jarray](o))
  result = newSeq[int32](n)
  if n > 0: env.GetIntArrayRegion(env, cast[jintArray](o), 0, n, addr result[0])

proc readLongs(env: JNIEnvPtr, o: jobject): seq[int64] =
  if o == nil: return
  let n = env.GetArrayLength(env, cast[jarray](o))
  result = newSeq[int64](n)
  if n > 0: env.GetLongArrayRegion(env, cast[jlongArray](o), 0, n, addr result[0])

proc readFloats(env: JNIEnvPtr, o: jobject): seq[float32] =
  if o == nil: return
  let n = env.GetArrayLength(env, cast[jarray](o))
  result = newSeq[float32](n)
  if n > 0: env.GetFloatArrayRegion(env, cast[jfloatArray](o), 0, n, addr result[0])

proc readDoubles(env: JNIEnvPtr, o: jobject): seq[float64] =
  if o == nil: return
  let n = env.GetArrayLength(env, cast[jarray](o))
  result = newSeq[float64](n)
  if n > 0: env.GetDoubleArrayRegion(env, cast[jdoubleArray](o), 0, n, addr result[0])

# ---- classes and methods ----

proc classOf(env: JNIEnvPtr, simple: string): JClass =
  ## The global ref of `dev.druid.<simple>`, loaded through Druid's class loader
  ## (JNI's FindClass, on a thread Java did not start, sees only system classes).
  {.cast(gcsafe).}:
    withLock gLock:
      if simple == "Druid": return gDruidClass
      result = gClasses.getOrDefault(simple)
      if result != nil: return
      let druid = gDruidClass
      if druid == nil: raise newException(DruidNotStarted, "Druid is not started")
      let mid = env.GetStaticMethodID(env, druid, "cls", "(Ljava/lang/String;)Ljava/lang/Class;")
      checkException(env, "Druid.cls")
      if env.PushLocalFrame(env, 4) != JNI_OK:
        raise newException(DruidError, "JNI: out of local references")
      var arg: jvalue
      arg.l = newJString(env, simple)
      let local = env.CallStaticObjectMethodA(env, druid, mid, addr arg)
      try:
        checkException(env, "class dev.druid." & simple)
      except DruidError:
        discard env.PopLocalFrame(env, nil)
        raise
      result = cast[JClass](env.NewGlobalRef(env, local))
      discard env.PopLocalFrame(env, nil)
      gClasses[simple] = result

proc methodOf(env: JNIEnvPtr, cls: JClass, clsName, name, signature: string): jmethodID =
  let key = clsName & "." & name & signature
  {.cast(gcsafe).}:
    withLock gLock:
      result = gMethods.getOrDefault(key)
      if result != nil: return
      result = env.GetStaticMethodID(env, cls, name, signature)
      if result == nil or env.ExceptionCheck(env) != JVM_FALSE:
        env.ExceptionClear(env)
        raise newException(DruidError, "no Java method dev.druid." & clsName & "." &
                           name & signature & " (is the druid Android library current?)")
      gMethods[key] = result

proc callStatic*(T: typedesc, cls, name: string, args: varargs[JArg, toJArg]): T =
  ## Calls static `dev.druid.<cls>.<name>` with `args`, returning a `T`: void,
  ## bool, int/int32, int64, float32, float64, string (null is ""),
  ## Option[string] (null is none), or a seq of string, byte, int32, int64,
  ## float32 or float64 (null is empty).
  let env = currentEnv()
  let c = classOf(env, cls)
  let mid = methodOf(env, c, cls, name, jniSignature(args, retSig(T)))
  if env.PushLocalFrame(env, jint(16 + 2 * args.len)) != JNI_OK:
    raise newException(DruidError, "JNI: out of local references")
  defer: discard env.PopLocalFrame(env, nil)
  var jargs = newSeq[jvalue](args.len)
  for k, a in args: jargs[k] = toJValue(env, a)
  let ap = if jargs.len > 0: addr jargs[0] else: nil
  let what = cls & "." & name
  when T is void:
    env.CallStaticVoidMethodA(env, c, mid, ap)
    checkException(env, what)
  elif T is bool:
    let r = env.CallStaticBooleanMethodA(env, c, mid, ap)
    checkException(env, what)
    r != JVM_FALSE
  elif T is int32 or T is int:
    let r = env.CallStaticIntMethodA(env, c, mid, ap)
    checkException(env, what)
    T(r)
  elif T is int64:
    let r = env.CallStaticLongMethodA(env, c, mid, ap)
    checkException(env, what)
    int64(r)
  elif T is float32:
    let r = env.CallStaticFloatMethodA(env, c, mid, ap)
    checkException(env, what)
    float32(r)
  elif T is float64:
    let r = env.CallStaticDoubleMethodA(env, c, mid, ap)
    checkException(env, what)
    float64(r)
  else:
    let o = env.CallStaticObjectMethodA(env, c, mid, ap)
    checkException(env, what)
    when T is string: toNim(env, cast[jstring](o))
    elif T is Option[string]:
      if o == nil: none(string) else: some(toNim(env, cast[jstring](o)))
    elif T is seq[string]: readStrings(env, o)
    elif T is seq[byte]: readBytes(env, o)
    elif T is seq[int32]: readInts(env, o)
    elif T is seq[int]:
      var r: seq[int]
      for v in readInts(env, o): r.add int(v)
      r
    elif T is seq[int64]: readLongs(env, o)
    elif T is seq[float32]: readFloats(env, o)
    elif T is seq[float64]: readDoubles(env, o)

# ---- start and stop ----

proc druidWake(env: JNIEnvPtr, cls: JClass) {.cdecl.} =
  {.cast(gcsafe).}:
    let w = gWake
  if w != nil: w()

proc setWakeHook*(hook: WakeHook) =
  ## `hook` runs (on a Java thread) whenever Android posts an event, so a loop
  ## that sleeps until input can wake and `pollEvents`. RUI's `wakeMainLoop` is one.
  {.cast(gcsafe).}:
    gWake = hook

proc loadDruidClass(env: JNIEnvPtr, context: jobject): JClass =
  # On a thread Java called into, FindClass uses the caller's loader; on a
  # native thread (RUI's), only the system's: then ask the Context's loader.
  var local = env.FindClass(env, druidPackage & "Druid")
  if local == nil or env.ExceptionCheck(env) != JVM_FALSE:
    env.ExceptionClear(env)
    let ctxCls = env.GetObjectClass(env, context)
    let getLoader = env.GetMethodID(env, ctxCls, "getClassLoader", "()Ljava/lang/ClassLoader;")
    checkException(env, "Context.getClassLoader")
    let loader = env.CallObjectMethodA(env, context, getLoader, nil)
    checkException(env, "Context.getClassLoader")
    let loaderCls = env.GetObjectClass(env, loader)
    let loadClass = env.GetMethodID(env, loaderCls, "loadClass", "(Ljava/lang/String;)Ljava/lang/Class;")
    var arg: jvalue
    arg.l = newJString(env, "dev.druid.Druid")
    local = cast[JClass](env.CallObjectMethodA(env, loader, loadClass, addr arg))
    checkException(env, "loading dev.druid.Druid (is the druid Android library in the app?)")
  cast[JClass](env.NewGlobalRef(env, local))

proc startDruid*(env: JNIEnvPtr, context: jobject) =
  ## Start Druid from native code that Java called (a `Java_...` function, or
  ## `JNI_OnLoad`), with any Android Context (an Activity is best: it is what
  ## permission requests and the keyboard show over). Idempotent.
  if env == nil or context == nil:
    raise newException(DruidError, "startDruid: nil JNIEnv or Context")
  var vm: JavaVMPtr
  if env.GetJavaVM(env, addr vm) != JNI_OK:
    raise newException(DruidError, "startDruid: GetJavaVM failed")
  if env.PushLocalFrame(env, 16) != JNI_OK:
    raise newException(DruidError, "JNI: out of local references")
  defer: discard env.PopLocalFrame(env, nil)
  let cls = loadDruidClass(env, context)
  {.cast(gcsafe).}:
    withLock gLock:
      if gDruidClass != nil: env.DeleteGlobalRef(env, gDruidClass)
      gDruidClass = cls
      gVm = vm
  let init = env.GetStaticMethodID(env, cls, "init", "(Landroid/content/Context;)V")
  checkException(env, "Druid.init")
  var arg: jvalue
  arg.l = context
  env.CallStaticVoidMethodA(env, cls, init, addr arg)
  checkException(env, "Druid.init")
  # Let Java wake us when it posts an event. Registered, not looked up by
  # symbol name: the library may not have been loaded by Java's System.loadLibrary.
  var m = JNINativeMethod(name: "wake", signature: "()V", fnPtr: cast[pointer](druidWake))
  if env.RegisterNatives(env, cls, addr m, 1) == JNI_OK:
    let setReg = env.GetStaticMethodID(env, cls, "setWakeRegistered", "(Z)V")
    var on: jvalue
    on.z = JVM_TRUE
    env.CallStaticVoidMethodA(env, cls, setReg, addr on)
  if env.ExceptionCheck(env) != JVM_FALSE: env.ExceptionClear(env)

proc startDruid*(vm: JavaVMPtr, context: jobject) =
  ## Start Druid from a native thread Java did not call (RUI's, a
  ## NativeActivity's): attaches the thread, then as above.
  if vm == nil: raise newException(DruidError, "startDruid: nil JavaVM")
  var p: pointer
  var rc = vm.GetEnv(vm, addr p, JNI_VERSION_1_6)
  if rc == JNI_EDETACHED:
    rc = vm.AttachCurrentThread(vm, addr p, nil)
    if rc == JNI_OK: detachWhenThreadExits(vm)
  if rc != JNI_OK: raise newException(DruidError, "startDruid: cannot attach thread (" & $rc & ")")
  startDruid(cast[JNIEnvPtr](p), context)

proc stopDruid*() =
  ## Forget the JVM and every cached class and method. After it, calls raise
  ## `DruidNotStarted` (services answer their defaults) until `startDruid`.
  if not druidStarted(): return
  let env = currentEnv()
  {.cast(gcsafe).}:
    withLock gLock:
      let cls = gDruidClass
      if cls != nil:
        var off: jvalue
        let setReg = env.GetStaticMethodID(env, cls, "setWakeRegistered", "(Z)V")
        if setReg != nil: env.CallStaticVoidMethodA(env, cls, setReg, addr off)
        if env.ExceptionCheck(env) != JVM_FALSE: env.ExceptionClear(env)
        discard env.UnregisterNatives(env, cls)
        env.DeleteGlobalRef(env, cls)
      for c in gClasses.values: env.DeleteGlobalRef(env, c)
      gClasses.clear()
      gMethods.clear()
      gDruidClass = nil
      gVm = nil
