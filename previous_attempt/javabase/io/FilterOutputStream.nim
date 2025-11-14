import jnim

jclass java.io.FilterOutputStream* of OutputStream:
  proc write*(b: jint)
  proc write*(b: seq[jbyte])
  proc write*(b: seq[jbyte], off: jint, len: jint)
  proc flush*()
  proc close*()

