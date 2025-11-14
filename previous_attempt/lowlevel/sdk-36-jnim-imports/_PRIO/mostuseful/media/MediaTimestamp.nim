import jnim

jclass android.media.MediaTimestamp* of JVMObject:
  proc getAnchorMediaTimeUs*(): jlong
  proc getAnchorSytemNanoTime*(): jlong
  proc getAnchorSystemNanoTime*(): jlong
  proc getMediaClockRate*(): jfloat
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  TIMESTAMP_UNKNOWN*: MediaTimestamp {.`static`.}
  mediaTimeUs*: jlong
  nanoTime*: jlong
  clockRate*: jfloat

