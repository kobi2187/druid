import jnim

jclass android.ddm.DdmHandleExit* of DdmHandle:
  proc register*() {.`static`.}
  proc onConnected*()
  proc onDisconnected*()
  proc handleChunk*(request: Chunk): Chunk
  CHUNK_EXIT*: jint {.`static`.}

