import jnim

jclass java.io.ObjectInput* of DataInput:
  proc readObject*(): JObject
  proc read*(): jint
  proc read*(b: seq[jbyte]): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint
  proc skip*(n: jlong): jlong
  proc available*(): jint
  proc close*()

