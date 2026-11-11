import jnim

jclass android.ddm.DdmHandleHeap* of DdmHandle:
  proc register*() {.`static`.}
  proc onConnected*()
  proc onDisconnected*()
  proc handleChunk*(request: Chunk): Chunk
  CHUNK_HPGC*: jint {.`static`.}

