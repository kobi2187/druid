import jnim

jclass android.telephony.TelephonyDisplayInfo* of JVMObject:
  proc getNetworkType*(): jint
  proc getOverrideNetworkType*(): jint
  proc isRoaming*(): jboolean
  proc isSatelliteConstrainedData*(): jboolean
  proc isNtn*(): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc overrideNetworkTypeToString*(type: jint): string {.`static`.}
  proc toString*(): string
  OVERRIDE_NETWORK_TYPE_NONE*: jint {.`static`.}
  OVERRIDE_NETWORK_TYPE_LTE_CA*: jint {.`static`.}
  OVERRIDE_NETWORK_TYPE_LTE_ADVANCED_PRO*: jint {.`static`.}
  OVERRIDE_NETWORK_TYPE_NR_NSA*: jint {.`static`.}
  OVERRIDE_NETWORK_TYPE_NR_NSA_MMWAVE*: jint {.`static`.}
  OVERRIDE_NETWORK_TYPE_NR_ADVANCED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[TelephonyDisplayInfo] {.`static`.}

