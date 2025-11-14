import jnim

jclass java.io.Reader* of JVMObject:
  proc nullReader*(): Reader {.`static`.}
  proc of*(cs: CharSequence): Reader {.`static`.}
  proc read*(target: CharBuffer): jint
  proc read*(): jint
  proc read*(cbuf: seq[jchar]): jint
  proc read*(cbuf: seq[jchar], off: jint, len: jint): jint
  proc skip*(n: jlong): jlong
  proc ready*(): jboolean
  proc markSupported*(): jboolean
  proc mark*(readAheadLimit: jint)
  proc reset*()
  proc close*()
  proc transferTo*(output:Writer): jlong

