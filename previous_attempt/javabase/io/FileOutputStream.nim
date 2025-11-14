import jnim

jclass java.io.FileOutputStream* of OutputStream:
  proc write*(b: jint)
  proc write*(b: seq[jbyte])
  proc write*(b: seq[jbyte], off: jint, len: jint)
  proc close*()
  proc getFD*(): FileDescriptor
  proc getChannel*(): FileChannel

