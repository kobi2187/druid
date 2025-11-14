import jnim

jclass android.ddm.DdmHandleProfiling* of DdmHandle:
  proc register*() {.`static`.}
  proc onConnected*()
  proc onDisconnected*()
  proc handleChunk*(request: Chunk): Chunk
  CHUNK_MPRS*: jint {.`static`.}
  CHUNK_MPRE*: jint {.`static`.}
  CHUNK_MPSS*: jint {.`static`.}
  CHUNK_MPSE*: jint {.`static`.}
  CHUNK_MPRQ*: jint {.`static`.}
  CHUNK_SPSS*: jint {.`static`.}
  CHUNK_SPSE*: jint {.`static`.}

