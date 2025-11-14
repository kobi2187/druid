import jnim

jclass android.transition.TransitionListenerAdapter* of JVMObject:
  proc onTransitionStart*(transition: Transition)
  proc onTransitionEnd*(transition: Transition)
  proc onTransitionCancel*(transition: Transition)
  proc onTransitionPause*(transition: Transition)
  proc onTransitionResume*(transition: Transition)

