import jnim

jclass android.app.QueuedWork* of JVMObject:
  proc resetHandler*() {.`static`.}
  proc addFinisher*(finisher: Runnable) {.`static`.}
  proc removeFinisher*(finisher: Runnable) {.`static`.}
  proc waitToFinish*() {.`static`.}
  proc queue*(work: Runnable, shouldDelay: jboolean) {.`static`.}
  proc hasPendingWork*(): jboolean {.`static`.}

