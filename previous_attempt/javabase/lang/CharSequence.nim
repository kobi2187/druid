import jnim

jclass java.lang.CharSequence* of JVMObject:
  proc toString*(): string
  proc chars*(): IntStream
  proc codePoints*(): IntStream
  proc compare*(cs1: CharSequence, cs2: CharSequence): jint {.`static`.}
  proc getChars*(srcBegin: jint, srcEnd: jint, dst: seq[jchar], dstBegin: jint)

