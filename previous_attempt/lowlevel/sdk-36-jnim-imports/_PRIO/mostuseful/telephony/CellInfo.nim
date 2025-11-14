import jnim

jclass android.telephony.CellInfo* of JVMObject:
  proc isRegistered*(): jboolean
  proc setRegistered*(registered: jboolean)
  proc getTimestampMillis*(): jlong
  proc getTimeStamp*(): jlong
  proc setTimeStamp*(ts: jlong)
  proc getCellIdentity*(): CellIdentity
  proc getCellSignalStrength*(): CellSignalStrength
  proc sanitizeLocationInfo*(): CellInfo
  proc getCellConnectionStatus*(): jint
  proc setCellConnectionStatus*(cellConnectionStatus: jint)
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  UNAVAILABLE*: jint {.`static`.}
  UNAVAILABLE_LONG*: jlong {.`static`.}
  TYPE_UNKNOWN*: jint {.`static`.}
  TYPE_GSM*: jint {.`static`.}
  TYPE_CDMA*: jint {.`static`.}
  TYPE_LTE*: jint {.`static`.}
  TYPE_WCDMA*: jint {.`static`.}
  TYPE_TDSCDMA*: jint {.`static`.}
  TYPE_NR*: jint {.`static`.}
  TIMESTAMP_TYPE_UNKNOWN*: jint {.`static`.}
  TIMESTAMP_TYPE_ANTENNA*: jint {.`static`.}
  TIMESTAMP_TYPE_MODEM*: jint {.`static`.}
  TIMESTAMP_TYPE_OEM_RIL*: jint {.`static`.}
  TIMESTAMP_TYPE_JAVA_RIL*: jint {.`static`.}
  CONNECTION_NONE*: jint {.`static`.}
  CONNECTION_PRIMARY_SERVING*: jint {.`static`.}
  CONNECTION_SECONDARY_SERVING*: jint {.`static`.}
  CONNECTION_UNKNOWN*: jint {.`static`.}
  CREATOR*: Creator[CellInfo] {.`static`.}

