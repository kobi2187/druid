import jnim

jclass android.window.WindowContainerTransactionCallback* of JVMObject:
  proc onTransactionReady*(id: jint, t: SurfaceControl.Transaction)

