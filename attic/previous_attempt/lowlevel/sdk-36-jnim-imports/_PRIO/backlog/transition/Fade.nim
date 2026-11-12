import jnim

jclass android.transition.Fade* of Visibility:
  proc captureStartValues*(transitionValues: TransitionValues)
  proc onAppear*(sceneRoot: ViewGroup, view: View, startValues: TransitionValues, endValues: TransitionValues): Animator
  proc onDisappear*(sceneRoot: ViewGroup, view: View, startValues: TransitionValues, endValues: TransitionValues): Animator
  IN*: jint {.`static`.}
  OUT*: jint {.`static`.}

