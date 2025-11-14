# Essential Managers Overview

## Purpose

Essential Managers provide fundamental Android system services that most apps require. These are implemented in Phase 2 as they have minimal dependencies and demonstrate the core patterns used throughout Druid.

## The 5 Essential Managers

### 1. PermissionManager
**Priority**: CRITICAL
**Purpose**: Handle runtime permission requests (Marshmallow+)
**Why Essential**: Required for camera, location, storage, microphone, etc.

**Key APIs**:
- `requestPermission(permission: AndroidPermission): Future[bool]`
- `hasPermission(permission: AndroidPermission): bool`
- `shouldShowRationale(permission: AndroidPermission): bool`

**See**: [PermissionManager.md](PermissionManager.md)

---

### 2. PackageManager
**Priority**: HIGH
**Purpose**: Query app information, installed packages, package capabilities
**Why Essential**: Needed for feature detection, version checks, app metadata

**Key APIs**:
- `getPackageName(): string`
- `getVersionCode(): int`
- `getVersionName(): string`
- `hasSystemFeature(feature: string): bool`
- `getInstalledPackages(): seq[PackageInfo]`

**See**: [PackageManager.md](PackageManager.md)

---

### 3. ActivityManager
**Priority**: MEDIUM
**Purpose**: Get process info, memory info, running tasks
**Why Essential**: Memory management, background detection, task switching

**Key APIs**:
- `getMemoryInfo(): MemoryInfo`
- `isLowMemory(): bool`
- `getRunningAppProcesses(): seq[ProcessInfo]`
- `getDeviceConfigurationInfo(): ConfigurationInfo`

**See**: [ActivityManager.md](ActivityManager.md)

---

### 4. ConnectivityManager
**Priority**: HIGH
**Purpose**: Monitor network connectivity status
**Why Essential**: Most apps need to know if online/offline

**Key APIs**:
- `isConnected(): bool`
- `getNetworkType(): NetworkType` (WiFi, Cellular, None)
- `onConnectivityChanged(callback: proc(connected: bool))`
- `isMetered(): bool`

**See**: [ConnectivityManager.md](ConnectivityManager.md)

---

### 5. PowerManager
**Priority**: MEDIUM
**Purpose**: Battery status, power saving modes, wake locks
**Why Essential**: Battery-aware apps, preventing sleep

**Key APIs**:
- `getBatteryLevel(): float` (0.0-1.0)
- `isCharging(): bool`
- `isPowerSaveMode(): bool`
- `acquireWakeLock(flags: WakeLockFlags): WakeLock`

**See**: [PowerManager.md](PowerManager.md)

---

## Common Patterns

### Pattern 1: System Service Access

All essential managers follow this initialization pattern:

```nim
type
  PermissionManager* = object
    service: jobject  # Cached system service
    initialized: bool

proc init*(_: type PermissionManager): PermissionManager =
  result.service = getSystemService("permission")  # Or direct access
  result.initialized = true

# Singleton access via runtime
proc permissions*(): PermissionManager =
  if gRuntime.permissionManager.isNone:
    gRuntime.permissionManager = some(PermissionManager.init())
  return gRuntime.permissionManager.get
```

### Pattern 2: Result Types for Fallible Operations

```nim
proc requestPermission*(permission: AndroidPermission): DruidResult[bool] =
  try:
    let granted = requestPermissionInternal(permission)
    return ok(granted)
  except JavaException as e:
    return err(newException(PermissionError, e.msg))
```

### Pattern 3: Callbacks for Events

```nim
type
  ConnectivityCallback = proc(connected: bool)

var gConnectivityCallbacks: seq[ConnectivityCallback]

proc onConnectivityChanged*(callback: ConnectivityCallback) =
  gConnectivityCallbacks.add(callback)
  # Register broadcast receiver if first callback
  if gConnectivityCallbacks.len == 1:
    registerConnectivityReceiver()
```

### Pattern 4: Caching for Performance

```nim
var gPackageName: Option[string] = none(string)

proc getPackageName*(): string =
  if gPackageName.isSome:
    return gPackageName.get

  # Query from system
  let name = getPackageNameInternal()
  gPackageName = some(name)
  return name
```

## Implementation Order

Recommended implementation order based on dependencies and complexity:

1. **PackageManager** (easiest, no permissions needed)
   - Simple queries
   - Good first manager to build patterns
   - ~200 LOC

2. **PermissionManager** (critical path)
   - Needed by many other managers
   - Involves Activity callbacks
   - ~300 LOC

3. **ConnectivityManager** (good learning example)
   - Demonstrates broadcast receivers
   - Event-based architecture
   - ~250 LOC

4. **ActivityManager** (straightforward)
   - Simple queries
   - Memory info useful for testing
   - ~200 LOC

5. **PowerManager** (moderate complexity)
   - Battery monitoring
   - Wake locks (resource management)
   - ~300 LOC

**Total estimated LOC**: ~1250 lines for all 5 managers

## Testing Strategy

### Unit Tests
- Mock system services
- Test API contracts
- Verify caching behavior

### Integration Tests
- Test on real device
- Verify permissions flow
- Test network state changes
- Monitor memory usage

### Test Devices
- Minimum: API 21 (Lollipop)
- Target: API 30+ (Android 11+)
- Test power saving modes on real devices

## Dependencies

### External Dependencies
- All managers depend on Core Infrastructure (Phase 1)
- PermissionManager requires Activity for permission requests

### Inter-Manager Dependencies
```
PackageManager
  └─> (none)

PermissionManager
  └─> PackageManager (optional, for feature detection)

ActivityManager
  └─> (none)

ConnectivityManager
  └─> PermissionManager (for network state permission on old APIs)

PowerManager
  └─> (none)
```

## Success Criteria

- [ ] All 5 managers implemented with documented APIs
- [ ] Unit tests passing for all managers
- [ ] Integration tests on real device
- [ ] Example app demonstrating each manager
- [ ] Permission flow working end-to-end
- [ ] No memory leaks after 1 hour of testing
- [ ] Handles system service unavailability gracefully

## Example Usage

### Complete Example App

```nim
import druid

proc main() {.exportc, dynlib.} =
  # Runtime already initialized from Application.onCreate()

  # Check permissions
  if not permissions().hasPermission(CAMERA):
    let granted = permissions().requestPermission(CAMERA).get
    if not granted:
      echo "Camera permission denied"
      return

  # Get app info
  let package = packages()
  echo "App: ", package.getPackageName()
  echo "Version: ", package.getVersionName()

  # Check network
  let network = connectivity()
  if network.isConnected():
    echo "Network type: ", network.getNetworkType()
  else:
    echo "Offline"

  # Check battery
  let power = power()
  echo "Battery: ", (power.getBatteryLevel() * 100).int, "%"
  if power.isPowerSaveMode():
    echo "Power saving active"

  # Check memory
  let activity = activity()
  let memInfo = activity.getMemoryInfo()
  echo "Available memory: ", memInfo.availMem div (1024*1024), " MB"

  # Now safe to use camera, with full context about device state
```

## Next Steps

1. Implement PackageManager first (simplest)
2. Build permission request UI flow
3. Implement PermissionManager with Activity integration
4. Add ConnectivityManager with broadcast receiver
5. Complete ActivityManager and PowerManager
6. Write comprehensive tests
7. Create example app

---

**See individual manager documentation for detailed implementation specs**:
- [PermissionManager.md](PermissionManager.md)
- [PackageManager.md](PackageManager.md)
- [ActivityManager.md](ActivityManager.md)
- [ConnectivityManager.md](ConnectivityManager.md)
- [PowerManager.md](PowerManager.md)
