import jnim

jclass java.io.InputStream* of JVMObject:
  proc nullInputStream*(): InputStream {.`static`.}
  proc read*(): jint
  proc read*(b: seq[jbyte]): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint
  proc readAllBytes*(): seq[jbyte]
  proc readNBytes*(len: jint): seq[jbyte]
  proc readNBytes*(b: seq[jbyte], off: jint, len: jint): jint
  proc skip*(n: jlong): jlong
  proc skipNBytes*(n: jlong)
  proc available*(): jint
  proc close*()
  proc mark*(readlimit: jint)
  proc reset*()
  proc markSupported*(): jboolean
  proc transferTo*(output:OutputStream): jlong

