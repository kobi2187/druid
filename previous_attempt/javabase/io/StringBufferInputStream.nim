import jnim

jclass java.io.StringBufferInputStream* of InputStream:
  proc read*(): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint
  proc skip*(n: jlong): jlong
  proc available*(): jint
  proc reset*()

