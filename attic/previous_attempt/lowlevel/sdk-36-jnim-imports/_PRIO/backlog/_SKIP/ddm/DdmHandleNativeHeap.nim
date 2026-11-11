import jnim

jclass android.ddm.DdmHandleNativeHeap* of DdmHandle:
  proc register*() {.`static`.}
  proc onConnected*()
  proc onDisconnected*()
  proc handleChunk*(request: Chunk): Chunk
  CHUNK_NHGT*: jint {.`static`.}

