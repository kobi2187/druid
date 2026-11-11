import jnim

jclass java.net.IDN* of JVMObject:
  proc toASCII*(input: string, flag: jint): string {.`static`.}
  proc toASCII*(input: string): string {.`static`.}
  proc toUnicode*(input: string, flag: jint): string {.`static`.}
  proc toUnicode*(input: string): string {.`static`.}
  ALLOW_UNASSIGNED*: jint {.`static`.}
  USE_STD3_ASCII_RULES*: jint {.`static`.}

