import jnim

jclass java.io.LineNumberReader* of BufferedReader:
  proc setLineNumber*(lineNumber: jint)
  proc getLineNumber*(): jint
  proc read*(): jint
  proc read*(cbuf: seq[jchar], off: jint, len: jint): jint
  proc readLine*(): string
  proc skip*(n: jlong): jlong
  proc mark*(readAheadLimit: jint)
  proc reset*()

