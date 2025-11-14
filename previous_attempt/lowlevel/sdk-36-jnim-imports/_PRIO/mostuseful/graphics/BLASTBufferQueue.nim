import jnim

jclass android.graphics.BLASTBufferQueue* of JVMObject:
  proc destroy*()
  proc createSurface*(): Surface
  proc createSurfaceWithHandle*(): Surface
  proc syncNextTransaction*(acquireSingleBuffer: jboolean, callback: Consumer[SurfaceControl.Transaction]): jboolean
  proc syncNextTransaction*(callback: Consumer[SurfaceControl.Transaction]): jboolean
  proc stopContinuousSyncTransaction*()
  proc clearSyncTransaction*()
  proc update*(sc: SurfaceControl, width: jint, height: jint, format: jint)
  proc mergeWithNextTransaction*(t: SurfaceControl.Transaction, frameNumber: jlong)
  proc mergeWithNextTransaction*(nativeTransaction: jlong, frameNumber: jlong)
  proc applyPendingTransactions*(frameNumber: jlong)
  proc getLastAcquiredFrameNum*(): jlong
  proc isSameSurfaceControl*(sc: SurfaceControl): jboolean
  proc gatherPendingTransactions*(frameNumber: jlong): SurfaceControl.Transaction
  proc setTransactionHangCallback*(hangCallback: TransactionHangCallback)
  proc setApplyToken*(applyToken: IBinder)
  proc setWaitForBufferReleaseCallback*(waitCallback: WaitForBufferReleaseCallback)
  mNativeObject*: jlong


