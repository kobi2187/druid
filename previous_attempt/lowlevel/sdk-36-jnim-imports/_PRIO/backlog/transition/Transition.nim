import jnim

jclass android.transition.Transition* of JVMObject:
  proc setDuration*(duration: jlong): Transition
  proc getDuration*(): jlong
  proc setStartDelay*(startDelay: jlong): Transition
  proc getStartDelay*(): jlong
  proc setInterpolator*(interpolator: TimeInterpolator): Transition
  proc getInterpolator*(): TimeInterpolator
  proc getTransitionProperties*(): seq[string]
  proc createAnimator*(sceneRoot: ViewGroup, startValues: TransitionValues, endValues: TransitionValues): Animator
  proc setMatchOrder*(matches: jint)
  proc isValidTarget*(target: View): jboolean
  proc captureStartValues*(transitionValues: TransitionValues)
  proc captureEndValues*(transitionValues: TransitionValues)
  proc addTarget*(targetId: jint): Transition
  proc addTarget*(targetName: string): Transition
  proc addTarget*(targetType: Class): Transition
  proc removeTarget*(targetId: jint): Transition
  proc removeTarget*(targetName: string): Transition
  proc excludeTarget*(targetId: jint, exclude: jboolean): Transition
  proc excludeTarget*(targetName: string, exclude: jboolean): Transition
  proc excludeChildren*(targetId: jint, exclude: jboolean): Transition
  proc excludeTarget*(target: View, exclude: jboolean): Transition
  proc excludeChildren*(target: View, exclude: jboolean): Transition
  proc excludeTarget*(type: Class, exclude: jboolean): Transition
  proc excludeChildren*(type: Class, exclude: jboolean): Transition
  proc addTarget*(target: View): Transition
  proc removeTarget*(target: View): Transition
  proc removeTarget*(target: Class): Transition
  proc getTargetIds*(): List[Integer]
  proc getTargets*(): List[View]
  proc getTargetNames*(): List[string]
  proc getTargetViewNames*(): List[string]
  proc getTargetTypes*(): List[Class]
  proc getTransitionValues*(view: View, start: jboolean): TransitionValues
  proc pause*(sceneRoot: View)
  proc resume*(sceneRoot: View)
  proc isTransitionRequired*(startValues: TransitionValues, endValues: TransitionValues): jboolean
  proc addListener*(listener: TransitionListener): Transition
  proc removeListener*(listener: TransitionListener): Transition
  proc setEpicenterCallback*(epicenterCallback: EpicenterCallback)
  proc getEpicenterCallback*(): EpicenterCallback
  proc getEpicenter*(): Rect
  proc setPathMotion*(pathMotion: PathMotion)
  proc getPathMotion*(): PathMotion
  proc setPropagation*(transitionPropagation: TransitionPropagation)
  proc getPropagation*(): TransitionPropagation
  proc canRemoveViews*(): jboolean
  proc setNameOverrides*(overrides: ArrayMap[string, string])
  proc getNameOverrides*(): ArrayMap[string, string]
  proc toString*(): string
  proc clone*(): Transition
  proc getName*(): string
  MATCH_INSTANCE*: jint {.`static`.}
  MATCH_NAME*: jint {.`static`.}
  MATCH_ID*: jint {.`static`.}
  MATCH_ITEM_ID*: jint {.`static`.}

jclass android.transition.Transition.EpicenterCallback* of JVMObject:
  proc onGetEpicenter*(transition: Transition): Rect


jclass android.transition.AnimationInfo* of JVMObject:
  view*: View

jclass android.transition.EpicenterCallback* of JVMObject:
  proc onGetEpicenter*(transition: Transition): Rect

