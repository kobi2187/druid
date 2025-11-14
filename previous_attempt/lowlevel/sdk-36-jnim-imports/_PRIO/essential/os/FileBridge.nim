import jnim

jclass android.os.FileBridge* of Thread:
  proc isClosed*(): jboolean
  proc forceClose*()
  proc setTargetFile*(target: ParcelFileDescriptor)
  proc getClientSocket*(): ParcelFileDescriptor
  proc run*()

jclass android.os.FileBridge.FileBridgeOutputStream* of JVMObject:
  proc close*()
  proc fsync*()
  proc write*(buffer: seq[jbyte], byteOffset: jint, byteCount: jint)
  proc write*(oneByte: jint)

jclass android.os.FileBridgeOutputStream* of OutputStream:
  proc close*()
  proc fsync*()
  proc write*(buffer: seq[jbyte], byteOffset: jint, byteCount: jint)
  proc write*(oneByte: jint)

