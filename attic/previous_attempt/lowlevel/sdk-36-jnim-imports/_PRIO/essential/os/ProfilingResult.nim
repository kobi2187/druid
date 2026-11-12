import jnim

jclass android.os.ProfilingResult* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc getErrorCode*(): jint
  proc getResultFilePath*(): string
  proc getTag*(): string
  proc getErrorMessage*(): string
  proc getTriggerType*(): jint
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  ERROR_NONE*: jint {.`static`.}
  ERROR_FAILED_RATE_LIMIT_SYSTEM*: jint {.`static`.}
  ERROR_FAILED_RATE_LIMIT_PROCESS*: jint {.`static`.}
  ERROR_FAILED_PROFILING_IN_PROGRESS*: jint {.`static`.}
  ERROR_FAILED_EXECUTING*: jint {.`static`.}
  ERROR_FAILED_POST_PROCESSING*: jint {.`static`.}
  ERROR_FAILED_NO_DISK_SPACE*: jint {.`static`.}
  ERROR_FAILED_INVALID_REQUEST*: jint {.`static`.}
  ERROR_UNKNOWN*: jint {.`static`.}
  CREATOR*: Creator[ProfilingResult] {.`static`.}

