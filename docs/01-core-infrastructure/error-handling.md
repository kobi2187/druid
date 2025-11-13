# Error Handling System

## Overview

Druid uses a hybrid error handling approach:
- **Exceptions** for programming errors and unexpected failures
- **Result types** for expected failures (permissions, network, etc.)
- **Option types** for values that may be absent

## Error Types

### Core Exceptions

```nim
# errors.nim

type
  DruidError* = object of CatchableError
    ## Base exception for all Druid errors

  RuntimeError* = object of DruidError
    ## Runtime not initialized or in invalid state

  JNIError* = object of DruidError
    ## JNI call failed
    jniErrorCode*: int

  JavaException* = object of DruidError
    ## Java exception occurred
    javaClassName*: string
    javaMessage*: string
    javaStackTrace*: string

  PermissionError* = object of DruidError
    ## Required permission not granted
    permission*: AndroidPermission
    rationale*: string

  UnsupportedFeatureError* = object of DruidError
    ## Feature not supported on this device/API level
    feature*: AndroidFeature
    requiredApiLevel*: int
    currentApiLevel*: int

  InvalidStateError* = object of DruidError
    ## Manager in invalid state for requested operation
    manager*: string
    state*: string
```

### Result Types

```nim
import std/[options, results]

type
  DruidResult*[T] = Result[T, DruidError]
  ## Result type for operations that can fail

# Common result patterns
proc tryGetValue(): DruidResult[int] =
  if someCondition:
    return ok(42)
  else:
    return err(newException(DruidError, "Failed to get value"))

# Usage
let result = tryGetValue()
if result.isOk:
  echo "Got value: ", result.get()
else:
  echo "Error: ", result.error.msg
```

## Exception Conversion (Java → Nim)

```nim
# In jni/bridge.nim (expanded)

proc convertJavaException*(exc: jthrowable): ref JavaException =
  ## Convert Java exception to Nim exception
  let env = getJNIEnv()

  # Get exception class
  let excClass = env.GetObjectClass(exc)
  let classClass = findClass("java/lang/Class")
  let getNameMethod = getMethodID(classClass, "getName", "()Ljava/lang/String;")
  let nameObj = callObjectMethod(cast[jobject](excClass), getNameMethod)
  let className = fromJString(cast[jstring](nameObj))

  # Get message
  let getMessageMethod = getMethodID(excClass, "getMessage", "()Ljava/lang/String;")
  let msgObj = callObjectMethod(exc, getMessageMethod)
  let message = if msgObj != nil:
    fromJString(cast[jstring](msgObj))
  else:
    ""

  # Get stack trace (optional)
  let stackTrace = "" # TODO: implement if needed for debugging

  # Create Nim exception
  result = newException(JavaException, className & ": " & message)
  result.javaClassName = className
  result.javaMessage = message
  result.javaStackTrace = stackTrace

proc checkException*() =
  ## Check for pending Java exception and convert to Nim exception
  let env = getJNIEnv()
  let exc = env.ExceptionOccurred()

  if exc != nil:
    env.ExceptionClear()
    let nimExc = convertJavaException(exc)
    env.DeleteLocalRef(exc)
    raise nimExc
```

## Error Handling Patterns

### Pattern 1: Exceptions for Programming Errors

```nim
proc audio*(): AudioManager =
  ## Get AudioManager - throws if runtime not initialized
  if not isInitialized():
    raise newException(RuntimeError,
      "AndroidRuntime not initialized")

  # Lazy init
  if gRuntime.audioManager.isNone:
    gRuntime.audioManager = some(AudioManager.init())

  return gRuntime.audioManager.get
```

### Pattern 2: Result for Expected Failures

```nim
proc requestPermission*(permission: AndroidPermission): DruidResult[bool] =
  ## Request permission - returns Result since denial is expected
  try:
    let granted = requestPermissionInternal(permission)
    return ok(granted)
  except JavaException as e:
    return err(newException(PermissionError,
      "Failed to request permission: " & e.msg))
```

### Pattern 3: Option for Missing Values

```nim
proc getCurrentActivity*(): Option[jobject] =
  ## Get current activity - returns None if no activity set
  if gRuntime.currentActivity.isSome:
    return some(gRuntime.currentActivity.get.raw)
  else:
    return none(jobject)
```

### Pattern 4: Graceful Degradation

```nim
proc playSound*(path: string): DruidResult[void] =
  ## Play sound - degrades gracefully if audio unavailable
  if not supportsAudio():
    return err(newException(UnsupportedFeatureError,
      "Audio not supported on this device"))

  try:
    playSoundInternal(path)
    return ok()
  except JavaException as e:
    return err(newException(DruidError, "Failed to play sound: " & e.msg))

# Usage with error handling
let result = playSound("beep.mp3")
if result.isErr:
  echo "Warning: Could not play sound: ", result.error.msg
  # Continue without sound
```

## Logging

### Log Levels

```nim
type
  LogLevel* = enum
    Debug,   # Detailed debugging info
    Info,    # General informational messages
    Warn,    # Warning but not error
    Error    # Error occurred

var gLogLevel {.threadvar.}: LogLevel = Info

proc setLogLevel*(level: LogLevel) =
  gLogLevel = level

proc shouldLog(level: LogLevel): bool =
  return level >= gLogLevel
```

### Android Log Integration

```nim
# Log to Android's logcat
proc logToAndroid(level: LogLevel, tag: string, message: string) =
  let logClass = findClass("android/util/Log")

  let methodName = case level
    of Debug: "d"
    of Info: "i"
    of Warn: "w"
    of Error: "e"

  let signature = "(Ljava/lang/String;Ljava/lang/String;)I"
  let method = getMethodID(logClass, methodName, signature, isStatic = true)

  let tagJS = toJString(tag)
  let msgJS = toJString(message)

  discard callStaticIntMethod(logClass, method, makeJValues(tagJS, msgJS))

  env.DeleteLocalRef(tagJS)
  env.DeleteLocalRef(msgJS)

# High-level logging API
proc debug*(tag: string, message: string) =
  if shouldLog(Debug):
    logToAndroid(Debug, tag, message)

proc info*(tag: string, message: string) =
  if shouldLog(Info):
    logToAndroid(Info, tag, message)

proc warn*(tag: string, message: string) =
  if shouldLog(Warn):
    logToAndroid(Warn, tag, message)

proc error*(tag: string, message: string) =
  if shouldLog(Error):
    logToAndroid(Error, tag, message)

# Exception logging
proc logException*(tag: string, e: ref Exception) =
  error(tag, e.msg & "\n" & e.getStackTrace())
```

### Usage

```nim
import druid/logging

proc someFunction() =
  debug("Druid", "Starting operation")

  try:
    riskyOperation()
    info("Druid", "Operation completed successfully")
  except JavaException as e:
    logException("Druid", e)
    raise  # Re-raise after logging
  except Exception as e:
    error("Druid", "Unexpected error: " & e.msg)
    raise
```

## Debug vs Release Behavior

```nim
# Compile-time debug checks
when defined(debug):
  template debugAssert(condition: bool, message: string) =
    if not condition:
      raise newException(AssertionDefect, message)

  proc validateState() =
    debugAssert(isInitialized(), "Runtime not initialized")
    debugAssert(getContext() != nil, "Context is null")
else:
  template debugAssert(condition: bool, message: string) =
    discard

  proc validateState() =
    discard  # No-op in release

# Usage
proc criticalOperation() =
  debugAssert(isInitialized(), "Must initialize before use")
  # ... operation
```

## Error Recovery

### Automatic Retry

```nim
proc retryOnFailure*[T](op: proc(): T, maxAttempts: int = 3): DruidResult[T] =
  ## Retry operation on failure
  var lastError: ref DruidError = nil

  for attempt in 1..maxAttempts:
    try:
      return ok(op())
    except DruidError as e:
      lastError = e
      if attempt < maxAttempts:
        debug("Druid", "Attempt " & $attempt & " failed, retrying...")
        sleep(100 * attempt)  # Exponential backoff

  return err(lastError)

# Usage
let result = retryOnFailure proc(): bool =
  connectToService()
```

### Fallback Strategies

```nim
proc playSoundWithFallback*(path: string) =
  ## Try multiple playback methods
  # Try AudioTrack (modern)
  var result = playSoundAudioTrack(path)
  if result.isOk:
    return

  # Fallback to MediaPlayer (older but more compatible)
  result = playSoundMediaPlayer(path)
  if result.isOk:
    return

  # Fallback to SoundPool (simple sounds)
  result = playSoundSoundPool(path)
  if result.isOk:
    return

  # All methods failed
  warn("Druid", "Could not play sound with any method")
```

## Testing Error Handling

```nim
# tests/test_errors.nim

import unittest
import druid/errors

suite "Error Handling":
  test "JavaException conversion":
    # Mock Java exception
    let exc = createMockJavaException("java.lang.NullPointerException",
                                       "Object is null")
    let nimExc = convertJavaException(exc)

    check nimExc.javaClassName == "java.lang.NullPointerException"
    check nimExc.javaMessage == "Object is null"

  test "Result type success":
    proc operation(): DruidResult[int] =
      return ok(42)

    let result = operation()
    check result.isOk
    check result.get() == 42

  test "Result type failure":
    proc operation(): DruidResult[int] =
      return err(newException(DruidError, "Failed"))

    let result = operation()
    check result.isErr
    check result.error.msg == "Failed"
```

## Best Practices

### 1. Use Appropriate Error Type
```nim
# BAD: Generic exception
if not hasPermission:
  raise newException(Exception, "No permission")

# GOOD: Specific exception
if not hasPermission:
  raise newException(PermissionError, "Camera permission required")
```

### 2. Provide Context
```nim
# BAD: Vague error
raise newException(DruidError, "Failed")

# GOOD: Detailed error
raise newException(DruidError,
  "Failed to initialize AudioManager: " &
  "API level " & $apiLevel & " does not support AudioTrack")
```

### 3. Clean Up on Error
```nim
# BAD: Leaks resources on error
let jstr = toJString("hello")
riskyOperation()  # May throw
env.DeleteLocalRef(jstr)

# GOOD: Use defer or try/finally
let jstr = toJString("hello")
defer: env.DeleteLocalRef(jstr)
riskyOperation()

# Or:
let jstr = toJString("hello")
try:
  riskyOperation()
finally:
  env.DeleteLocalRef(jstr)
```

### 4. Don't Swallow Errors Silently
```nim
# BAD: Silent failure
try:
  criticalOperation()
except:
  discard  # Ignores error completely

# GOOD: Log and handle
try:
  criticalOperation()
except Exception as e:
  error("Druid", "Critical operation failed: " & e.msg)
  # Take appropriate action (retry, fallback, notify user)
```

## Next Steps

1. Implement error types in errors.nim
2. Implement logging functions
3. Add exception conversion to jni/bridge.nim
4. Write error handling tests
5. Document error handling conventions for contributors

## References

- [Nim Exception Handling](https://nim-lang.org/docs/manual.html#exception-handling)
- [Nim Results Package](https://github.com/araq/results)
- [Android Log API](https://developer.android.com/reference/android/util/Log)
