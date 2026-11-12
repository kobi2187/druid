import jnim

jclass android.media.AmrInputStream* of InputStream:
  proc read*(): jint
  proc read*(b: seq[jbyte]): jint
  proc read*(b: seq[jbyte], offset: jint, length: jint): jint
  proc close*()

