import jnim

jclass android.transition.ChangeClipBounds* of Transition:
  proc getTransitionProperties*(): seq[string]
  proc captureStartValues*(transitionValues: TransitionValues)
  proc captureEndValues*(transitionValues: TransitionValues)
  proc createAnimator*(sceneRoot: ViewGroup, startValues: TransitionValues, endValues: TransitionValues): Animator

