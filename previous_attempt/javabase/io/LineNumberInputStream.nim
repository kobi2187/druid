import jnim

jclass java.io.LineNumberInputStream* of FilterInputStream:
  proc read*(): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint
  proc skip*(n: jlong): jlong
  proc setLineNumber*(lineNumber: jint)
  proc getLineNumber*(): jint
  proc available*(): jint
  proc mark*(readlimit: jint)
  proc reset*()

