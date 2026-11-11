import jnim

jclass android.media.MediaTimeProvider* of JVMObject:
  proc notifyAt*(timeUs: jlong, listener: OnMediaTimeListener)
  proc scheduleUpdate*(listener: OnMediaTimeListener)
  proc cancelNotifications*(listener: OnMediaTimeListener)
  proc getCurrentTimeUs*(precise: jboolean, monotonic: jboolean): jlong
  NO_TIME*: jlong {.`static`.}

