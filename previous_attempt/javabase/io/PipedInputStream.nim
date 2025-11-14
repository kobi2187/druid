import jnim

jclass java.io.PipedInputStream* of InputStream:
  proc connect*(src: PipedOutputStream)
  proc read*(): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint
  proc available*(): jint
  proc close*()

