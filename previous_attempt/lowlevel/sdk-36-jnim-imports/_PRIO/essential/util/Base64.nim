import jnim

jclass android.util.Base64* of JVMObject:
  proc decode*(str: string, flags: jint): seq[jbyte] {.`static`.}
  proc decode*(input: seq[jbyte], flags: jint): seq[jbyte] {.`static`.}
  proc decode*(input: seq[jbyte], offset: jint, len: jint, flags: jint): seq[jbyte] {.`static`.}
  proc encodeToString*(input: seq[jbyte], flags: jint): string {.`static`.}
  proc encodeToString*(input: seq[jbyte], offset: jint, len: jint, flags: jint): string {.`static`.}
  proc encode*(input: seq[jbyte], flags: jint): seq[jbyte] {.`static`.}
  proc encode*(input: seq[jbyte], offset: jint, len: jint, flags: jint): seq[jbyte] {.`static`.}
  DEFAULT*: jint {.`static`.}
  NO_PADDING*: jint {.`static`.}
  NO_WRAP*: jint {.`static`.}
  CRLF*: jint {.`static`.}
  URL_SAFE*: jint {.`static`.}
  NO_CLOSE*: jint {.`static`.}

