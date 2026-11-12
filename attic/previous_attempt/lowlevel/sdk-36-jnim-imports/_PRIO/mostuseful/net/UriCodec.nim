import jnim

jclass android.net.UriCodec* of JVMObject:
  proc decode*(s: string, convertPlus: jboolean, charset: Charset, throwOnFailure: jboolean): string {.`static`.}

