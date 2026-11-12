import jnim

jclass android.view.VelocityTracker* of JVMObject:
  proc obtain*(): VelocityTracker {.`static`.}
  proc obtain*(strategy: string): VelocityTracker {.`static`.}
  proc obtain*(strategy: jint): VelocityTracker {.`static`.}
  proc recycle*()
  proc getStrategyId*(): jint
  proc isAxisSupported*(axis: jint): jboolean
  proc clear*()
  proc addMovement*(event: MotionEvent)
  proc computeCurrentVelocity*(units: jint)
  proc computeCurrentVelocity*(units: jint, maxVelocity: jfloat)
  proc getXVelocity*(): jfloat
  proc getYVelocity*(): jfloat
  proc getXVelocity*(id: jint): jfloat
  proc getYVelocity*(id: jint): jfloat
  proc getAxisVelocity*(axis: jint, id: jint): jfloat
  proc getAxisVelocity*(axis: jint): jfloat
  VELOCITY_TRACKER_STRATEGY_DEFAULT*: jint {.`static`.}
  VELOCITY_TRACKER_STRATEGY_IMPULSE*: jint {.`static`.}
  VELOCITY_TRACKER_STRATEGY_LSQ1*: jint {.`static`.}
  VELOCITY_TRACKER_STRATEGY_LSQ2*: jint {.`static`.}
  VELOCITY_TRACKER_STRATEGY_LSQ3*: jint {.`static`.}
  VELOCITY_TRACKER_STRATEGY_WLSQ2_DELTA*: jint {.`static`.}
  VELOCITY_TRACKER_STRATEGY_WLSQ2_CENTRAL*: jint {.`static`.}
  VELOCITY_TRACKER_STRATEGY_WLSQ2_RECENT*: jint {.`static`.}
  VELOCITY_TRACKER_STRATEGY_INT1*: jint {.`static`.}
  VELOCITY_TRACKER_STRATEGY_INT2*: jint {.`static`.}
  VELOCITY_TRACKER_STRATEGY_LEGACY*: jint {.`static`.}

