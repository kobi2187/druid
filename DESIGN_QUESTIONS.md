# Design Questions for Clarification

Before proceeding with full implementation, I need clarification on several design decisions:

## 1. AndroidRuntime Structure

**Current Situation**: I have two different AndroidRuntime definitions:
- `core.nim`: New implementation using jnim with explicit manager fields
- `art.nim`: Existing implementation with all managers as `Option[ManagerType]`

**Questions**:
- Should I merge these into one unified structure?
- Which approach do you prefer for manager storage?
- Should managers be in `art.nim` or `core.nim`?

**My Recommendation**: Keep all runtime code in `core.nim`, use `art.nim` only for device capability detection.

---

## 2. Manager Initialization Pattern

**Current Approach**: Lazy initialization via runtime accessors
```nim
proc packageManager*(runtime: AndroidRuntime): PackageManager =
  if runtime.packageManager.isNone:
    runtime.packageManager = some(PackageManager.init())
  return runtime.packageManager.get()
```

**Alternative Approach**: Explicit initialization at runtime startup
```nim
proc init*(context: JObject): AndroidRuntime =
  result.packageManager = PackageManager.init()
  result.notificationManager = NotificationManager.init()
  # ... all managers
```

**Questions**:
- Prefer lazy (on-demand) or eager (at startup) initialization?
- Should users be able to selectively enable managers?

**My Recommendation**: Lazy initialization - only creates managers when used, saves memory and startup time.

---

## 3. Error Handling Strategy

**Option A**: Exceptions everywhere
```nim
proc getPackageName(): string =
  # Throws on error
```

**Option B**: Result types everywhere
```nim
proc getPackageName(): Result[string, DruidError] =
  # Returns ok/err
```

**Option C**: Hybrid (current approach)
```nim
proc getPackageName(): string =
  # Throws for programming errors (not initialized)

proc requestPermission(): Future[bool] =
  # Uses Future/async for async operations
```

**Questions**:
- Which error handling style do you prefer?
- Should we use a Result type library or exceptions?

**My Recommendation**: Hybrid - exceptions for programmer errors, Future/async for async operations, maybe Result for operations that can reasonably fail.

---

## 4. Permission Manager Design

**Question**: How should permission requests integrate with your GUI library?

**Current Plan**: Use async/Future based API:
```nim
let granted = await permissions().requestPermission(CAMERA)
```

But this requires:
- Activity reference for showing system permission dialog
- Callback mechanism when user responds

**Questions**:
- Does your GUI library handle Activities?
- Should Druid provide a default permission request UI, or just the API?
- How do we get Activity callbacks back to Nim?

---

## 5. Native vs SDK Choice

**You mentioned**: "both java sdk and native will be used, based on versions capabilities"

**Questions**:
- For which services should we prioritize native (NDK)?
  - Audio (OpenSL ES vs AudioTrack)?
  - Camera (Camera2 NDK vs Camera2 Java)?
  - Sensors (ASensorManager vs SensorManager)?
- Should this be:
  - Automatic based on API level detection?
  - Configurable by user (`useNdk = true`)?
  - Service-specific decision?

**Example Decision Points**:
```nim
# Audio Manager
if apiLevel >= 28 and lowLatencyNeeded:
  useOpenSLES()  # Native
else:
  useAudioTrack()  # Java SDK
```

**My Recommendation**: Start with Java SDK for everything (easier, more compatible), add NDK variants later for performance-critical services (audio, camera).

---

## 6. Lifecycle Management

**Question**: How should Druid interact with your GUI library for lifecycle events?

**Lifecycle Events**:
- Activity onCreate/onResume/onPause/onDestroy
- Configuration changes (rotation)
- Low memory warnings
- Process death/recreation

**Questions**:
- Does your GUI library expose these events?
- Should Druid provide its own Activity base class?
- How do we coordinate lifecycle between Druid and your GUI?

**Current Approach**: User manually calls:
```nim
setCurrentActivity(activity)  # From Activity.onCreate()
clearCurrentActivity()         # From Activity.onDestroy()
```

Is this acceptable or should it be more automatic?

---

## 7. Threading Model

**Question**: How should Druid handle threads?

**Scenarios**:
- JNI calls must happen from attached threads
- Some Android APIs require main thread
- Background work should be off main thread

**Questions**:
- Does your GUI library have a main thread event loop?
- Should Druid provide thread utilities (runOnMainThread, runOnBackground)?
- How do we handle async operations (Future, async/await)?

**My Recommendation**:
```nim
# Druid provides:
proc runOnMainThread*(action: proc())  # Dispatch to Android main thread
proc runOnBackground*(action: proc())  # Use thread pool
proc async*[T](operation: proc(): T): Future[T]  # Async operations
```

---

## 8. System Service Access Pattern

**Current Pattern**: Each manager gets system service in init()
```nim
proc init*(_: typedesc[PackageManager]): PackageManager =
  result.context = getContext()
  result.packageManager = result.context.getPackageManager()
```

**Alternative**: Centralized system service cache in AndroidRuntime
```nim
# Runtime caches all system services
proc getSystemService*(name: string): JObject

# Managers just access cached services
proc init*(_: typedesc[PackageManager]): PackageManager =
  result.packageManager = runtime().getSystemService("package")
```

**Questions**:
- Current approach (each manager manages its own) or centralized cache?
- Should system services be lazy-loaded or all loaded at startup?

**My Recommendation**: Current approach - simpler, more decoupled.

---

## 9. Compile-Time Feature Tracking

**Question**: Should we track used features at compile time?

**Potential Use**:
```nim
# User code:
import druid
let audio = audioManager()
let camera = cameraManager()

# Druid could automatically:
# - Generate AndroidManifest.xml with required permissions
# - Only compile needed managers
# - Optimize initialization
```

**Questions**:
- Is compile-time feature tracking valuable?
- Should Druid auto-generate manifest entries?
- Or should user manually manage AndroidManifest.xml?

**My Recommendation**: Nice to have, but not critical. Manual manifest management for v0.1, automatic generation later.

---

## 10. API Style Preferences

**Option A**: Manager objects (current)
```nim
let pkg = packageManager()
echo pkg.getPackageName()

let notif = notifications()
notif.notify("Title", "Message")
```

**Option B**: Module-level functions
```nim
import druid/package_manager
echo getPackageName()

import druid/notifications
notify("Title", "Message")
```

**Option C**: Namespace-style
```nim
import druid
echo druid.package.getName()
druid.notifications.notify("Title", "Message")
```

**Questions**:
- Which API style do you prefer?
- Should all managers follow the same pattern?

**My Recommendation**: Option A (current) - clear ownership, testable, consistent with object-oriented Android APIs.

---

## Priority for Clarification

**High Priority** (blocking further work):
1. AndroidRuntime structure (question 1)
2. Permission Manager + GUI integration (question 4)
3. Lifecycle management with GUI (question 6)

**Medium Priority** (can proceed with assumptions):
5. Native vs SDK choice (question 5)
7. Threading model (question 7)

**Low Priority** (can defer):
9. Compile-time feature tracking (question 9)
10. API style (can refactor later) (question 10)

---

## What I'll Do Next

Based on your answers, I'll:

1. **Finalize core architecture** - Merge runtime structures
2. **Implement PermissionManager** - With your GUI integration approach
3. **Add more essential services** - Vibration, Clipboard, Connectivity, Power
4. **Create example app** - Demonstrating integration with your GUI library
5. **Write tests** - Unit and integration tests

Please provide guidance on the high-priority questions so I can proceed correctly!
