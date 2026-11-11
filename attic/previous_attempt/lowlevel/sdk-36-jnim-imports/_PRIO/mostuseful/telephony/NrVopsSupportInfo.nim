import jnim

jclass android.telephony.NrVopsSupportInfo* of VopsSupportInfo:
  proc getVopsSupport*(): jint
  proc getEmcSupport*(): jint
  proc getEmfSupport*(): jint
  proc isVopsSupported*(): jboolean
  proc isEmergencyServiceSupported*(): jboolean
  proc isEmergencyServiceFallbackSupported*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  NR_STATUS_VOPS_NOT_SUPPORTED*: jint {.`static`.}
  NR_STATUS_VOPS_3GPP_SUPPORTED*: jint {.`static`.}
  NR_STATUS_VOPS_NON_3GPP_SUPPORTED*: jint {.`static`.}
  NR_STATUS_EMC_NOT_SUPPORTED*: jint {.`static`.}
  NR_STATUS_EMC_5GCN_ONLY*: jint {.`static`.}
  NR_STATUS_EMC_EUTRA_5GCN_ONLY*: jint {.`static`.}
  NR_STATUS_EMC_NR_EUTRA_5GCN*: jint {.`static`.}
  NR_STATUS_EMF_NOT_SUPPORTED*: jint {.`static`.}
  NR_STATUS_EMF_5GCN_ONLY*: jint {.`static`.}
  NR_STATUS_EMF_EUTRA_5GCN_ONLY*: jint {.`static`.}
  NR_STATUS_EMF_NR_EUTRA_5GCN*: jint {.`static`.}
  CREATOR*: Creator[NrVopsSupportInfo] {.`static`.}

