import jnim

jclass java.io.ObjectOutput* of DataOutput:
  proc writeObject*(obj: JObject)
  proc write*(b: jint)
  proc write*(b: seq[jbyte])
  proc write*(b: seq[jbyte], off: jint, len: jint)
  proc flush*()
  proc close*()

