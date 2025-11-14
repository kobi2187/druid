import jnim

jclass android.telephony.LteVopsSupportInfo* of VopsSupportInfo:
  proc getVopsSupport*(): jint
  proc getEmcBearerSupport*(): jint
  proc isVopsSupported*(): jboolean
  proc isEmergencyServiceSupported*(): jboolean
  proc isEmergencyServiceFallbackSupported*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  LTE_STATUS_NOT_AVAILABLE*: jint {.`static`.}
  LTE_STATUS_SUPPORTED*: jint {.`static`.}
  LTE_STATUS_NOT_SUPPORTED*: jint {.`static`.}
  CREATOR*: Creator[LteVopsSupportInfo] {.`static`.}

