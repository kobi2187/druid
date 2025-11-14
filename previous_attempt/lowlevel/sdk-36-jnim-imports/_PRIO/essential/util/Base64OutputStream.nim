import jnim

jclass android.util.Base64OutputStream* of FilterOutputStream:
  proc write*(b: jint)
  proc write*(b: seq[jbyte], off: jint, len: jint)
  proc close*()

