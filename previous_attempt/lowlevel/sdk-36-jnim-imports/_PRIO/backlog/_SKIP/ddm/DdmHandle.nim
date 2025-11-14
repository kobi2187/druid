import jnim

jclass android.ddm.DdmHandle* of ChunkHandler:
  proc getString*(buf: ByteBuffer, len: jint): string {.`static`.}
  proc putString*(buf: ByteBuffer, str: string) {.`static`.}

