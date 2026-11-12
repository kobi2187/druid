import jnim

jclass android.transition.Visibility* of Transition:
  proc setSuppressLayout*(suppress: jboolean)
  proc setMode*(mode: jint)
  proc getMode*(): jint
  proc getTransitionProperties*(): seq[string]
  proc captureStartValues*(transitionValues: TransitionValues)
  proc captureEndValues*(transitionValues: TransitionValues)
  proc isVisible*(values: TransitionValues): jboolean
  proc createAnimator*(sceneRoot: ViewGroup, startValues: TransitionValues, endValues: TransitionValues): Animator
  proc onAppear*(sceneRoot: ViewGroup, startValues: TransitionValues, startVisibility: jint, endValues: TransitionValues, endVisibility: jint): Animator
  proc onAppear*(sceneRoot: ViewGroup, view: View, startValues: TransitionValues, endValues: TransitionValues): Animator
  proc onDisappear*(sceneRoot: ViewGroup, startValues: TransitionValues, startVisibility: jint, endValues: TransitionValues, endVisibility: jint): Animator
  proc isTransitionRequired*(startValues: TransitionValues, newValues: TransitionValues): jboolean
  proc onDisappear*(sceneRoot: ViewGroup, view: View, startValues: TransitionValues, endValues: TransitionValues): Animator
  MODE_IN*: jint {.`static`.}
  MODE_OUT*: jint {.`static`.}

