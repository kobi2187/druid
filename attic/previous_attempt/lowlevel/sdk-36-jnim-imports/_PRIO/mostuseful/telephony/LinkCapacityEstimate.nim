import jnim

jclass android.telephony.LinkCapacityEstimate* of JVMObject:
  proc getType*(): jint
  proc getDownlinkCapacityKbps*(): jint
  proc getUplinkCapacityKbps*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  INVALID*: jint {.`static`.}
  LCE_TYPE_PRIMARY*: jint {.`static`.}
  LCE_TYPE_SECONDARY*: jint {.`static`.}
  LCE_TYPE_COMBINED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[LinkCapacityEstimate] {.`static`.}

