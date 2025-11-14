import jnim

jclass android.animation.AnimationHandler* of JVMObject:
  proc getInstance*(): AnimationHandler {.`static`.}
  proc setTestHandler*(handler: AnimationHandler): AnimationHandler {.`static`.}
  proc setAnimatorPausingEnabled*(enable: jboolean) {.`static`.}
  proc setOverrideAnimatorPausingSystemProperty*(enable: jboolean) {.`static`.}
  proc removeRequestor*(requestor: JObject) {.`static`.}
  proc requestAnimatorsEnabled*(enable: jboolean, requestor: JObject) {.`static`.}
  proc setProvider*(provider: AnimationFrameCallbackProvider)
  proc addAnimationFrameCallback*(callback: AnimationFrameCallback, delay: jlong)
  proc addOneShotCommitCallback*(callback: AnimationFrameCallback)
  proc removeCallback*(callback: AnimationFrameCallback)
  proc getLastAnimationFrameVsyncId*(currentVsyncId: jlong): jlong
  proc postEndAnimationCallback*(notifyEndAnimation: Runnable)
  proc getAnimationCount*(): jint {.`static`.}
  proc setFrameDelay*(delay: jlong) {.`static`.}
  proc getFrameDelay*(): jlong {.`static`.}
  sAnimatorHandler*: ThreadLocal[AnimationHandler] {.`static`.}


