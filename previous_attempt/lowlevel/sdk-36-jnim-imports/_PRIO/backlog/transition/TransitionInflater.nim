import jnim

jclass android.transition.TransitionInflater* of JVMObject:
  proc from*(context: Context): TransitionInflater {.`static`.}
  proc inflateTransition*(resource: jint): Transition
  proc inflateTransitionManager*(resource: jint, sceneRoot: ViewGroup): TransitionManager

