import jnim

jclass android.net.QosSession* of JVMObject:
  proc getUniqueId*(): jlong
  proc getSessionId*(): jint
  proc getSessionType*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  TYPE_EPS_BEARER*: jint {.`static`.}
  TYPE_NR_BEARER*: jint {.`static`.}
  CREATOR*: Creator[QosSession] {.`static`.}

