import jnim

jclass android.media.MediaScannerConnection* of JVMObject:
  proc connect*()
  proc disconnect*()
  proc isConnected*(): jboolean
  proc scanFile*(path: string, mimeType: string)
  proc scanFile*(context: Context, paths: seq[string], mimeTypes: seq[string], callback: OnScanCompletedListener) {.`static`.}
  proc onServiceConnected*(className: ComponentName, service: IBinder)
  proc onServiceDisconnected*(className: ComponentName)

jclass android.media.MediaScannerConnection.OnScanCompletedListener* of JVMObject:
  proc onScanCompleted*(path: string, uri: Uri)

jclass android.media.MediaScannerConnection.MediaScannerConnectionClient* of JVMObject:
  proc onMediaScannerConnected*()

jclass android.media.OnScanCompletedListener* of JVMObject:
  proc onScanCompleted*(path: string, uri: Uri)

jclass android.media.MediaScannerConnectionClient* of OnScanCompletedListener:
  proc onMediaScannerConnected*()

