import jnim

jclass android.transition.Slide* of Visibility:
  proc captureStartValues*(transitionValues: TransitionValues)
  proc captureEndValues*(transitionValues: TransitionValues)
  proc setSlideEdge*(slideEdge: jint)
  proc getSlideEdge*(): jint
  proc onAppear*(sceneRoot: ViewGroup, view: View, startValues: TransitionValues, endValues: TransitionValues): Animator
  proc onDisappear*(sceneRoot: ViewGroup, view: View, startValues: TransitionValues, endValues: TransitionValues): Animator
  proc setSlideFraction*(slideFraction: jfloat)

