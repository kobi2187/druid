import jnim

jclass java.io.ByteArrayInputStream* of InputStream:
  proc read*(): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint
  proc readAllBytes*(): seq[jbyte]
  proc readNBytes*(b: seq[jbyte], off: jint, len: jint): jint
  proc transferTo*(output:OutputStream): jlong
  proc skip*(n: jlong): jlong
  proc available*(): jint
  proc markSupported*(): jboolean
  proc mark*(readAheadLimit: jint)
  proc reset*()
  proc close*()

