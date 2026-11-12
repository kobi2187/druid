import jnim

jclass android.telephony.SmsCbMessage* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getGeographicalScope*(): jint
  proc getSerialNumber*(): jint
  proc getLocation*(): android.telephony.SmsCbLocation
  proc getServiceCategory*(): jint
  proc getLanguageCode*(): string
  proc getDataCodingScheme*(): jint
  proc getMessageBody*(): string
  proc getGeometries*(): List[Geometry]
  proc getMaximumWaitingDuration*(): jint
  proc getReceivedTime*(): jlong
  proc getSlotIndex*(): jint
  proc getSubscriptionId*(): jint
  proc getMessageFormat*(): jint
  proc getMessagePriority*(): jint
  proc getEtwsWarningInfo*(): SmsCbEtwsInfo
  proc getCmasWarningInfo*(): SmsCbCmasInfo
  proc isEmergencyMessage*(): jboolean
  proc isEtwsMessage*(): jboolean
  proc isCmasMessage*(): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc getContentValues*(): ContentValues
  proc createFromCursor*(cursor: Cursor): SmsCbMessage {.`static`.}
  proc needGeoFencingCheck*(): jboolean
  LOG_TAG*: string {.`static`.}
  GEOGRAPHICAL_SCOPE_CELL_WIDE_IMMEDIATE*: jint {.`static`.}
  GEOGRAPHICAL_SCOPE_PLMN_WIDE*: jint {.`static`.}
  GEOGRAPHICAL_SCOPE_LOCATION_AREA_WIDE*: jint {.`static`.}
  GEOGRAPHICAL_SCOPE_CELL_WIDE*: jint {.`static`.}
  MESSAGE_FORMAT_3GPP*: jint {.`static`.}
  MESSAGE_FORMAT_3GPP2*: jint {.`static`.}
  MESSAGE_PRIORITY_NORMAL*: jint {.`static`.}
  MESSAGE_PRIORITY_INTERACTIVE*: jint {.`static`.}
  MESSAGE_PRIORITY_URGENT*: jint {.`static`.}
  MESSAGE_PRIORITY_EMERGENCY*: jint {.`static`.}
  MAXIMUM_WAIT_TIME_NOT_SET*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[SmsCbMessage] {.`static`.}

