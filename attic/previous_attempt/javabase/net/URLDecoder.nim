import jnim

jclass java.net.URLDecoder* of JVMObject:
  proc decode*(s: string): string {.`static`.}
  proc decode*(s: string, enc: string): string {.`static`.}
  proc decode*(s: string, charset: Charset): string {.`static`.}

