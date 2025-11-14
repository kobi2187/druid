import jnim

jclass android.media.MediaHTTPConnection* of Stub:
  proc connect*(uri: string, headers: string): IBinder
  proc disconnect*()
  proc readAt*(offset: jlong, size: jint): jint
  proc getSize*(): jlong
  proc getMIMEType*(): string
  proc getUri*(): string

