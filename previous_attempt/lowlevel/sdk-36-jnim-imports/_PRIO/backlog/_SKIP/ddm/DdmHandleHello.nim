import jnim

jclass android.ddm.DdmHandleHello* of DdmHandle:
  proc register*() {.`static`.}
  proc onConnected*()
  proc onDisconnected*()
  proc handleChunk*(request: Chunk): Chunk
  proc sendWAIT*(reason: jint) {.`static`.}
  CHUNK_HELO*: jint {.`static`.}
  CHUNK_WAIT*: jint {.`static`.}
  CHUNK_FEAT*: jint {.`static`.}

