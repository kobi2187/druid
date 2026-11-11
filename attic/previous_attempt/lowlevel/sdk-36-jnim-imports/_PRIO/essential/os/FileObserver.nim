import jnim

jclass android.os.FileObserver* of JVMObject:
  proc startWatching*()
  proc stopWatching*()
  proc onEvent*(event: jint, path: string)
  ACCESS*: jint {.`static`.}
  MODIFY*: jint {.`static`.}
  ATTRIB*: jint {.`static`.}
  CLOSE_WRITE*: jint {.`static`.}
  CLOSE_NOWRITE*: jint {.`static`.}
  OPEN*: jint {.`static`.}
  MOVED_FROM*: jint {.`static`.}
  MOVED_TO*: jint {.`static`.}
  CREATE*: jint {.`static`.}
  DELETE*: jint {.`static`.}
  DELETE_SELF*: jint {.`static`.}
  MOVE_SELF*: jint {.`static`.}
  ALL_EVENTS*: jint {.`static`.}

