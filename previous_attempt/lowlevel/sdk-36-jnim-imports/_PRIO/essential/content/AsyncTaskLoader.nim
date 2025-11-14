import jnim

jclass android.content.AsyncTaskLoader* of Loader:
  proc setUpdateThrottle*(delayMS: jlong)
  proc onCanceled*(data: D)
  proc loadInBackground*(): D
  proc cancelLoadInBackground*()
  proc isLoadInBackgroundCanceled*(): jboolean
  proc waitForLoader*()
  proc dump*(prefix: string, fd: FileDescriptor, writer: PrintWriter, args: seq[string])

