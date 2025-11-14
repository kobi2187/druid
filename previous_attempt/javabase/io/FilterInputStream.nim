import jnim

jclass java.io.FilterInputStream* of InputStream:
  proc read*(): jint
  proc read*(b: seq[jbyte]): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint
  proc skip*(n: jlong): jlong
  proc available*(): jint
  proc close*()
  proc mark*(readlimit: jint)
  proc reset*()
  proc markSupported*(): jboolean

