import jnim

jclass android.content.MimeTypeFilter* of JVMObject:
  proc matches*(mimeType: string, filter: string): jboolean {.`static`.}
  proc matches*(mimeType: string, filters: seq[string]): string {.`static`.}
  proc matches*(mimeTypes: seq[string], filter: string): string {.`static`.}
  proc matchesMany*(mimeTypes: seq[string], filter: string): seq[string] {.`static`.}

