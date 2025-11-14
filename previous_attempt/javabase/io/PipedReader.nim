import jnim

jclass java.io.PipedReader* of Reader:
  proc connect*(src: PipedWriter)
  proc read*(): jint
  proc read*(cbuf: seq[jchar], off: jint, len: jint): jint
  proc ready*(): jboolean
  proc close*()

