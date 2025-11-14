import jnim

jclass java.io.SequenceInputStream* of InputStream:
  proc available*(): jint
  proc read*(): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint
  proc close*()
  proc transferTo*(output:OutputStream): jlong

