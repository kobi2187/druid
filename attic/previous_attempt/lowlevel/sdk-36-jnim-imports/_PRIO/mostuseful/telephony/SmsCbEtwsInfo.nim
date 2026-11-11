import jnim

jclass android.telephony.SmsCbEtwsInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getWarningType*(): jint
  proc isEmergencyUserAlert*(): jboolean
  proc isPopupAlert*(): jboolean
  proc isPrimary*(): jboolean
  proc getPrimaryNotificationTimestamp*(): jlong
  proc getPrimaryNotificationSignature*(): seq[jbyte]
  proc toString*(): string
  proc describeContents*(): jint
  ETWS_WARNING_TYPE_EARTHQUAKE*: jint {.`static`.}
  ETWS_WARNING_TYPE_TSUNAMI*: jint {.`static`.}
  ETWS_WARNING_TYPE_EARTHQUAKE_AND_TSUNAMI*: jint {.`static`.}
  ETWS_WARNING_TYPE_TEST_MESSAGE*: jint {.`static`.}
  ETWS_WARNING_TYPE_OTHER_EMERGENCY*: jint {.`static`.}
  ETWS_WARNING_TYPE_UNKNOWN*: jint {.`static`.}
  CREATOR*: Creator[SmsCbEtwsInfo] {.`static`.}

