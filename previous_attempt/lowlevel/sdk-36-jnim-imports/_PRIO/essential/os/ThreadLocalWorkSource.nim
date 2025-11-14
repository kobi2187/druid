import jnim

jclass android.os.ThreadLocalWorkSource* of JVMObject:
  proc getUid*(): jint {.`static`.}
  proc setUid*(uid: jint): jlong {.`static`.}
  proc restore*(token: jlong) {.`static`.}
  proc clear*(): jlong {.`static`.}
  UID_NONE*: jint {.`static`.}

