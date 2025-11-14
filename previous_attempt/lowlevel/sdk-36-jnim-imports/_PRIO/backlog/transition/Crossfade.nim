import jnim

jclass android.transition.Crossfade* of Transition:
  proc setFadeBehavior*(fadeBehavior: jint): Crossfade
  proc getFadeBehavior*(): jint
  proc setResizeBehavior*(resizeBehavior: jint): Crossfade
  proc getResizeBehavior*(): jint
  proc createAnimator*(sceneRoot: ViewGroup, startValues: TransitionValues, endValues: TransitionValues): Animator
  proc captureStartValues*(transitionValues: TransitionValues)
  proc captureEndValues*(transitionValues: TransitionValues)
  FADE_BEHAVIOR_CROSSFADE*: jint {.`static`.}
  FADE_BEHAVIOR_REVEAL*: jint {.`static`.}
  FADE_BEHAVIOR_OUT_IN*: jint {.`static`.}
  RESIZE_BEHAVIOR_NONE*: jint {.`static`.}
  RESIZE_BEHAVIOR_SCALE*: jint {.`static`.}

