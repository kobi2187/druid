import jnim

jclass android.transition.SidePropagation* of VisibilityPropagation:
  proc setSide*(side: jint)
  proc setPropagationSpeed*(propagationSpeed: jfloat)
  proc getStartDelay*(sceneRoot: ViewGroup, transition: Transition, startValues: TransitionValues, endValues: TransitionValues): jlong

