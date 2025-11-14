import jnim

jclass android.transition.ChangeText* of Transition:
  proc setChangeBehavior*(changeBehavior: jint): ChangeText
  proc getTransitionProperties*(): seq[string]
  proc getChangeBehavior*(): jint
  proc captureStartValues*(transitionValues: TransitionValues)
  proc captureEndValues*(transitionValues: TransitionValues)
  proc createAnimator*(sceneRoot: ViewGroup, startValues: TransitionValues, endValues: TransitionValues): Animator
  CHANGE_BEHAVIOR_KEEP*: jint {.`static`.}
  CHANGE_BEHAVIOR_OUT*: jint {.`static`.}
  CHANGE_BEHAVIOR_IN*: jint {.`static`.}
  CHANGE_BEHAVIOR_OUT_IN*: jint {.`static`.}

