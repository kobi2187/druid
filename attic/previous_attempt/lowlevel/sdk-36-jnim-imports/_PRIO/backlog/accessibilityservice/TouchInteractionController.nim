import jnim

jclass android.accessibilityservice.TouchInteractionController* of JVMObject:
  proc registerCallback*(executor: Executor, callback: Callback)
  proc unregisterCallback*(callback: Callback): jboolean
  proc unregisterAllCallbacks*()
  proc requestTouchExploration*()
  proc requestDragging*(pointerId: jint)
  proc requestDelegating*()
  proc performClick*()
  proc performLongClickAndStartDrag*()
  proc getMaxPointerCount*(): jint
  proc getDisplayId*(): jint
  proc getState*(): jint
  proc stateToString*(state: jint): string {.`static`.}
  STATE_CLEAR*: jint {.`static`.}
  STATE_TOUCH_INTERACTING*: jint {.`static`.}
  STATE_TOUCH_EXPLORING*: jint {.`static`.}
  STATE_DRAGGING*: jint {.`static`.}
  STATE_DELEGATING*: jint {.`static`.}

