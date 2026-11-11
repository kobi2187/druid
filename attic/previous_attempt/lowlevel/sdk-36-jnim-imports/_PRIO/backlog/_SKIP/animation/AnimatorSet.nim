import jnim

jclass android.animation.AnimatorSet* of Animator:
  proc playTogether*(items: Animator)
  proc playTogether*(items: Collection[Animator])
  proc playSequentially*(items: Animator)
  proc playSequentially*(items: List[Animator])
  proc getChildAnimations*(): ArrayList[Animator]
  proc setTarget*(target: JObject)
  proc getChangingConfigurations*(): jint
  proc setInterpolator*(interpolator: TimeInterpolator)
  proc getInterpolator*(): TimeInterpolator
  proc play*(anim: Animator): Builder
  proc cancel*()
  proc end*()
  proc isRunning*(): jboolean
  proc isStarted*(): jboolean
  proc getStartDelay*(): jlong
  proc setStartDelay*(startDelay: jlong)
  proc getDuration*(): jlong
  proc setDuration*(duration: jlong): AnimatorSet
  proc setupStartValues*()
  proc setupEndValues*()
  proc pause*()
  proc resume*()
  proc start*()
  proc setCurrentPlayTime*(playTime: jlong)
  proc getCurrentPlayTime*(): jlong
  proc doAnimationFrame*(frameTime: jlong): jboolean
  proc commitAnimationFrame*(frameTime: jlong)
  proc clone*(): AnimatorSet
  proc canReverse*(): jboolean
  proc reverse*()
  proc toString*(): string
  proc shouldPlayTogether*(): jboolean
  proc getTotalDuration*(): jlong

jclass android.animation.AnimatorSet.Builder* of JVMObject:
  proc with*(anim: Animator): Builder
  proc before*(anim: Animator): Builder
  proc after*(anim: Animator): Builder
  proc after*(delay: jlong): Builder

jclass android.animation.Builder* of JVMObject:
  proc with*(anim: Animator): Builder
  proc before*(anim: Animator): Builder
  proc after*(anim: Animator): Builder
  proc after*(delay: jlong): Builder

