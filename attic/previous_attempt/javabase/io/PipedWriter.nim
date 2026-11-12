import jnim

jclass java.io.PipedWriter* of Writer:
  proc connect*(snk: PipedReader)
  proc write*(c: jint)
  proc write*(cbuf: seq[jchar], off: jint, len: jint)
  proc flush*()
  proc close*()

