# System Managers Overview

## Purpose

System Managers handle Android lifecycle, state management, threading, and background tasks. These are Druid's core innovation - making Android development feel like desktop development.

## The 8 System Managers

### 1. LifecycleManager ⭐
**Priority**: CRITICAL
**Purpose**: Abstract Activity/Fragment lifecycle into simple callbacks
**Key Innovation**: Unified lifecycle handling

**APIs**:
- `onCreate(callback: proc())`
- `onResume(callback: proc())`
- `onPause(callback: proc())`
- `onDestroy(callback: proc())`

**Implementation**: ~400 LOC
**File**: `managers/system/LifecycleManager.nim`
**Doc**: [LifecycleManager.md](LifecycleManager.md)

---

### 2. ResurrectionManager ⭐⭐⭐
**Priority**: CRITICAL (Key Innovation)
**Purpose**: Handle process death/revival transparently
**Key Innovation**: Makes Android feel stateful like desktop apps

**APIs**:
- `keepAlive[T](key: string, value: T)` - Auto-restore state
- `keepSession[T](key: string, value: T)` - Session scope
- `keepTemporary[T](key: string, value: T)` - Cache only
- `onResurrected(callback: proc())`

**How It Works**:
1. Detects when process was killed
2. Automatically restores state from saved instance
3. Maintains illusion of continuous process
4. Handles Activity recreation, config changes, memory pressure

**Implementation**: ~600 LOC
**File**: `managers/system/ResurrectionManager.nim`
**Doc**: [ResurrectionManager.md](ResurrectionManager.md)

---

### 3. StateManager
**Priority**: HIGH
**Purpose**: Manage saved instance state bundles
**Dependencies**: Works with ResurrectionManager

**APIs**:
- `saveState(key: string, value: Serializable)`
- `restoreState[T](key: string): Option[T]`
- `clearState(key: string)`

**Implementation**: ~300 LOC
**File**: `managers/system/StateManager.nim`
**Doc**: [StateManager.md](StateManager.md)

---

### 4. MemoryManager
**Priority**: MEDIUM
**Purpose**: Monitor and respond to memory pressure

**APIs**:
- `getAvailableMemory(): int` (bytes)
- `getTotalMemory(): int`
- `isLowMemory(): bool`
- `onLowMemory(callback: proc())`
- `registerMemoryCache(cache: MemoryCache)`

**Implementation**: ~250 LOC
**File**: `managers/system/MemoryManager.nim`
**Doc**: [MemoryManager.md](MemoryManager.md)

---

### 5. ThreadManager
**Priority**: HIGH
**Purpose**: Thread pools, main thread dispatch, async operations

**APIs**:
- `runOnMainThread(action: proc())`
- `runOnBackground(action: proc())`
- `async[T](operation: proc(): T): Future[T]`

**Implementation**: ~400 LOC
**File**: `managers/system/ThreadManager.nim`
**Doc**: [ThreadManager.md](ThreadManager.md)

---

### 6. SchedulerManager
**Priority**: MEDIUM
**Purpose**: Periodic task scheduling (JobScheduler, AlarmManager)

**APIs**:
- `scheduleRepeating(interval: Duration, task: proc()): ScheduledTask`
- `scheduleOnce(delay: Duration, task: proc())`
- `cancel(task: ScheduledTask)`

**Implementation**: ~400 LOC
**File**: `managers/system/SchedulerManager.nim`
**Doc**: [SchedulerManager.md](SchedulerManager.md)

---

### 7. BackgroundTaskManager
**Priority**: MEDIUM
**Purpose**: Long-running background work (WorkManager, Services)

**APIs**:
- `startForegroundTask(task: BackgroundTask): TaskHandle`
- `startBackgroundWork(task: WorkRequest)`
- `cancelTask(handle: TaskHandle)`

**Implementation**: ~500 LOC
**File**: `managers/system/BackgroundTaskManager.nim`
**Doc**: [BackgroundTaskManager.md](BackgroundTaskManager.md)

---

### 8. EventBusManager
**Priority**: LOW
**Purpose**: Internal event distribution between managers

**APIs**:
- `subscribe[T](handler: proc(event: T))`
- `publish[T](event: T)`
- `unsubscribe(handler: EventHandler)`

**Implementation**: ~200 LOC
**File**: `managers/system/EventBusManager.nim`
**Doc**: [EventBusManager.md](EventBusManager.md)

---

## Key Innovation: ResurrectionManager

The ResurrectionManager is Druid's standout feature. It solves the biggest pain point in Android development: process death.

### The Problem

On Android, the system can kill your app process at any time:
- Low memory
- Background too long
- Configuration changes (rotation)
- User switches apps

When the user returns, Android recreates the Activity, but your app state is gone.

### The Solution

```nim
import druid

# Desktop-style: just use variables
var gameScore = 0
var playerName = ""

proc playGame() =
  # Mark state as "keep alive" - survives process death
  keepAlive("score", gameScore)
  keepAlive("player", playerName)

  gameScore += 10
  # Automatically saved

# Later, after process death + revival:
proc onResume() =
  # Variables are automatically restored!
  echo "Welcome back ", playerName
  echo "Your score: ", gameScore
  # Works seamlessly, feels like process never died
```

### How It Works

1. **State Classification**:
   - `keepAlive`: Critical state (game progress, user data)
   - `keepSession`: Session state (login token, UI state)
   - `keepTemporary`: Caches (safe to lose)

2. **Automatic Serialization**:
   - Monitors changed variables
   - Serializes to Bundle on pause
   - Restores on recreation

3. **Transparent Recovery**:
   - Detects process death
   - Restores state before user code runs
   - Maintains object references

### Benefits

- **Desktop-like UX**: Users never lose progress
- **No Manual State Management**: No onSaveInstanceState boilerplate
- **Automatic**: Works without thinking about it
- **Type-Safe**: Nim's type system ensures correct serialization

---

## Implementation Dependencies

```
LifecycleManager (foundation)
  ├─> StateManager
  │     └─> ResurrectionManager (KEY)
  └─> MemoryManager

ThreadManager (independent)
  └─> SchedulerManager
      └─> BackgroundTaskManager

EventBusManager (independent, used by all)
```

## Implementation Order

1. **LifecycleManager** (Week 7)
   - Foundation for all lifecycle-aware managers
   - Test with simple onCreate/onDestroy callbacks

2. **StateManager** (Week 7)
   - Bundle serialization/deserialization
   - Test with Activity recreation

3. **ResurrectionManager** (Week 8) ⭐
   - Build on StateManager and LifecycleManager
   - Extensive testing with process death scenarios

4. **MemoryManager** (Week 8)
   - Memory monitoring
   - Integration with ResurrectionManager for cache management

5. **ThreadManager** (Week 9)
   - Thread pools and dispatch
   - Integration with async/await

6. **SchedulerManager** (Week 9)
   - JobScheduler wrapper
   - API level compatibility (AlarmManager fallback)

7. **BackgroundTaskManager** (Week 10)
   - WorkManager wrapper
   - Foreground service support

8. **EventBusManager** (Week 10)
   - Simple event distribution
   - Used for inter-manager communication

---

## Testing Strategy

### Critical: Process Death Testing

```bash
# Simulate process death
adb shell am kill <package>

# Trigger process death
adb shell am crash <package>

# Low memory simulation
adb shell dumpsys meminfo

# Configuration change
adb shell am set-debug-app -w <package>
```

### Test Scenarios

1. **Lifecycle**:
   - Activity creation → destruction
   - Screen rotation
   - Background → foreground

2. **Resurrection**:
   - Save state → kill process → restore
   - Different state types (keepAlive vs keepSession)
   - Large state (>1MB)

3. **Memory**:
   - Low memory warning response
   - Cache eviction
   - OOM prevention

4. **Threading**:
   - Main thread dispatch
   - Background work
   - Race conditions

5. **Scheduling**:
   - Task persistence across reboots
   - Battery optimization compatibility
   - Doze mode behavior

---

## Example: Complete System Stack

```nim
import druid
import asyncdispatch

# Game state (survives process death automatically)
var level = 1
var score = 0
var playerName = ""

proc initGame() =
  # Setup lifecycle
  lifecycle().onCreate:
    echo "Game starting"
    # Mark critical state
    keepAlive("level", level)
    keepAlive("score", score)
    keepAlive("player", playerName)

  lifecycle().onPause:
    echo "Game pausing"
    # State automatically saved here

  lifecycle().onResume:
    echo "Game resuming"
    # State automatically restored here
    echo "Welcome back ", playerName, " (Level ", level, ")"

  lifecycle().onDestroy:
    echo "Game ending"

  # Handle low memory
  memory().onLowMemory:
    echo "Low memory - clearing caches"
    clearImageCache()
    clearAudioCache()

proc startBackgroundMusic() =
  # Run on background thread
  thread().runOnBackground:
    loadAndPlayMusic("theme.mp3")

proc updateLeaderboard() {.async.} =
  # Async operation
  let ranking = await thread().async:
    fetchLeaderboardFromServer()

  # Update UI on main thread
  thread().runOnMainThread:
    displayLeaderboard(ranking)

proc setupDailyReward() =
  # Schedule daily task
  scheduler().scheduleRepeating(24.hours):
    givePlayerDailyBonus()

proc main() {.exportc.} =
  initGame()
  startBackgroundMusic()
  waitFor updateLeaderboard()
  setupDailyReward()

  # Even if process dies and revives:
  # - State is restored (level, score, playerName)
  # - Music resumes
  # - Leaderboard updates
  # - Daily reward still scheduled
  # All transparent to user!
```

---

## Success Criteria

- [ ] All 8 system managers implemented
- [ ] ResurrectionManager survives process death in 100% of tests
- [ ] No memory leaks during 24-hour test
- [ ] Thread-safe under concurrent load
- [ ] Scheduled tasks survive device reboot
- [ ] Background tasks respect battery optimization
- [ ] Complete integration tests
- [ ] Example app demonstrating all features

---

## Next Steps

1. Implement LifecycleManager
2. Build StateManager with Bundle serialization
3. **Implement ResurrectionManager** (the key innovation)
4. Test process death scenarios extensively
5. Add memory management
6. Implement threading and scheduling
7. Create comprehensive example app

---

**See detailed implementation docs for each manager**.
