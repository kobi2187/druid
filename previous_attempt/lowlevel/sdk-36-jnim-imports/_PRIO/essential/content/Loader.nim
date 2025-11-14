import jnim

jclass android.content.Loader* of JVMObject:
  proc deliverResult*(data: D)
  proc deliverCancellation*()
  proc getContext*(): Context
  proc getId*(): jint
  proc registerListener*(id: jint, listener: OnLoadCompleteListener[D])
  proc unregisterListener*(listener: OnLoadCompleteListener[D])
  proc registerOnLoadCanceledListener*(listener: OnLoadCanceledListener[D])
  proc unregisterOnLoadCanceledListener*(listener: OnLoadCanceledListener[D])
  proc isStarted*(): jboolean
  proc isAbandoned*(): jboolean
  proc isReset*(): jboolean
  proc startLoading*()
  proc cancelLoad*(): jboolean
  proc forceLoad*()
  proc stopLoading*()
  proc abandon*()
  proc reset*()
  proc takeContentChanged*(): jboolean
  proc commitContentChanged*()
  proc rollbackContentChanged*()
  proc onContentChanged*()
  proc dataToString*(data: D): string
  proc toString*(): string
  proc dump*(prefix: string, fd: FileDescriptor, writer: PrintWriter, args: seq[string])

jclass android.content.Loader.ForceLoadContentObserver* of JVMObject:
  proc deliverSelfNotifications*(): jboolean
  proc onChange*(selfChange: jboolean)

jclass android.content.Loader.OnLoadCompleteListener* of JVMObject:
  proc onLoadComplete*(loader: Loader[D], data: D)

jclass android.content.Loader.OnLoadCanceledListener* of JVMObject:
  proc onLoadCanceled*(loader: Loader[D])

jclass android.content.ForceLoadContentObserver* of ContentObserver:
  proc deliverSelfNotifications*(): jboolean
  proc onChange*(selfChange: jboolean)

jclass android.content.OnLoadCompleteListener* of JVMObject:
  proc onLoadComplete*(loader: Loader[D], data: D)

jclass android.content.OnLoadCanceledListener* of JVMObject:
  proc onLoadCanceled*(loader: Loader[D])

