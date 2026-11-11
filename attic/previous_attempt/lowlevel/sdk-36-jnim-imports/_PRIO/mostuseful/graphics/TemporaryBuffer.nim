import jnim

jclass android.graphics.TemporaryBuffer* of JVMObject:
  proc obtain*(len: jint): seq[jchar] {.`static`.}
  proc recycle*(temp: seq[jchar]) {.`static`.}

