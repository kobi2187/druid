import jnim

jclass android.net.SSLSessionCache* of JVMObject:
  proc install*(cache: SSLSessionCache, context: SSLContext) {.`static`.}

