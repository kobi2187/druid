import jnim

jclass android.transition.CircularPropagation* of VisibilityPropagation:
  proc setPropagationSpeed*(propagationSpeed: jfloat)
  proc getStartDelay*(sceneRoot: ViewGroup, transition: Transition, startValues: TransitionValues, endValues: TransitionValues): jlong

