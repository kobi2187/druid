# Resource Management

## Overview

Android resources (contexts, services, receivers, etc.) require careful lifecycle management. This document describes how Druid manages Android resources safely.

## Resource Types

### 1. Context References

```nim
type
  ContextRef* = object
    raw: GlobalRef[jobject]
    kind: ContextKind

  ContextKind = enum
    Application,  # Lives for app lifetime
    Activity,     # Lives for activity lifetime
    Service       # Lives for service lifetime

# Safe context access
proc getApplicationContext*(): jobject =
  ## Always safe - lives for app lifetime
  return gRuntime.applicationContext.raw

proc getActivityContext*(): Option[jobject] =
  ## May be None if no activity or activity destroyed
  if gRuntime.currentActivity.isSome:
    return some(gRuntime.currentActivity.get.raw)
  else:
    return none(jobject)
```

### 2. System Services

```nim
type
  SystemServiceRef* = object
    service: GlobalRef[jobject]
    serviceName: string
    initialized: bool

proc getSystemService*(serviceName: string): jobject =
  ## Get Android system service
  ## Cached to avoid repeated lookups
  let ctx = getApplicationContext()

  let contextClass = findClass("android/content/Context")
  let getSystemServiceMethod = getMethodID(contextClass, "getSystemService",
    "(Ljava/lang/String;)Ljava/lang/Object;")

  let serviceNameJS = toJString(serviceName)
  let service = callObjectMethod(ctx, getSystemServiceMethod,
    makeJValues(serviceNameJS))

  env.DeleteLocalRef(serviceNameJS)

  if service == nil:
    raise newException(DruidError,
      "System service not available: " & serviceName)

  return service

# Cached access
var gAudioService: Option[GlobalRef[jobject]]

proc getAudioService*(): jobject =
  if gAudioService.isNone:
    let service = getSystemService("audio")
    gAudioService = some(newGlobalRef(service))
    env.DeleteLocalRef(service)

  return gAudioService.get.raw
```

### 3. Broadcast Receivers

```nim
type
  BroadcastReceiver* = object
    filter: IntentFilter
    receiver: GlobalRef[jobject]
    registered: bool

proc registerReceiver*(action: string,
                       callback: proc(intent: jobject)): BroadcastReceiver =
  ## Register broadcast receiver for action
  let ctx = getApplicationContext()

  # Create IntentFilter
  let filterClass = findClass("android/content/IntentFilter")
  let filterInit = getMethodID(filterClass, "<init>",
    "(Ljava/lang/String;)V")
  let actionJS = toJString(action)
  let filter = newObject(filterClass, filterInit, makeJValues(actionJS))
  env.DeleteLocalRef(actionJS)

  # Create BroadcastReceiver wrapper (native → Java)
  let receiver = createReceiverWrapper(callback)

  # Register
  let registerMethod = getMethodID(findClass("android/content/Context"),
    "registerReceiver",
    "(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)" &
    "Landroid/content/Intent;")

  discard callObjectMethod(ctx, registerMethod,
    makeJValues(receiver, filter))

  result.filter = filter
  result.receiver = newGlobalRef(receiver)
  result.registered = true

proc unregisterReceiver*(receiver: var BroadcastReceiver) =
  ## Unregister broadcast receiver
  if not receiver.registered:
    return

  let ctx = getApplicationContext()
  let unregisterMethod = getMethodID(findClass("android/content/Context"),
    "unregisterReceiver",
    "(Landroid/content/BroadcastReceiver;)V")

  callVoidMethod(ctx, unregisterMethod,
    makeJValues(receiver.receiver.raw))

  delete(receiver.receiver)
  receiver.registered = false
```

### 4. Content Observers

```nim
type
  ContentObserver* = object
    observer: GlobalRef[jobject]
    uri: string
    registered: bool

proc registerContentObserver*(uri: string,
                               callback: proc()): ContentObserver =
  ## Observe content changes
  let ctx = getApplicationContext()

  # Get ContentResolver
  let getResolverMethod = getMethodID(findClass("android/content/Context"),
    "getContentResolver",
    "()Landroid/content/ContentResolver;")
  let resolver = callObjectMethod(ctx, getResolverMethod)

  # Parse URI
  let uriClass = findClass("android/net/Uri")
  let parseMethod = getMethodID(uriClass, "parse",
    "(Ljava/lang/String;)Landroid/net/Uri;", isStatic = true)
  let uriJS = toJString(uri)
  let parsedUri = callStaticObjectMethod(uriClass, parseMethod,
    makeJValues(uriJS))
  env.DeleteLocalRef(uriJS)

  # Create ContentObserver wrapper
  let observer = createObserverWrapper(callback)

  # Register
  let registerMethod = getMethodID(
    findClass("android/content/ContentResolver"),
    "registerContentObserver",
    "(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V")

  callVoidMethod(resolver, registerMethod,
    makeJValues(parsedUri, true, observer))

  result.observer = newGlobalRef(observer)
  result.uri = uri
  result.registered = true

proc unregisterContentObserver*(observer: var ContentObserver) =
  if not observer.registered:
    return

  # Unregister logic
  delete(observer.observer)
  observer.registered = false
```

## Lifecycle Management

### Activity Lifecycle

```nim
# Track activity lifecycle state
type
  ActivityState = enum
    Created,
    Started,
    Resumed,
    Paused,
    Stopped,
    Destroyed

var gActivityState: ActivityState = Destroyed

# Lifecycle callbacks (called from Java)
proc onActivityCreated*(activity: jobject) {.exportc, dynlib.} =
  gActivityState = Created
  if gRuntime.currentActivity.isSome:
    delete(gRuntime.currentActivity.get)
  gRuntime.currentActivity = some(newGlobalRef(activity))

  # Notify managers
  for manager in gRuntime.getAllManagers():
    if manager.hasLifecycleCallbacks:
      manager.onActivityCreated()

proc onActivityResumed*() {.exportc, dynlib.} =
  gActivityState = Resumed
  # Resume audio, video, sensors, etc.

proc onActivityPaused*() {.exportc, dynlib.} =
  gActivityState = Paused
  # Pause audio, video, save state

proc onActivityDestroyed*() {.exportc, dynlib.} =
  gActivityState = Destroyed
  if gRuntime.currentActivity.isSome:
    delete(gRuntime.currentActivity.get)
    gRuntime.currentActivity = none(GlobalRef[jobject])

  # Cleanup activity-scoped resources
```

### Resource Cleanup Patterns

```nim
# Pattern 1: RAII with destructors
type
  ManagedResource = object
    handle: GlobalRef[jobject]

proc `=destroy`(res: var ManagedResource) =
  if res.handle.raw != nil:
    delete(res.handle)

# Pattern 2: Explicit cleanup
type
  Resource = object
    handle: GlobalRef[jobject]

proc acquire(): Resource =
  result.handle = newGlobalRef(allocateResource())

proc release(res: var Resource) =
  if res.handle.raw != nil:
    freeResource(res.handle.raw)
    delete(res.handle)

# Usage with defer
proc useResource() =
  var res = acquire()
  defer: release(res)
  # Use resource

# Pattern 3: Scope-based
template withResource(name, acquireExpr, body) =
  var name = acquireExpr
  try:
    body
  finally:
    release(name)

# Usage
withResource(audio, acquireAudioResource()):
  audio.play("sound.mp3")
```

## Memory Management

### JNI Reference Tracking

```nim
when defined(debug):
  var gLocalRefCount {.threadvar.}: int
  var gGlobalRefCount: int

  proc trackLocalRef() =
    inc gLocalRefCount

  proc trackGlobalRef() =
    atomicInc(gGlobalRefCount)

  proc untrackLocalRef() =
    dec gLocalRefCount
    if gLocalRefCount < 0:
      warn("Druid", "Local ref count went negative!")

  proc printRefStats() =
    debug("Druid", "Local refs: " & $gLocalRefCount &
                    ", Global refs: " & $gGlobalRefCount)
else:
  template trackLocalRef() = discard
  template trackGlobalRef() = discard
  template untrackLocalRef() = discard
  template printRefStats() = discard

# Wrap ref creation to track
proc trackedNewGlobalRef[T](obj: T): GlobalRef[T] =
  trackGlobalRef()
  return newGlobalRef(obj)

proc trackedDeleteGlobalRef[T](ref: GlobalRef[T]) =
  untrackGlobalRef()
  delete(ref)
```

### Memory Pressure Response

```nim
proc onLowMemory*() {.exportc, dynlib.} =
  ## Called when system is low on memory
  info("Druid", "Low memory warning - clearing caches")

  # Clear caches in all managers
  if gRuntime.audioManager.isSome:
    gRuntime.audioManager.get.clearCache()

  if gRuntime.imageCache.isSome:
    gRuntime.imageCache.get.clear()

  # Force GC
  GC_fullCollect()

proc onTrimMemory*(level: jint) {.exportc, dynlib.} =
  ## Called when system wants app to trim memory
  ## level: TRIM_MEMORY_* constant

  const TRIM_MEMORY_RUNNING_MODERATE = 5
  const TRIM_MEMORY_RUNNING_LOW = 10
  const TRIM_MEMORY_RUNNING_CRITICAL = 15

  case level:
    of TRIM_MEMORY_RUNNING_MODERATE:
      # Trim non-essential caches
      info("Druid", "Trim memory: moderate")
    of TRIM_MEMORY_RUNNING_LOW:
      # Trim most caches
      info("Druid", "Trim memory: low")
      onLowMemory()
    of TRIM_MEMORY_RUNNING_CRITICAL:
      # Trim everything possible
      info("Druid", "Trim memory: critical")
      onLowMemory()
      # Additional aggressive cleanup
    else:
      info("Druid", "Trim memory: level " & $level)
```

## Service Binding

```nim
type
  ServiceConnection* = object
    connection: GlobalRef[jobject]
    service: Option[GlobalRef[jobject]]
    bound: bool

proc bindService*(serviceName: string): ServiceConnection =
  ## Bind to Android service
  let ctx = getApplicationContext()

  # Create Intent
  let intentClass = findClass("android/content/Intent")
  let intentInit = getMethodID(intentClass, "<init>",
    "(Landroid/content/Context;Ljava/lang/Class;)V")

  # Create ServiceConnection wrapper
  let connection = createServiceConnectionWrapper()

  # Bind
  let bindServiceMethod = getMethodID(
    findClass("android/content/Context"),
    "bindService",
    "(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z")

  # BIND_AUTO_CREATE = 1
  let success = callBooleanMethod(ctx, bindServiceMethod,
    makeJValues(intent, connection, 1))

  if not success:
    raise newException(DruidError, "Failed to bind service")

  result.connection = newGlobalRef(connection)
  result.bound = true

proc unbindService*(conn: var ServiceConnection) =
  if not conn.bound:
    return

  let ctx = getApplicationContext()
  let unbindMethod = getMethodID(
    findClass("android/content/Context"),
    "unbindService",
    "(Landroid/content/ServiceConnection;)V")

  callVoidMethod(ctx, unbindMethod,
    makeJValues(conn.connection.raw))

  delete(conn.connection)
  if conn.service.isSome:
    delete(conn.service.get)

  conn.bound = false
```

## Best Practices

### 1. Always Use Application Context When Possible
```nim
# BAD: Activity context may leak
let ctx = getActivityContext().get
longLivedObject.context = newGlobalRef(ctx)

# GOOD: Application context is safe
let ctx = getApplicationContext()
longLivedObject.context = newGlobalRef(ctx)
```

### 2. Clean Up in Reverse Order
```nim
proc shutdown() =
  # Clean up in reverse dependency order
  unregisterReceivers()  # Last
  unbindServices()
  releaseSystemServices()
  deleteContextRefs()    # First
```

### 3. Use defer for Cleanup
```nim
proc operation() =
  let resource = acquire()
  defer: release(resource)

  # If exception thrown, defer still runs
  riskyOperation(resource)
```

### 4. Check Resource Validity
```nim
proc useActivity() =
  let activityOpt = getActivityContext()
  if activityOpt.isNone:
    # No activity available, can't proceed
    return

  let activity = activityOpt.get
  # Use activity
```

## Testing

```nim
# Mock resource for testing
proc createMockResource(): Resource =
  result.handle = newGlobalRef(createMockObject())

suite "Resource Management":
  test "RAII cleanup":
    var leaked = false
    block:
      var res = createMockResource()
      # res should be cleaned up at block end

    # Check no leaks
    check not leaked

  test "defer cleanup":
    var cleaned = false

    proc operation() =
      var res = acquire()
      defer:
        release(res)
        cleaned = true

      raise newException(Exception, "Error")

    expect(Exception):
      operation()

    check cleaned  # Should be cleaned despite exception
```

## Performance Tips

1. **Cache system services** - Don't call getSystemService repeatedly
2. **Use local frames** - Automatically clean up temporary refs
3. **Minimize global refs** - They prevent GC, use sparingly
4. **Batch operations** - Reduce JNI call overhead

## Next Steps

1. Implement resource management utilities
2. Add lifecycle callback infrastructure
3. Write tests for resource cleanup
4. Profile for memory leaks
5. Document resource lifecycle for each manager

## References

- [Android Context](https://developer.android.com/reference/android/content/Context)
- [JNI Local and Global References](https://developer.android.com/training/articles/perf-jni#local-and-global-references)
- [Android Lifecycle](https://developer.android.com/guide/components/activities/activity-lifecycle)
