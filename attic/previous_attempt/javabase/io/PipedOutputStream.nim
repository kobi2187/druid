import jnim

jclass java.io.PipedOutputStream* of OutputStream:
  proc connect*(snk: PipedInputStream)
  proc write*(b: jint)
  proc write*(b: seq[jbyte], off: jint, len: jint)
  proc flush*()
  proc close*()

