import jnim

jclass android.window.SurfaceSyncGroup* of JVMObject:
  proc setTransactionFactory*(transactionFactory: Supplier[Transaction]) {.`static`.}
  proc addSyncCompleteCallback*(executor: Executor, runnable: Runnable)
  proc markSyncReady*()
  proc add*(surfaceView: SurfaceView, frameCallbackConsumer: Consumer[SurfaceViewFrameCallback]): jboolean
  proc add*(attachedSurfaceControl: AttachedSurfaceControl, runnable: Runnable): jboolean
  proc add*(surfacePackage: SurfaceControlViewHost.SurfacePackage, runnable: Runnable): jboolean
  proc add*(surfaceSyncGroup: SurfaceSyncGroup, runnable: Runnable): jboolean
  proc add*(surfaceSyncGroup: ISurfaceSyncGroup, parentSyncGroupMerge: jboolean, runnable: Runnable): jboolean
  proc addTransaction*(transaction: Transaction)
  proc setAddedToSyncListener*(addedToSyncListener: Runnable)
  proc getName*(): string
  proc createTransactionReadyCallback*(parentSyncGroupMerge: jboolean): ITransactionReadyCallback
  proc toggleTimeout*(enable: jboolean)
  proc isComplete*(): jboolean
  TRANSACTION_READY_TIMEOUT*: jint {.`static`.}
  mISurfaceSyncGroup*: ISurfaceSyncGroup

