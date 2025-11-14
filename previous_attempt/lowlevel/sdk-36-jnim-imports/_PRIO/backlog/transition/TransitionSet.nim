import jnim

jclass android.transition.TransitionSet* of Transition:
  proc setOrdering*(ordering: jint): TransitionSet
  proc getOrdering*(): jint
  proc addTransition*(transition: Transition): TransitionSet
  proc getTransitionCount*(): jint
  proc getTransitionAt*(index: jint): Transition
  proc setDuration*(duration: jlong): TransitionSet
  proc setStartDelay*(startDelay: jlong): TransitionSet
  proc setInterpolator*(interpolator: TimeInterpolator): TransitionSet
  proc addTarget*(target: View): TransitionSet
  proc addTarget*(targetId: jint): TransitionSet
  proc addTarget*(targetName: string): TransitionSet
  proc addTarget*(targetType: Class): TransitionSet
  proc addListener*(listener: TransitionListener): TransitionSet
  proc removeTarget*(targetId: jint): TransitionSet
  proc removeTarget*(target: View): TransitionSet
  proc removeTarget*(target: Class): TransitionSet
  proc removeTarget*(target: string): TransitionSet
  proc excludeTarget*(target: View, exclude: jboolean): Transition
  proc excludeTarget*(targetName: string, exclude: jboolean): Transition
  proc excludeTarget*(targetId: jint, exclude: jboolean): Transition
  proc excludeTarget*(type: Class, exclude: jboolean): Transition
  proc removeListener*(listener: TransitionListener): TransitionSet
  proc setPathMotion*(pathMotion: PathMotion)
  proc removeTransition*(transition: Transition): TransitionSet
  proc captureStartValues*(transitionValues: TransitionValues)
  proc captureEndValues*(transitionValues: TransitionValues)
  proc pause*(sceneRoot: View)
  proc resume*(sceneRoot: View)
  proc setPropagation*(propagation: TransitionPropagation)
  proc setEpicenterCallback*(epicenterCallback: EpicenterCallback)
  proc clone*(): TransitionSet
  ORDERING_TOGETHER*: jint {.`static`.}
  ORDERING_SEQUENTIAL*: jint {.`static`.}

