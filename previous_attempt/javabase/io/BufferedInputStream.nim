import jnim

jclass java.io.BufferedInputStream* of FilterInputStream:
  proc read*(): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint
  proc skip*(n: jlong): jlong
  proc available*(): jint
  proc mark*(readlimit: jint)
  proc reset*()
  proc markSupported*(): jboolean
  proc close*()
  proc transferTo*(output:OutputStream): jlong

