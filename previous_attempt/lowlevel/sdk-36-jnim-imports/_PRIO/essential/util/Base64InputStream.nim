import jnim

jclass android.util.Base64InputStream* of FilterInputStream:
  proc markSupported*(): jboolean
  proc mark*(readlimit: jint)
  proc reset*()
  proc close*()
  proc available*(): jint
  proc skip*(n: jlong): jlong
  proc read*(): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint

