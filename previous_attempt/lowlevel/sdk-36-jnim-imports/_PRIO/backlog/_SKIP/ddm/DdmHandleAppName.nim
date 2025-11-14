import jnim

jclass android.ddm.DdmHandleAppName* of DdmHandle:
  proc register*() {.`static`.}
  proc onConnected*()
  proc onDisconnected*()
  proc handleChunk*(request: Chunk): Chunk
  proc setAppName*(name: string, userId: jint) {.`static`.}
  proc setAppName*(appName: string, pkgName: string, userId: jint) {.`static`.}
  proc getNames*(): Names {.`static`.}
  CHUNK_APNM*: jint {.`static`.}

