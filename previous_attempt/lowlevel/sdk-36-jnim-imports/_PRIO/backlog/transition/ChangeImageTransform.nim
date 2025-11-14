import jnim

jclass android.transition.ChangeImageTransform* of Transition:
  proc captureStartValues*(transitionValues: TransitionValues)
  proc captureEndValues*(transitionValues: TransitionValues)
  proc getTransitionProperties*(): seq[string]
  proc createAnimator*(sceneRoot: ViewGroup, startValues: TransitionValues, endValues: TransitionValues): Animator

