import jnim

jclass android.content.UriMatcher* of JVMObject:
  proc addURI*(authority: string, path: string, code: jint)
  proc match*(uri: Uri): jint
  NO_MATCH*: jint {.`static`.}

