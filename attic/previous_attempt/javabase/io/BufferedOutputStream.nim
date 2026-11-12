import jnim

jclass java.io.BufferedOutputStream* of FilterOutputStream:
  proc write*(b: jint)
  proc write*(b: seq[jbyte], off: jint, len: jint)
  proc flush*()

