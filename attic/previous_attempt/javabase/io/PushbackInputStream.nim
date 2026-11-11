import jnim

jclass java.io.PushbackInputStream* of FilterInputStream:
  proc read*(): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint
  proc unread*(b: jint)
  proc unread*(b: seq[jbyte], off: jint, len: jint)
  proc unread*(b: seq[jbyte])
  proc available*(): jint
  proc skip*(n: jlong): jlong
  proc markSupported*(): jboolean
  proc mark*(readlimit: jint)
  proc reset*()
  proc close*()
  proc transferTo*(output:OutputStream): jlong

