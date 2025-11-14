import jnim

jclass java.io.PushbackReader* of FilterReader:
  proc read*(): jint
  proc read*(cbuf: seq[jchar], off: jint, len: jint): jint
  proc unread*(c: jint)
  proc unread*(cbuf: seq[jchar], off: jint, len: jint)
  proc unread*(cbuf: seq[jchar])
  proc ready*(): jboolean
  proc mark*(readAheadLimit: jint)
  proc reset*()
  proc markSupported*(): jboolean
  proc close*()
  proc skip*(n: jlong): jlong

