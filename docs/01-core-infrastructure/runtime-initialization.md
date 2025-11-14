# AndroidRuntime Initialization

## Purpose

The AndroidRuntime is the central singleton that:
1. Holds references to the Android Application context
2. Manages the lifecycle of all service managers
3. Coordinates initialization across the library
4. Provides centralized access to Android resources

## Architecture

```
┌─────────────────────────────────────────┐
│    Android App (Java/Kotlin)            │
│                                         │
│    override fun onCreate() {            │
│        System.loadLibrary("druid")      │
│        initDruid(this)  // Native call  │
│    }                                    │
└────────────────┬────────────────────────┘
                 │ JNI call
┌────────────────▼────────────────────────┐
│    initDruid() - Native function        │
│    - Store context                      │
│    - Initialize AndroidRuntime          │
│    - Load required managers             │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│    AndroidRuntime (Singleton)           │
│    ├─ context: jobject                  │
│    ├─ permissionManager: PermissionMgr  │
│    ├─ audioManager: AudioManager        │
│    ├─ ... (all managers)                │
│    └─ initialized: bool                 │
└─────────────────────────────────────────┘
```

## Implementation

### 1. Expand core.nim

```nim
# core.nim (existing file, add to it)

import jni/bridge
import options

type
  AndroidRuntimeState = enum
    Uninitialized
    Initializing
    Initialized
    Shutdown

  AndroidRuntime* = object
    # Core state
    state: AndroidRuntimeState
    applicationContext: GlobalRef[jobject]
    currentActivity: Option[GlobalRef[jobject]]

    # Device capabilities
    deviceInfo: AndroidDeviceInfo

    # Manager references (lazy-initialized)
    permissionManager: Option[PermissionManager]
    packageManager: Option[PackageManager]
    activityManager: Option[ActivityManager]
    connectivityManager: Option[ConnectivityManager]
    powerManager: Option[PowerManager]

    audioManager: Option[AudioManager]
    cameraManager: Option[CameraManager]
    locationManager: Option[LocationManager]
    # ... all other managers

    # Feature tracking (compile-time + runtime)
    enabledFeatures: set[AndroidFeature]

# Global singleton instance
var gRuntime: AndroidRuntime

# Access singleton
proc runtime*(): var AndroidRuntime =
  if gRuntime.state == Uninitialized:
    raise newException(RuntimeError,
      "AndroidRuntime not initialized. Call init() first.")
  return gRuntime

proc isInitialized*(): bool =
  return gRuntime.state == Initialized
```

### 2. Initialization Function

```nim
# core.nim

proc init*(context: jobject, isApplicationContext: bool = true): AndroidRuntime =
  ## Initialize AndroidRuntime with Android context
  ##
  ## Args:
  ##   context: Either Application or Activity context (jobject)
  ##   isApplicationContext: True if context is Application, false if Activity
  ##
  ## Returns:
  ##   Reference to initialized runtime (also stored in global singleton)
  ##
  ## Example:
  ##   let runtime = AndroidRuntime.init(applicationContext)

  if gRuntime.state == Initialized:
    # Already initialized, return existing
    return gRuntime

  if gRuntime.state == Initializing:
    raise newException(RuntimeError,
      "AndroidRuntime.init() called recursively")

  gRuntime.state = Initializing

  # Store context as global reference (so it persists)
  if isApplicationContext:
    gRuntime.applicationContext = newGlobalRef(context)
  else:
    # If Activity context provided, get Application context from it
    let activityClass = findClass("android/app/Activity")
    let getApplicationMethod = getMethodID(activityClass, "getApplication",
      "()Landroid/app/Application;")
    let appContext = callObjectMethod(context, getApplicationMethod)
    gRuntime.applicationContext = newGlobalRef(appContext)

    # Also store activity reference
    gRuntime.currentActivity = some(newGlobalRef(context))

  # Detect device capabilities
  gRuntime.deviceInfo = detectDeviceCapabilities()

  # Initialize logging early (so managers can log during init)
  gRuntime.logManager = some(LogManager.init())

  # Initialize essential managers immediately
  # (These have no dependencies on other managers)
  gRuntime.permissionManager = some(PermissionManager.init())
  gRuntime.packageManager = some(PackageManager.init())
  gRuntime.activityManager = some(ActivityManager.init())

  # Other managers are lazy-initialized on first access

  gRuntime.state = Initialized
  return gRuntime

proc getContext*(): jobject =
  ## Get Application context
  ## Always returns Application context (long-lived, safe to cache)
  return gRuntime.applicationContext.raw

proc getActivity*(): Option[jobject] =
  ## Get current Activity context
  ## May be None if initialized from Application context only
  if gRuntime.currentActivity.isSome:
    return some(gRuntime.currentActivity.get.raw)
  else:
    return none(jobject)
```

### 3. JNI Entry Point

```nim
# jni/entry.nim (new file)

import jni/bridge
import core

proc initDruid*(env: ptr JNIEnv, clazz: jclass,
                context: jobject): jboolean {.exportc, dynlib.} =
  ## Called from Java/Kotlin to initialize Druid
  ##
  ## Java signature: public static native boolean initDruid(Context context);
  ##
  ## Example Java code:
  ##   public class MainActivity extends Activity {
  ##     static {
  ##       System.loadLibrary("druid");
  ##     }
  ##
  ##     @Override
  ##     protected void onCreate(Bundle savedInstanceState) {
  ##       super.onCreate(savedInstanceState);
  ##       if (!initDruid(getApplicationContext())) {
  ##         Log.e("Druid", "Failed to initialize");
  ##       }
  ##     }
  ##
  ##     private static native boolean initDruid(Context context);
  ##   }

  try:
    discard AndroidRuntime.init(context, isApplicationContext = true)
    return 1  # true
  except Exception as e:
    # Log error (can't throw exception across JNI boundary)
    echo "Failed to initialize Druid: ", e.msg
    return 0  # false
```

### 4. Lazy Manager Initialization

```nim
# core.nim

proc audio*(): AudioManager =
  ## Get AudioManager instance (lazy-initialized)
  if gRuntime.audioManager.isNone:
    gRuntime.audioManager = some(AudioManager.init())
  return gRuntime.audioManager.get

proc camera*(): CameraManager =
  ## Get CameraManager instance (lazy-initialized)
  if gRuntime.cameraManager.isNone:
    gRuntime.cameraManager = some(CameraManager.init())
  return gRuntime.cameraManager.get

proc location*(): LocationManager =
  ## Get LocationManager instance (lazy-initialized)
  if gRuntime.locationManager.isNone:
    gRuntime.locationManager = some(LocationManager.init())
  return gRuntime.locationManager.get

# ... repeat for all managers

# Alternative: Generic access with compile-time tracking
proc get*[T: AudioManager](): T =
  ## Generic accessor with compile-time feature tracking
  const feature = AndroidFeature.Audio
  gRuntime.enabledFeatures.incl(feature)
  return gRuntime.audio()
```

### 5. Lifecycle Callbacks

```nim
# core.nim

proc onActivityCreated*(activity: jobject) =
  ## Called when Activity is created
  ## Update current activity reference
  if gRuntime.currentActivity.isSome:
    delete(gRuntime.currentActivity.get)
  gRuntime.currentActivity = some(newGlobalRef(activity))

  # Notify managers
  if gRuntime.lifecycleManager.isSome:
    gRuntime.lifecycleManager.get.onActivityCreated()

proc onActivityDestroyed*() =
  ## Called when Activity is destroyed
  if gRuntime.currentActivity.isSome:
    delete(gRuntime.currentActivity.get)
    gRuntime.currentActivity = none(GlobalRef[jobject])

  # Notify managers
  if gRuntime.lifecycleManager.isSome:
    gRuntime.lifecycleManager.get.onActivityDestroyed()

proc onLowMemory*() =
  ## Called when system is low on memory
  ## Managers should free caches
  if gRuntime.memoryManager.isSome:
    gRuntime.memoryManager.get.onLowMemory()

proc onTrimMemory*(level: int) =
  ## Called when system wants app to trim memory
  ## level: TRIM_MEMORY_* constant
  if gRuntime.memoryManager.isSome:
    gRuntime.memoryManager.get.onTrimMemory(level)

proc shutdown*() =
  ## Shutdown runtime and cleanup all resources
  ## Should be called from Application.onTerminate()

  if gRuntime.state != Initialized:
    return

  gRuntime.state = Shutdown

  # Shutdown all managers in reverse dependency order
  # (Later managers may depend on earlier ones)

  # Feature managers first
  if gRuntime.audioManager.isSome:
    gRuntime.audioManager.get.shutdown()
  if gRuntime.cameraManager.isSome:
    gRuntime.cameraManager.get.shutdown()
  # ... all feature managers

  # System managers next
  if gRuntime.lifecycleManager.isSome:
    gRuntime.lifecycleManager.get.shutdown()
  if gRuntime.memoryManager.isSome:
    gRuntime.memoryManager.get.shutdown()

  # Essential managers last
  if gRuntime.permissionManager.isSome:
    gRuntime.permissionManager.get.shutdown()
  if gRuntime.packageManager.isSome:
    gRuntime.packageManager.get.shutdown()
  if gRuntime.activityManager.isSome:
    gRuntime.activityManager.get.shutdown()

  # Release context references
  if gRuntime.currentActivity.isSome:
    delete(gRuntime.currentActivity.get)
  delete(gRuntime.applicationContext)

  gRuntime.state = Uninitialized
```

## Android Integration

### Java/Kotlin Side

#### Option 1: Custom Application Class

```kotlin
// MyApplication.kt
package com.example.myapp

import android.app.Application

class MyApplication : Application() {
    companion object {
        init {
            System.loadLibrary("druid")
        }

        @JvmStatic
        external fun initDruid(context: android.content.Context): Boolean

        @JvmStatic
        external fun shutdownDruid()
    }

    override fun onCreate() {
        super.onCreate()

        if (!initDruid(this)) {
            throw RuntimeException("Failed to initialize Druid")
        }
    }

    override fun onTerminate() {
        shutdownDruid()
        super.onTerminate()
    }

    override fun onLowMemory() {
        super.onLowMemory()
        onLowMemoryNative()
    }

    override fun onTrimMemory(level: Int) {
        super.onTrimMemory(level)
        onTrimMemoryNative(level)
    }

    @JvmStatic
    private external fun onLowMemoryNative()

    @JvmStatic
    private external fun onTrimMemoryNative(level: Int)
}
```

```xml
<!-- AndroidManifest.xml -->
<manifest>
    <application
        android:name=".MyApplication"
        ...>
        <!-- activities -->
    </application>
</manifest>
```

#### Option 2: Activity Initialization

```kotlin
// MainActivity.kt
package com.example.myapp

import android.app.Activity
import android.os.Bundle

class MainActivity : Activity() {
    companion object {
        init {
            System.loadLibrary("druid")
        }

        @JvmStatic
        external fun initDruid(context: android.content.Context): Boolean
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Initialize Druid with Application context
        if (!initDruid(applicationContext)) {
            throw RuntimeException("Failed to initialize Druid")
        }

        setContentView(R.layout.activity_main)
    }
}
```

### Nim Side Usage

```nim
# After initialization, use runtime
import druid

# In your Nim code (called from native functions)
proc myNativeFunction() {.exportc, dynlib.} =
  # Access managers via runtime
  let audio = runtime().audio()
  audio.play("sound.mp3")

  let vibration = runtime().vibration()
  vibration.vibrate(300.milliseconds)

  # Or use global accessors (if provided)
  audio().play("sound.mp3")
  vibrate(300.milliseconds)
```

## Initialization Sequence

```
1. Java: System.loadLibrary("druid")
   └─> Calls JNI_OnLoad()
       └─> Caches JavaVM pointer

2. Java: initDruid(applicationContext)
   └─> Calls native initDruid()
       ├─> AndroidRuntime.init(context)
       │   ├─> Store context as global ref
       │   ├─> Detect device capabilities
       │   ├─> Initialize essential managers
       │   └─> Set state = Initialized
       └─> Return true/false

3. Nim: First manager access (lazy)
   └─> audio()
       ├─> Check if initialized
       ├─> Create AudioManager.init()
       └─> Return cached instance

4. Java: onLowMemory() / onTrimMemory()
   └─> Call native lifecycle callbacks
       └─> Notify managers to free resources

5. Java: onTerminate()
   └─> Call native shutdownDruid()
       ├─> Shutdown all managers
       ├─> Delete global refs
       └─> Set state = Uninitialized
```

## Error Handling

### Initialization Failures

```nim
proc init*(context: jobject, isApplicationContext: bool = true): AndroidRuntime =
  try:
    # ... initialization code
  except JNIError as e:
    gRuntime.state = Uninitialized
    raise newException(RuntimeError,
      "Failed to initialize AndroidRuntime: " & e.msg)
  except Exception as e:
    gRuntime.state = Uninitialized
    raise newException(RuntimeError,
      "Unexpected error during initialization: " & e.msg)

# Usage from JNI entry point
proc initDruid*(env: ptr JNIEnv, clazz: jclass,
                context: jobject): jboolean {.exportc, dynlib.} =
  try:
    discard AndroidRuntime.init(context)
    return 1
  except Exception as e:
    # Log to Android log
    let log = initAndroidLog()
    log.error("Druid", "Init failed: " & e.msg)
    return 0
```

### Access Before Initialization

```nim
proc runtime*(): var AndroidRuntime =
  if gRuntime.state == Uninitialized:
    raise newException(RuntimeError,
      """AndroidRuntime not initialized.
      Call AndroidRuntime.init() from your Android Application or Activity.""")
  if gRuntime.state == Shutdown:
    raise newException(RuntimeError,
      "AndroidRuntime has been shut down.")
  return gRuntime
```

## Testing

### Unit Tests (Desktop)

```nim
# tests/test_runtime.nim

import unittest
import druid/core

# Mock context for testing
proc createMockContext(): jobject =
  # Return fake jobject for testing
  # In real tests, would use Android test framework
  cast[jobject](0x1234)

suite "AndroidRuntime":
  test "init stores context":
    let mockContext = createMockContext()
    let runtime = AndroidRuntime.init(mockContext)
    check runtime.getContext() == mockContext

  test "lazy manager initialization":
    let runtime = AndroidRuntime.init(createMockContext())
    # First access creates manager
    let audio1 = runtime.audio()
    # Second access returns same instance
    let audio2 = runtime.audio()
    check cast[pointer](audio1) == cast[pointer](audio2)

  test "double init returns same instance":
    let ctx = createMockContext()
    let runtime1 = AndroidRuntime.init(ctx)
    let runtime2 = AndroidRuntime.init(ctx)
    check cast[pointer](runtime1) == cast[pointer](runtime2)
```

### Integration Tests (Android)

```kotlin
// AndroidTest.kt
@RunWith(AndroidJUnit4::class)
class DruidRuntimeTest {
    @Test
    fun testInitialization() {
        val context = InstrumentationRegistry.getInstrumentation().targetContext
        assertTrue(MyApplication.initDruid(context))
    }

    @Test
    fun testManagerAccess() {
        val context = InstrumentationRegistry.getInstrumentation().targetContext
        MyApplication.initDruid(context)

        // Call Nim function that uses managers
        assertTrue(testAudioManagerAccess())
    }

    private external fun testAudioManagerAccess(): Boolean
}
```

```nim
# Nim side of test
proc testAudioManagerAccess(): bool {.exportc, dynlib.} =
  try:
    let audio = runtime().audio()
    # If we got here, manager is accessible
    return true
  except Exception:
    return false
```

## Performance Considerations

### Initialization Time

Target: < 50ms for full initialization

```nim
# Measure init time
import times

proc init*(context: jobject): AndroidRuntime =
  let startTime = cpuTime()

  # ... initialization code

  let endTime = cpuTime()
  let elapsed = (endTime - startTime) * 1000  # Convert to ms

  if elapsed > 50.0:
    log.warn("Druid", "Initialization took " & $elapsed & "ms (target: <50ms)")
  else:
    log.debug("Druid", "Initialized in " & $elapsed & "ms")

  return gRuntime
```

### Memory Footprint

- Essential managers only: ~1-2MB
- All managers loaded: ~5MB target
- Use lazy initialization to keep footprint low

```nim
# Track memory usage
proc getMemoryFootprint(): int =
  # Return approximate memory used by runtime
  var total = 0
  if gRuntime.audioManager.isSome:
    total += sizeof(AudioManager)
  if gRuntime.cameraManager.isSome:
    total += sizeof(CameraManager)
  # ... count all loaded managers
  return total
```

### Thread Safety

All runtime access is thread-safe:

```nim
var runtimeLock: Lock
initLock(runtimeLock)

proc audio*(): AudioManager =
  withLock runtimeLock:
    if gRuntime.audioManager.isNone:
      gRuntime.audioManager = some(AudioManager.init())
    return gRuntime.audioManager.get
```

## Common Pitfalls

### 1. Using Activity Context Instead of Application
```nim
# BAD: Activity context may become invalid
AndroidRuntime.init(activityContext, isApplicationContext = true)

# GOOD: Always use Application context
AndroidRuntime.init(applicationContext, isApplicationContext = true)
```

### 2. Not Checking Initialization
```nim
# BAD: May crash if not initialized
let audio = runtime().audio()

# GOOD: Check first
if isInitialized():
  let audio = runtime().audio()
else:
  echo "Runtime not initialized"
```

### 3. Forgetting Cleanup
```nim
# BAD: Leaks resources
# Never calling shutdown()

# GOOD: Cleanup in Application.onTerminate()
override fun onTerminate() {
    shutdownDruid()
    super.onTerminate()
}
```

## Next Steps

1. Implement expanded AndroidRuntime in core.nim
2. Create JNI entry point in jni/entry.nim
3. Add lifecycle callback functions
4. Write Java/Kotlin helper classes
5. Test initialization on real Android device
6. Measure initialization time and memory footprint

## References

- [Android Application Fundamentals](https://developer.android.com/guide/components/fundamentals)
- [Android Context](https://developer.android.com/reference/android/content/Context)
- [Application Lifecycle](https://developer.android.com/guide/components/activities/activity-lifecycle)
