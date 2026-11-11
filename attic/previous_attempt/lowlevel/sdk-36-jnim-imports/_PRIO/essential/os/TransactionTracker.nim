import jnim

jclass android.os.TransactionTracker* of JVMObject:
  proc addTrace*(tr: Throwable)
  proc writeTracesToFile*(fd: ParcelFileDescriptor)
  proc clearTraces*()

