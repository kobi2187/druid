import jnim

jclass android.net.VpnProfileState* of JVMObject:
  proc getState*(): jint
  proc getSessionId*(): string
  proc isAlwaysOn*(): jboolean
  proc isLockdownEnabled*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  STATE_DISCONNECTED*: jint {.`static`.}
  STATE_CONNECTING*: jint {.`static`.}
  STATE_CONNECTED*: jint {.`static`.}
  STATE_FAILED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[VpnProfileState] {.`static`.}

