import jnim

jclass java.io.OutputStream* of JVMObject:
  proc nullOutputStream*(): OutputStream {.`static`.}
  proc write*(b: jint)
  proc write*(b: seq[jbyte])
  proc write*(b: seq[jbyte], off: jint, len: jint)
  proc flush*()
  proc close*()

