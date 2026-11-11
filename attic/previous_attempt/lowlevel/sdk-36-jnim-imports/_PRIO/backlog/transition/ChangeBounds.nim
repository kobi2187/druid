import jnim

jclass android.transition.ChangeBounds* of Transition:
  proc getTransitionProperties*(): seq[string]
  proc setResizeClip*(resizeClip: jboolean)
  proc getResizeClip*(): jboolean
  proc setReparent*(reparent: jboolean)
  proc captureStartValues*(transitionValues: TransitionValues)
  proc captureEndValues*(transitionValues: TransitionValues)
  proc createAnimator*(sceneRoot: ViewGroup, startValues: TransitionValues, endValues: TransitionValues): Animator

