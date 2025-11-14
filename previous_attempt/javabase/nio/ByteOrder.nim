import jnim

jclass java.nio.ByteOrder* of JVMObject:
  proc nativeOrder*(): ByteOrder {.`static`.}
  proc toString*(): string
  BIG_ENDIAN*: ByteOrder {.`static`.}
  LITTLE_ENDIAN*: ByteOrder {.`static`.}

