import jnim

jclass android.transition.TransitionPropagation* of JVMObject:
  proc getStartDelay*(sceneRoot: ViewGroup, transition: Transition, startValues: TransitionValues, endValues: TransitionValues): jlong
  proc captureValues*(transitionValues: TransitionValues)
  proc getPropagationProperties*(): seq[string]

