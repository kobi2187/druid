import jnim

jclass java.io.FilterReader* of Reader:
  proc read*(): jint
  proc read*(cbuf: seq[jchar], off: jint, len: jint): jint
  proc skip*(n: jlong): jlong
  proc ready*(): jboolean
  proc markSupported*(): jboolean
  proc mark*(readAheadLimit: jint)
  proc reset*()
  proc close*()

