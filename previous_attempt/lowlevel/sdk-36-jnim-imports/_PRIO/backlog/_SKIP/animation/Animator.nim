import jnim

jclass android.animation.Animator* of JVMObject:
  proc setBackgroundPauseDelay*(value: jlong) {.`static`.}
  proc getBackgroundPauseDelay*(): jlong {.`static`.}
  proc setAnimatorPausingEnabled*(enable: jboolean) {.`static`.}
  proc setPostNotifyEndListenerEnabled*(enable: jboolean) {.`static`.}
  proc isPostNotifyEndListenerEnabled*(): jboolean {.`static`.}
  proc start*()
  proc cancel*()
  proc end*()
  proc pause*()
  proc resume*()
  proc isPaused*(): jboolean
  proc getStartDelay*(): jlong
  proc setStartDelay*(startDelay: jlong)
  proc setDuration*(duration: jlong): Animator
  proc getDuration*(): jlong
  proc getTotalDuration*(): jlong
  proc setInterpolator*(value: TimeInterpolator)
  proc getInterpolator*(): TimeInterpolator
  proc isRunning*(): jboolean
  proc isStarted*(): jboolean
  proc addListener*(listener: AnimatorListener)
  proc removeListener*(listener: AnimatorListener)
  proc getListeners*(): ArrayList[AnimatorListener]
  proc addPauseListener*(listener: AnimatorPauseListener)
  proc removePauseListener*(listener: AnimatorPauseListener)
  proc removeAllListeners*()
  proc getChangingConfigurations*(): jint
  proc setChangingConfigurations*(configs: jint)
  proc appendChangingConfigurations*(configs: jint)
  proc createConstantState*(): ConstantState[Animator]
  proc clone*(): Animator
  proc setupStartValues*()
  proc setupEndValues*()
  proc setTarget*(target: JObject)
  proc canReverse*(): jboolean
  proc reverse*()
  proc setAllowRunningAsynchronously*(mayRunAsync: jboolean)
  DURATION_INFINITE*: jlong {.`static`.}


