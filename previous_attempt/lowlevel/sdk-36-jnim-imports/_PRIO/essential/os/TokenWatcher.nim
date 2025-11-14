import jnim

jclass android.os.TokenWatcher* of JVMObject:
  proc acquired*()
  proc released*()
  proc acquire*(token: IBinder, tag: string)
  proc cleanup*(token: IBinder, unlink: jboolean)
  proc release*(token: IBinder)
  proc isAcquired*(): jboolean
  proc dump*()
  proc dump*(pw: PrintWriter)

