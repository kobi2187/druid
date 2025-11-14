import jnim

jclass android.animation.LayoutTransition* of JVMObject:
  proc setDuration*(duration: jlong)
  proc enableTransitionType*(transitionType: jint)
  proc disableTransitionType*(transitionType: jint)
  proc isTransitionTypeEnabled*(transitionType: jint): jboolean
  proc setStartDelay*(transitionType: jint, delay: jlong)
  proc getStartDelay*(transitionType: jint): jlong
  proc setDuration*(transitionType: jint, duration: jlong)
  proc getDuration*(transitionType: jint): jlong
  proc setStagger*(transitionType: jint, duration: jlong)
  proc getStagger*(transitionType: jint): jlong
  proc setInterpolator*(transitionType: jint, interpolator: TimeInterpolator)
  proc getInterpolator*(transitionType: jint): TimeInterpolator
  proc setAnimator*(transitionType: jint, animator: Animator)
  proc getAnimator*(transitionType: jint): Animator
  proc setAnimateParentHierarchy*(animateParentHierarchy: jboolean)
  proc startChangingAnimations*()
  proc endChangingAnimations*()
  proc isChangingLayout*(): jboolean
  proc isRunning*(): jboolean
  proc cancel*()
  proc cancel*(transitionType: jint)
  proc layoutChange*(parent: ViewGroup)
  proc addChild*(parent: ViewGroup, child: View)
  proc showChild*(parent: ViewGroup, child: View)
  proc showChild*(parent: ViewGroup, child: View, oldVisibility: jint)
  proc removeChild*(parent: ViewGroup, child: View)
  proc hideChild*(parent: ViewGroup, child: View)
  proc hideChild*(parent: ViewGroup, child: View, newVisibility: jint)
  proc addTransitionListener*(listener: TransitionListener)
  proc removeTransitionListener*(listener: TransitionListener)
  proc getTransitionListeners*(): List[TransitionListener]
  CHANGE_APPEARING*: jint {.`static`.}
  CHANGE_DISAPPEARING*: jint {.`static`.}
  APPEARING*: jint {.`static`.}
  DISAPPEARING*: jint {.`static`.}
  CHANGING*: jint {.`static`.}

jclass android.animation.LayoutTransition.TransitionListener* of JVMObject:
  proc startTransition*(transition: LayoutTransition, container: ViewGroup, view: View, transitionType: jint)
  proc endTransition*(transition: LayoutTransition, container: ViewGroup, view: View, transitionType: jint)

jclass android.animation.TransitionListener* of JVMObject:
  proc startTransition*(transition: LayoutTransition, container: ViewGroup, view: View, transitionType: jint)
  proc endTransition*(transition: LayoutTransition, container: ViewGroup, view: View, transitionType: jint)

