import jnim

jclass android.transition.Explode* of Visibility:
  proc captureStartValues*(transitionValues: TransitionValues)
  proc captureEndValues*(transitionValues: TransitionValues)
  proc onAppear*(sceneRoot: ViewGroup, view: View, startValues: TransitionValues, endValues: TransitionValues): Animator
  proc onDisappear*(sceneRoot: ViewGroup, view: View, startValues: TransitionValues, endValues: TransitionValues): Animator

