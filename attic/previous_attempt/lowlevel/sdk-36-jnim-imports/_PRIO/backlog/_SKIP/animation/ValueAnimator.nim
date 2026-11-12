import jnim

jclass android.animation.ValueAnimator* of Animator:
  proc setDurationScale*(durationScale: jfloat) {.`static`.}
  proc getDurationScale*(): jfloat {.`static`.}
  proc registerDurationScaleChangeListener*(listener: DurationScaleChangeListener): jboolean {.`static`.}
  proc unregisterDurationScaleChangeListener*(listener: DurationScaleChangeListener): jboolean {.`static`.}
  proc areAnimatorsEnabled*(): jboolean {.`static`.}
  proc ofInt*(values: jint): ValueAnimator {.`static`.}
  proc ofArgb*(values: jint): ValueAnimator {.`static`.}
  proc ofFloat*(values: jfloat): ValueAnimator {.`static`.}
  proc ofPropertyValuesHolder*(values: PropertyValuesHolder): ValueAnimator {.`static`.}
  proc ofObject*(evaluator: TypeEvaluator, values: JObject): ValueAnimator {.`static`.}
  proc setIntValues*(values: jint)
  proc setFloatValues*(values: jfloat)
  proc setObjectValues*(values: JObject)
  proc setValues*(values: PropertyValuesHolder)
  proc getValues*(): seq[PropertyValuesHolder]
  proc setDuration*(duration: jlong): ValueAnimator
  proc overrideDurationScale*(durationScale: jfloat)
  proc getDuration*(): jlong
  proc getTotalDuration*(): jlong
  proc setCurrentPlayTime*(playTime: jlong)
  proc setCurrentFraction*(fraction: jfloat)
  proc getCurrentPlayTime*(): jlong
  proc getStartDelay*(): jlong
  proc setStartDelay*(startDelay: jlong)
  proc getFrameDelay*(): jlong {.`static`.}
  proc setFrameDelay*(frameDelay: jlong) {.`static`.}
  proc getAnimatedValue*(): JObject
  proc getAnimatedValue*(propertyName: string): JObject
  proc setRepeatCount*(value: jint)
  proc getRepeatCount*(): jint
  proc setRepeatMode*(value: jint)
  proc getRepeatMode*(): jint
  proc addUpdateListener*(listener: AnimatorUpdateListener)
  proc removeAllUpdateListeners*()
  proc removeUpdateListener*(listener: AnimatorUpdateListener)
  proc setInterpolator*(value: TimeInterpolator)
  proc getInterpolator*(): TimeInterpolator
  proc setEvaluator*(value: TypeEvaluator)
  proc start*()
  proc cancel*()
  proc end*()
  proc resume*()
  proc pause*()
  proc isRunning*(): jboolean
  proc isStarted*(): jboolean
  proc reverse*()
  proc canReverse*(): jboolean
  proc commitAnimationFrame*(frameTime: jlong)
  proc doAnimationFrame*(frameTime: jlong): jboolean
  proc getAnimatedFraction*(): jfloat
  proc clone*(): ValueAnimator
  proc getCurrentAnimationsCount*(): jint {.`static`.}
  proc toString*(): string
  proc setAllowRunningAsynchronously*(mayRunAsync: jboolean)
  proc getAnimationHandler*(): AnimationHandler
  proc setAnimationHandler*(animationHandler: AnimationHandler)
  RESTART*: jint {.`static`.}
  REVERSE*: jint {.`static`.}
  INFINITE*: jint {.`static`.}


