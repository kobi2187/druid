import jnim

jclass android.media.Session2Command* of JVMObject:
  proc getCommandCode*(): jint
  proc getCustomAction*(): string
  proc getCustomExtras*(): Bundle
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  COMMAND_CODE_CUSTOM*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[Session2Command] {.`static`.}

jclass android.media.Session2Command.Result* of JVMObject:
  proc getResultCode*(): jint
  proc getResultData*(): Bundle

jclass android.media.Result* of JVMObject:
  proc getResultCode*(): jint
  proc getResultData*(): Bundle
  RESULT_INFO_SKIPPED*: jint {.`static`.}
  RESULT_SUCCESS*: jint {.`static`.}
  RESULT_ERROR_UNKNOWN_ERROR*: jint {.`static`.}

