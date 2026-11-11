import jnim

jclass android.telephony.DataConnectionRealTimeInfo* of JVMObject:
  proc getTime*(): jlong
  proc getDcPowerState*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  DC_POWER_STATE_LOW*: jint {.`static`.}
  DC_POWER_STATE_MEDIUM*: jint {.`static`.}
  DC_POWER_STATE_HIGH*: jint {.`static`.}
  DC_POWER_STATE_UNKNOWN*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[DataConnectionRealTimeInfo] {.`static`.}

