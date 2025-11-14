import jnim

jclass java.net.URLEncoder* of JVMObject:
  proc encode*(s: string): string {.`static`.}
  proc encode*(s: string, enc: string): string {.`static`.}
  proc encode*(s: string, charset: Charset): string {.`static`.}

