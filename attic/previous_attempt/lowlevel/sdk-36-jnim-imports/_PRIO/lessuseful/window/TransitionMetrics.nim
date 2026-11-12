import jnim

jclass android.window.TransitionMetrics* of JVMObject:
  proc reportAnimationStart*(transitionToken: IBinder)
  proc getInstance*(): TransitionMetrics {.`static`.}

