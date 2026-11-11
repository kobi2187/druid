import jnim

jclass android.transition.ChangeTransform* of Transition:
  proc getReparentWithOverlay*(): jboolean
  proc setReparentWithOverlay*(reparentWithOverlay: jboolean)
  proc getReparent*(): jboolean
  proc setReparent*(reparent: jboolean)
  proc getTransitionProperties*(): seq[string]
  proc captureStartValues*(transitionValues: TransitionValues)
  proc captureEndValues*(transitionValues: TransitionValues)
  proc createAnimator*(sceneRoot: ViewGroup, startValues: TransitionValues, endValues: TransitionValues): Animator

