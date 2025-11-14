import jnim

jclass android.content.SyncContext* of JVMObject:
  proc setStatusText*(message: string)
  proc onFinished*(result: SyncResult)
  proc getSyncContextBinder*(): IBinder

