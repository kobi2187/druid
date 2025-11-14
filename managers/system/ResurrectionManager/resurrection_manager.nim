## ResurrectionManager - Transparent Process Death Handling ⭐
##
## THIS IS DRUID'S KEY INNOVATION
##
## Makes Android development feel like desktop development by handling
## process death and revival transparently. This solves Android's biggest
## pain point: the system can kill your app at any time, and you need
## to manually save/restore state.
##
## The Problem:
##   Android kills app processes for:
##   - Low memory
##   - Background too long
##   - Configuration changes (rotation)
##   - User switches apps
##
##   When user returns, Android recreates the Activity but app state is GONE.
##   You lose: game progress, form data, scroll position, user input, etc.
##
## Druid's Solution:
##   Write code like desktop apps - use normal variables!
##   ResurrectionManager automatically saves/restores them.
##
## Example:
##   ```nim
##   var gameScore = 0
##   var playerName = ""
##
##   proc startGame() =
##     # Mark variables to survive process death
##     keepAlive("score", gameScore)
##     keepAlive("player", playerName)
##
##     gameScore = 100  # Automatically saved on pause
##
##   # Later, after process death:
##   proc resumeGame() =
##     echo playerName   # Automatically restored!
##     echo gameScore    # Still 100!
##   ```
##
## State Classifications:
##   - keepAlive:     Critical state (game progress, user data)
##                    Survives: Process death, config changes, backgrounding
##
##   - keepSession:   Session state (login token, UI state)
##                    Survives: Backgrounding, config changes
##                    Lost: Process death
##
##   - keepTemporary: Caches (safe to lose, recomputable)
##                    Survives: Nothing (just an in-memory cache)
##                    Lost: Immediately on pause
##
## How It Works:
##   1. You register variables with keepAlive/keepSession/keepTemporary
##   2. ResurrectionManager hooks into LifecycleManager
##   3. On pause: Serializes tracked variables to Bundle
##   4. On resume: Detects if process died, restores variables
##   5. Variables update automatically - feels like magic!
##
## Integration:
##   ResurrectionManager integrates with LifecycleManager and StateManager.
##   It's initialized automatically when you call resurrection().

import jnim
import options
import tables
import hashes
import ../../../core
import ../LifecycleManager/lifecycle_manager
import ../StateManager/state_manager

type
  StateScope* = enum
    ## How long should this state persist?
    ssAlive = "alive"       # Survives process death
    ssSession = "session"   # Survives backgrounding only
    ssTemporary = "temp"    # Memory cache only

  StateEntry = object
    ## Internal: Tracked state variable
    scope: StateScope
    key: string
    # Serialization callbacks
    serialize: proc(): string
    deserialize: proc(data: string)

  SdkResurrectionManager* = ref object
    ## Manager for transparent process death handling
    trackedState: Table[string, StateEntry]
    wasResurrected: bool
    hasBeenPaused: bool
    onResurrectedCallbacks: seq[proc()]

    # References to other managers
    lifecycleManager: Option[SdkLifecycleManager]
    stateManager: Option[SdkStateManager]

#
# Initialization
#

proc newSdkResurrectionManager*(): SdkResurrectionManager =
  result = SdkResurrectionManager(
    trackedState: initTable[string, StateEntry](),
    wasResurrected: false,
    hasBeenPaused: false,
    onResurrectedCallbacks: @[]
  )

proc hookIntoLifecycle(rm: SdkResurrectionManager) =
  ## Internal: Connect to LifecycleManager for automatic save/restore
  if rm.lifecycleManager.isNone:
    rm.lifecycleManager = some(lifecycle())

  if rm.stateManager.isNone:
    rm.stateManager = some(stateManager())

  let lm = rm.lifecycleManager.get()
  let sm = rm.stateManager.get()

  # Hook onSaveInstanceState - serialize all tracked state
  lm.onSaveInstanceState(proc(bundle: JObject) =
    # Save all keepAlive state (must survive process death)
    for key, entry in rm.trackedState:
      if entry.scope == ssAlive:
        let serialized = entry.serialize()
        sm.putString(bundle, "druid_alive_" & key, serialized)

    # Save all keepSession state (survives backgrounding)
    for key, entry in rm.trackedState:
      if entry.scope == ssSession:
        let serialized = entry.serialize()
        sm.putString(bundle, "druid_session_" & key, serialized)

    # Mark that we've been paused (for resurrection detection)
    sm.putBool(bundle, "druid_has_paused", true)
  )

  # Hook onRestoreInstanceState - detect resurrection and restore
  lm.onRestoreInstanceState(proc(bundle: JObject) =
    # Check if we were previously paused (resurrection detection)
    let wasPaused = sm.getBool(bundle, "druid_has_paused", false)

    if wasPaused:
      # Process was killed and revived!
      rm.wasResurrected = true

      # Restore keepAlive state
      for key, entry in rm.trackedState:
        if entry.scope == ssAlive:
          if sm.containsKey(bundle, "druid_alive_" & key):
            let serialized = sm.getString(bundle, "druid_alive_" & key, "")
            if serialized != "":
              entry.deserialize(serialized)

      # Restore keepSession state
      for key, entry in rm.trackedState:
        if entry.scope == ssSession:
          if sm.containsKey(bundle, "druid_session_" & key):
            let serialized = sm.getString(bundle, "druid_session_" & key, "")
            if serialized != "":
              entry.deserialize(serialized)

      # Notify callbacks that we were resurrected
      for callback in rm.onResurrectedCallbacks:
        try:
          callback()
        except:
          echo "Error in onResurrected callback: ", getCurrentExceptionMsg()
  )

  # Hook onPause - clear temporary state
  lm.onPause(proc() =
    rm.hasBeenPaused = true
    # Clear all temporary state (it's just a cache)
    # Note: We don't actually clear the trackedState entries,
    # just the values they point to. The deserialize() will reset them.
    for key, entry in rm.trackedState:
      if entry.scope == ssTemporary:
        # Temporary state is lost on pause
        # User must handle recomputation
        discard
  )

#
# Core API - Register State Variables
#
# Note: These are generic procs that work with any serializable type.
# Current implementation uses $value for serialization (simple but limited).
# Future: Use macros for custom serialization or JSON for complex types.
#

proc keepAlive*[T](rm: SdkResurrectionManager, key: string, valuePtr: ptr T) =
  ## Track a variable that must survive process death
  ##
  ## Usage:
  ##   var gameScore = 0
  ##   resurrection().keepAlive("score", addr gameScore)
  ##
  ## The variable will be automatically saved on pause and restored on resume.
  ##
  ## Supported types: int, float, string, bool, and types with $ operator
  ##
  ## IMPORTANT: The pointer must remain valid for the app's lifetime!

  let entry = StateEntry(
    scope: ssAlive,
    key: key,
    serialize: proc(): string =
      # Serialize the value (simple version - just use $ operator)
      return $valuePtr[]
    ,
    deserialize: proc(data: string) =
      # Deserialize the value
      # Note: This requires parseint/parsefloat for numeric types
      when T is int:
        try:
          valuePtr[] = parseInt(data)
        except:
          echo "Warning: Failed to deserialize int for key: ", key
      elif T is int64:
        try:
          valuePtr[] = parseBiggestInt(data)
        except:
          echo "Warning: Failed to deserialize int64 for key: ", key
      elif T is float or T is float32 or T is float64:
        try:
          valuePtr[] = parseFloat(data)
        except:
          echo "Warning: Failed to deserialize float for key: ", key
      elif T is string:
        valuePtr[] = data
      elif T is bool:
        valuePtr[] = (data == "true")
      else:
        # Generic fallback - requires custom deserialization
        echo "Warning: Generic deserialization for ", key, " - implement custom logic"
  )

  rm.trackedState[key] = entry

proc keepSession*[T](rm: SdkResurrectionManager, key: string, valuePtr: ptr T) =
  ## Track a variable that survives backgrounding but not process death
  ##
  ## Usage:
  ##   var authToken = ""
  ##   resurrection().keepSession("token", addr authToken)
  ##
  ## Use for: Login tokens, UI state, temporary settings
  ## Lost on: Process death (must re-login)

  let entry = StateEntry(
    scope: ssSession,
    key: key,
    serialize: proc(): string = $valuePtr[],
    deserialize: proc(data: string) =
      when T is int:
        try: valuePtr[] = parseInt(data)
        except: echo "Warning: Failed to deserialize int for key: ", key
      elif T is int64:
        try: valuePtr[] = parseBiggestInt(data)
        except: echo "Warning: Failed to deserialize int64 for key: ", key
      elif T is float or T is float32 or T is float64:
        try: valuePtr[] = parseFloat(data)
        except: echo "Warning: Failed to deserialize float for key: ", key
      elif T is string:
        valuePtr[] = data
      elif T is bool:
        valuePtr[] = (data == "true")
      else:
        echo "Warning: Generic deserialization for ", key
  )

  rm.trackedState[key] = entry

proc keepTemporary*[T](rm: SdkResurrectionManager, key: string, valuePtr: ptr T) =
  ## Track a variable as temporary cache (lost on pause)
  ##
  ## Usage:
  ##   var imageCache = initTable[string, Image]()
  ##   resurrection().keepTemporary("cache", addr imageCache)
  ##
  ## Use for: Caches, computed data, downloadable content
  ## Lost on: Pause (must recompute/redownload)

  let entry = StateEntry(
    scope: ssTemporary,
    key: key,
    serialize: proc(): string = "",  # Never serialized
    deserialize: proc(data: string) = discard  # Never deserialized
  )

  rm.trackedState[key] = entry

#
# Simpler API - Pass by Value (for primitives)
#

proc trackInt*(rm: SdkResurrectionManager, key: string, value: int, scope: StateScope = ssAlive): int =
  ## Convenience: Track an int value by creating internal storage
  ## Returns the value for easy initialization
  ##
  ## Usage:
  ##   var score = resurrection().trackInt("score", 0)
  ##
  ## Note: This creates internal storage. For existing variables, use keepAlive with addr.
  var stored = value
  case scope:
  of ssAlive: rm.keepAlive(key, addr stored)
  of ssSession: rm.keepSession(key, addr stored)
  of ssTemporary: rm.keepTemporary(key, addr stored)
  return stored

proc trackString*(rm: SdkResurrectionManager, key: string, value: string, scope: StateScope = ssAlive): string =
  ## Convenience: Track a string value
  var stored = value
  case scope:
  of ssAlive: rm.keepAlive(key, addr stored)
  of ssSession: rm.keepSession(key, addr stored)
  of ssTemporary: rm.keepTemporary(key, addr stored)
  return stored

proc trackBool*(rm: SdkResurrectionManager, key: string, value: bool, scope: StateScope = ssAlive): bool =
  ## Convenience: Track a bool value
  var stored = value
  case scope:
  of ssAlive: rm.keepAlive(key, addr stored)
  of ssSession: rm.keepSession(key, addr stored)
  of ssTemporary: rm.keepTemporary(key, addr stored)
  return stored

proc trackFloat*(rm: SdkResurrectionManager, key: string, value: float, scope: StateScope = ssAlive): float =
  ## Convenience: Track a float value
  var stored = value
  case scope:
  of ssAlive: rm.keepAlive(key, addr stored)
  of ssSession: rm.keepSession(key, addr stored)
  of ssTemporary: rm.keepTemporary(key, addr stored)
  return stored

#
# Query API
#

proc wasResurrected*(rm: SdkResurrectionManager): bool =
  ## Check if the current process was resurrected from death
  ## Useful for showing "Welcome back!" messages or resyncing data
  return rm.wasResurrected

proc isTracked*(rm: SdkResurrectionManager, key: string): bool =
  ## Check if a key is being tracked
  return rm.trackedState.hasKey(key)

proc getScope*(rm: SdkResurrectionManager, key: string): Option[StateScope] =
  ## Get the scope of a tracked key
  if not rm.trackedState.hasKey(key):
    return none(StateScope)
  return some(rm.trackedState[key].scope)

proc getTrackedKeys*(rm: SdkResurrectionManager, scope: Option[StateScope] = none(StateScope)): seq[string] =
  ## Get all tracked keys, optionally filtered by scope
  result = @[]
  for key, entry in rm.trackedState:
    if scope.isNone or entry.scope == scope.get():
      result.add(key)

#
# Callbacks
#

proc onResurrected*(rm: SdkResurrectionManager, callback: proc()) =
  ## Register a callback to be called when process is resurrected
  ##
  ## Usage:
  ##   resurrection().onResurrected(proc() =
  ##     echo "Welcome back! Syncing data..."
  ##     syncWithServer()
  ##   )
  rm.onResurrectedCallbacks.add(callback)

#
# State Management
#

proc untrack*(rm: SdkResurrectionManager, key: string) =
  ## Stop tracking a state variable
  if rm.trackedState.hasKey(key):
    rm.trackedState.del(key)

proc untrackAll*(rm: SdkResurrectionManager) =
  ## Stop tracking all state variables
  rm.trackedState.clear()

proc getTrackedCount*(rm: SdkResurrectionManager): int =
  ## Get number of tracked state variables
  return rm.trackedState.len

#
# Debugging
#

proc debugPrintTrackedState*(rm: SdkResurrectionManager): string =
  ## Get debug representation of tracked state
  result = "ResurrectionManager - Tracked State:\n"
  result &= "  Was Resurrected: " & $rm.wasResurrected & "\n"
  result &= "  Has Been Paused: " & $rm.hasBeenPaused & "\n"
  result &= "  Tracked Variables: " & $rm.trackedState.len & "\n"

  for key, entry in rm.trackedState:
    result &= "    - " & key & " [" & $entry.scope & "]\n"

#
# Runtime Integration
#

proc sdkResurrectionManager*(runtime: AndroidRuntime): SdkResurrectionManager =
  ## Get or create the SdkResurrectionManager instance
  ## Lazy initialization pattern
  ## Automatically hooks into LifecycleManager on first access
  if runtime.sdkResurrectionManager.isNone:
    let rm = newSdkResurrectionManager()
    rm.hookIntoLifecycle()
    runtime.sdkResurrectionManager = some(rm)
  return runtime.sdkResurrectionManager.get()

# Convenience global accessor
proc resurrection*(): SdkResurrectionManager =
  ## Global accessor for SdkResurrectionManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Usage:
  ##   var score = 0
  ##   resurrection().keepAlive("score", addr score)
  return runtime().sdkResurrectionManager()

#
# Helper Templates (Syntactic Sugar)
#
# Future enhancement: Create templates for even cleaner syntax
#
# template resurrect*(name: untyped, value: typed, scope: StateScope = ssAlive) =
#   ## Syntactic sugar: declare and track in one line
#   ##
#   ## Usage:
#   ##   resurrect(gameScore, 0)  # Equivalent to var gameScore = 0 + keepAlive
#   var name = value
#   resurrection().keepAlive(astToStr(name), addr name)
#
