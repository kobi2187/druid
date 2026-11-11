import jnim

jclass android.window.WindowOrganizer* of JVMObject:
  proc applyTransaction*(t: WindowContainerTransaction)
  proc applySyncTransaction*(t: WindowContainerTransaction, callback: WindowContainerTransactionCallback): jint
  proc startNewTransition*(type: jint, t: WindowContainerTransaction): IBinder
  proc startTransition*(transitionToken: IBinder, t: WindowContainerTransaction)
  proc finishTransition*(transitionToken: IBinder, t: WindowContainerTransaction)
  proc registerTransitionPlayer*(player: ITransitionPlayer)
  proc unregisterTransitionPlayer*(player: ITransitionPlayer)
  proc getTransitionMetricsReporter*(): ITransitionMetricsReporter {.`static`.}
  proc shareTransactionQueue*(): jboolean

