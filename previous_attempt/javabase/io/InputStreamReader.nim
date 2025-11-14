import jnim

jclass java.io.InputStreamReader* of Reader:
  proc getEncoding*(): string
  proc read*(target: CharBuffer): jint
  proc read*(): jint
  proc read*(cbuf: seq[jchar], off: jint, len: jint): jint
  proc ready*(): jboolean
  proc close*()

