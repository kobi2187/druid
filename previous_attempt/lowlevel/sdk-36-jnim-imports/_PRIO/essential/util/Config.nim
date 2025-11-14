import jnim

jclass android.util.Config* of JVMObject:
  DEBUG*: jboolean {.`static`.}
  RELEASE*: jboolean {.`static`.}
  PROFILE*: jboolean {.`static`.}
  LOGV*: jboolean {.`static`.}
  LOGD*: jboolean {.`static`.}

