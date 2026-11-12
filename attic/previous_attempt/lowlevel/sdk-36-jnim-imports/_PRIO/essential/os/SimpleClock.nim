import jnim

jclass android.os.SimpleClock* of Clock:
  proc getZone*(): ZoneId
  proc withZone*(zone: ZoneId): Clock
  proc millis*(): jlong
  proc instant*(): Instant

