## LifecycleManager - Android Activity/Fragment Lifecycle Abstraction
##
## This manager provides a clean, idiomatic Nim interface to Android's lifecycle.
## It's the foundation for all lifecycle-aware managers in Druid.
##
## Philosophy: Explicit, not magical. Users register callbacks, we call them.
## No hidden behavior - transparent and debuggable.
##
## Integration: Android Activity/Fragment must call our exported functions:
##   - NimLifecycle_onCreate()
##   - NimLifecycle_onStart()
##   - NimLifecycle_onResume()
##   - NimLifecycle_onPause()
##   - NimLifecycle_onStop()
##   - NimLifecycle_onDestroy()
##   - NimLifecycle_onLowMemory()
##   - NimLifecycle_onSaveInstanceState(bundle)
##   - NimLifecycle_onRestoreInstanceState(bundle)
##
## Usage:
##   var lm = runtime.lifecycle()
##   lm.onCreate(proc() = echo "Activity created!")
##   lm.onResume(proc() = echo "Activity resumed!")
##   lm.onDestroy(proc() = echo "Activity destroyed!")

import jnim
import options
import sequtils
import tables
import ../../../core

type
  LifecycleEvent* = enum
    leCreate = "onCreate"
    leStart = "onStart"
    leResume = "onResume"
    lePause = "onPause"
    leStop = "onStop"
    leDestroy = "onDestroy"
    leLowMemory = "onLowMemory"
    leSaveInstance = "onSaveInstanceState"
    leRestoreInstance = "onRestoreInstanceState"

  LifecycleState* = enum
    lsCreated = "CREATED"
    lsStarted = "STARTED"
    lsResumed = "RESUMED"
    lsPaused = "PAUSED"
    lsStopped = "STOPPED"
    lsDestroyed = "DESTROYED"

  LifecycleCallback* = proc() {.closure.}
  LifecycleBundleCallback* = proc(bundle: jobject) {.closure.}

  CallbackList = seq[LifecycleCallback]
  BundleCallbackList = seq[LifecycleBundleCallback]

  SdkLifecycleManager* = ref object
    # Current lifecycle state
    currentState*: LifecycleState

    # Standard lifecycle callbacks
    onCreateCallbacks: CallbackList
    onStartCallbacks: CallbackList
    onResumeCallbacks: CallbackList
    onPauseCallbacks: CallbackList
    onStopCallbacks: CallbackList
    onDestroyCallbacks: CallbackList
    onLowMemoryCallbacks: CallbackList

    # Bundle-based callbacks (for state persistence)
    onSaveInstanceCallbacks: BundleCallbackList
    onRestoreInstanceCallbacks: BundleCallbackList

    # Lifecycle event history (for debugging)
    eventHistory: seq[LifecycleEvent]
    maxHistorySize: int

# Global singleton for C-exported functions to access
var globalLifecycleManager: SdkLifecycleManager = nil

#
# Initialization
#

proc newSdkLifecycleManager*(): SdkLifecycleManager =
  result = SdkLifecycleManager(
    currentState: lsCreated,
    onCreateCallbacks: @[],
    onStartCallbacks: @[],
    onResumeCallbacks: @[],
    onPauseCallbacks: @[],
    onStopCallbacks: @[],
    onDestroyCallbacks: @[],
    onLowMemoryCallbacks: @[],
    onSaveInstanceCallbacks: @[],
    onRestoreInstanceCallbacks: @[],
    eventHistory: @[],
    maxHistorySize: 100  # Keep last 100 events for debugging
  )
  globalLifecycleManager = result

#
# Callback Registration API
#

proc onCreate*(lm: SdkLifecycleManager, callback: LifecycleCallback) =
  ## Register a callback to be called when Activity/Fragment is created
  lm.onCreateCallbacks.add(callback)

proc onStart*(lm: SdkLifecycleManager, callback: LifecycleCallback) =
  ## Register a callback to be called when Activity/Fragment becomes visible
  lm.onStartCallbacks.add(callback)

proc onResume*(lm: SdkLifecycleManager, callback: LifecycleCallback) =
  ## Register a callback to be called when Activity/Fragment gains focus
  lm.onResumeCallbacks.add(callback)

proc onPause*(lm: SdkLifecycleManager, callback: LifecycleCallback) =
  ## Register a callback to be called when Activity/Fragment loses focus
  lm.onPauseCallbacks.add(callback)

proc onStop*(lm: SdkLifecycleManager, callback: LifecycleCallback) =
  ## Register a callback to be called when Activity/Fragment is no longer visible
  lm.onStopCallbacks.add(callback)

proc onDestroy*(lm: SdkLifecycleManager, callback: LifecycleCallback) =
  ## Register a callback to be called when Activity/Fragment is destroyed
  lm.onDestroyCallbacks.add(callback)

proc onLowMemory*(lm: SdkLifecycleManager, callback: LifecycleCallback) =
  ## Register a callback to be called when system is low on memory
  ## Use this to clear caches, release non-essential resources
  lm.onLowMemoryCallbacks.add(callback)

proc onSaveInstanceState*(lm: SdkLifecycleManager, callback: LifecycleBundleCallback) =
  ## Register a callback to be called when Activity saves instance state
  ## Use this to persist data that should survive process death
  ## The Bundle is passed to the callback for saving data
  lm.onSaveInstanceCallbacks.add(callback)

proc onRestoreInstanceState*(lm: SdkLifecycleManager, callback: LifecycleBundleCallback) =
  ## Register a callback to be called when Activity restores instance state
  ## Use this to restore data after process death
  ## The Bundle is passed to the callback for restoring data
  lm.onRestoreInstanceCallbacks.add(callback)

#
# Callback Removal API
#

proc clearOnCreate*(lm: SdkLifecycleManager) =
  ## Remove all onCreate callbacks
  lm.onCreateCallbacks = @[]

proc clearOnResume*(lm: SdkLifecycleManager) =
  ## Remove all onResume callbacks
  lm.onResumeCallbacks = @[]

proc clearOnPause*(lm: SdkLifecycleManager) =
  ## Remove all onPause callbacks
  lm.onPauseCallbacks = @[]

proc clearOnDestroy*(lm: SdkLifecycleManager) =
  ## Remove all onDestroy callbacks
  lm.onDestroyCallbacks = @[]

proc clearAllCallbacks*(lm: SdkLifecycleManager) =
  ## Remove all registered callbacks
  lm.onCreateCallbacks = @[]
  lm.onStartCallbacks = @[]
  lm.onResumeCallbacks = @[]
  lm.onPauseCallbacks = @[]
  lm.onStopCallbacks = @[]
  lm.onDestroyCallbacks = @[]
  lm.onLowMemoryCallbacks = @[]
  lm.onSaveInstanceCallbacks = @[]
  lm.onRestoreInstanceCallbacks = @[]

#
# State Query API
#

proc getCurrentState*(lm: SdkLifecycleManager): LifecycleState =
  ## Get current lifecycle state
  return lm.currentState

proc isAtLeast*(lm: SdkLifecycleManager, state: LifecycleState): bool =
  ## Check if current state is at least the given state
  ## Useful for checking if Activity is visible (isAtLeast(lsStarted))
  case lm.currentState:
  of lsDestroyed: return false
  of lsCreated: return state == lsCreated
  of lsStopped: return state in {lsCreated, lsStopped}
  of lsPaused: return state in {lsCreated, lsStopped, lsPaused}
  of lsStarted: return state in {lsCreated, lsStopped, lsPaused, lsStarted}
  of lsResumed: return true  # Resumed is highest state

proc isResumed*(lm: SdkLifecycleManager): bool =
  ## Check if Activity is in RESUMED state (has focus)
  return lm.currentState == lsResumed

proc isVisible*(lm: SdkLifecycleManager): bool =
  ## Check if Activity is visible (STARTED or RESUMED)
  return lm.currentState in {lsStarted, lsResumed}

proc isDestroyed*(lm: SdkLifecycleManager): bool =
  ## Check if Activity is destroyed
  return lm.currentState == lsDestroyed

#
# Event History (Debugging)
#

proc getEventHistory*(lm: SdkLifecycleManager): seq[LifecycleEvent] =
  ## Get history of lifecycle events (useful for debugging)
  return lm.eventHistory

proc clearEventHistory*(lm: SdkLifecycleManager) =
  ## Clear event history
  lm.eventHistory = @[]

proc addToHistory(lm: SdkLifecycleManager, event: LifecycleEvent) =
  ## Internal: Add event to history
  lm.eventHistory.add(event)
  if lm.eventHistory.len > lm.maxHistorySize:
    lm.eventHistory.delete(0)  # Remove oldest

#
# Internal: Callback Dispatch
#

proc dispatchCallbacks(callbacks: CallbackList) =
  ## Internal: Execute all callbacks in list
  for callback in callbacks:
    try:
      callback()
    except:
      # TODO: Better error handling - log to Android logcat
      echo "Error in lifecycle callback: ", getCurrentExceptionMsg()

proc dispatchBundleCallbacks(callbacks: BundleCallbackList, bundle: jobject) =
  ## Internal: Execute all bundle callbacks
  for callback in callbacks:
    try:
      callback(bundle)
    except:
      echo "Error in lifecycle bundle callback: ", getCurrentExceptionMsg()

proc dispatchOnCreate(lm: SdkLifecycleManager) =
  lm.currentState = lsCreated
  lm.addToHistory(leCreate)
  dispatchCallbacks(lm.onCreateCallbacks)

proc dispatchOnStart(lm: SdkLifecycleManager) =
  lm.currentState = lsStarted
  lm.addToHistory(leStart)
  dispatchCallbacks(lm.onStartCallbacks)

proc dispatchOnResume(lm: SdkLifecycleManager) =
  lm.currentState = lsResumed
  lm.addToHistory(leResume)
  dispatchCallbacks(lm.onResumeCallbacks)

proc dispatchOnPause(lm: SdkLifecycleManager) =
  lm.currentState = lsPaused
  lm.addToHistory(lePause)
  dispatchCallbacks(lm.onPauseCallbacks)

proc dispatchOnStop(lm: SdkLifecycleManager) =
  lm.currentState = lsStopped
  lm.addToHistory(leStop)
  dispatchCallbacks(lm.onStopCallbacks)

proc dispatchOnDestroy(lm: SdkLifecycleManager) =
  lm.currentState = lsDestroyed
  lm.addToHistory(leDestroy)
  dispatchCallbacks(lm.onDestroyCallbacks)

proc dispatchOnLowMemory(lm: SdkLifecycleManager) =
  lm.addToHistory(leLowMemory)
  dispatchCallbacks(lm.onLowMemoryCallbacks)

proc dispatchOnSaveInstance(lm: SdkLifecycleManager, bundle: jobject) =
  lm.addToHistory(leSaveInstance)
  dispatchBundleCallbacks(lm.onSaveInstanceCallbacks, bundle)

proc dispatchOnRestoreInstance(lm: SdkLifecycleManager, bundle: jobject) =
  lm.addToHistory(leRestoreInstance)
  dispatchBundleCallbacks(lm.onRestoreInstanceCallbacks, bundle)

#
# C-Exported Functions (Called from Java/Kotlin Activity)
#
# Integration: Your Android Activity should call these from lifecycle methods:
#
# class MainActivity : AppCompatActivity() {
#     override fun onCreate(savedInstanceState: Bundle?) {
#         super.onCreate(savedInstanceState)
#         NimLifecycle_onCreate()
#         savedInstanceState?.let { NimLifecycle_onRestoreInstanceState(it) }
#     }
#
#     override fun onStart() {
#         super.onStart()
#         NimLifecycle_onStart()
#     }
#
#     override fun onResume() {
#         super.onResume()
#         NimLifecycle_onResume()
#     }
#
#     override fun onPause() {
#         super.onPause()
#         NimLifecycle_onPause()
#     }
#
#     override fun onStop() {
#         super.onStop()
#         NimLifecycle_onStop()
#     }
#
#     override fun onDestroy() {
#         super.onDestroy()
#         NimLifecycle_onDestroy()
#     }
#
#     override fun onSaveInstanceState(outState: Bundle) {
#         super.onSaveInstanceState(outState)
#         NimLifecycle_onSaveInstanceState(outState)
#     }
#
#     override fun onLowMemory() {
#         super.onLowMemory()
#         NimLifecycle_onLowMemory()
#     }
# }
#

proc NimLifecycle_onCreate*() {.exportc, dynlib.} =
  ## Called from Android Activity.onCreate()
  if globalLifecycleManager != nil:
    globalLifecycleManager.dispatchOnCreate()

proc NimLifecycle_onStart*() {.exportc, dynlib.} =
  ## Called from Android Activity.onStart()
  if globalLifecycleManager != nil:
    globalLifecycleManager.dispatchOnStart()

proc NimLifecycle_onResume*() {.exportc, dynlib.} =
  ## Called from Android Activity.onResume()
  if globalLifecycleManager != nil:
    globalLifecycleManager.dispatchOnResume()

proc NimLifecycle_onPause*() {.exportc, dynlib.} =
  ## Called from Android Activity.onPause()
  if globalLifecycleManager != nil:
    globalLifecycleManager.dispatchOnPause()

proc NimLifecycle_onStop*() {.exportc, dynlib.} =
  ## Called from Android Activity.onStop()
  if globalLifecycleManager != nil:
    globalLifecycleManager.dispatchOnStop()

proc NimLifecycle_onDestroy*() {.exportc, dynlib.} =
  ## Called from Android Activity.onDestroy()
  if globalLifecycleManager != nil:
    globalLifecycleManager.dispatchOnDestroy()

proc NimLifecycle_onLowMemory*() {.exportc, dynlib.} =
  ## Called from Android Activity.onLowMemory()
  if globalLifecycleManager != nil:
    globalLifecycleManager.dispatchOnLowMemory()

# Note: jobject parameters require proper JNI setup
# These will be called with Bundle objects from Java
proc NimLifecycle_onSaveInstanceState*(bundle: jobject) {.exportc, dynlib.} =
  ## Called from Android Activity.onSaveInstanceState(Bundle)
  if globalLifecycleManager != nil:
    globalLifecycleManager.dispatchOnSaveInstance(bundle)

proc NimLifecycle_onRestoreInstanceState*(bundle: jobject) {.exportc, dynlib.} =
  ## Called from Android Activity.onRestoreInstanceState(Bundle)
  if globalLifecycleManager != nil:
    globalLifecycleManager.dispatchOnRestoreInstance(bundle)

#
# Helper: Lifecycle-Aware Resource Management
#

type
  LifecycleAware* = ref object of RootObj
    ## Base type for objects that need lifecycle awareness
    ## Inherit from this and override lifecycle methods

method onLifecycleCreate*(self: LifecycleAware) {.base.} = discard
method onLifecycleStart*(self: LifecycleAware) {.base.} = discard
method onLifecycleResume*(self: LifecycleAware) {.base.} = discard
method onLifecyclePause*(self: LifecycleAware) {.base.} = discard
method onLifecycleStop*(self: LifecycleAware) {.base.} = discard
method onLifecycleDestroy*(self: LifecycleAware) {.base.} = discard

proc observe*(lm: SdkLifecycleManager, observer: LifecycleAware) =
  ## Register a LifecycleAware object to receive lifecycle events
  ## This is a convenience for objects that need full lifecycle awareness
  lm.onCreate(proc() = observer.onLifecycleCreate())
  lm.onStart(proc() = observer.onLifecycleStart())
  lm.onResume(proc() = observer.onLifecycleResume())
  lm.onPause(proc() = observer.onLifecyclePause())
  lm.onStop(proc() = observer.onLifecycleStop())
  lm.onDestroy(proc() = observer.onLifecycleDestroy())

#
# Runtime Integration
#

proc sdkLifecycleManager*(runtime: AndroidRuntime): SdkLifecycleManager =
  ## Get or create the SdkLifecycleManager instance
  ## Lazy initialization pattern
  if runtime.sdkLifecycleManager.isNone:
    runtime.sdkLifecycleManager = some(newSdkLifecycleManager())
  return runtime.sdkLifecycleManager.get()

# Convenience global accessor
proc lifecycle*(): SdkLifecycleManager =
  ## Global accessor for SdkLifecycleManager
  ## Requires AndroidRuntime to be initialized
  return runtime().sdkLifecycleManager()
