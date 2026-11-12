import jnim

jclass android.telephony.CellularIdentifierDisclosure* of JVMObject:
  proc getNasProtocolMessage*(): jint
  proc getCellularIdentifier*(): jint
  proc getPlmn*(): string
  proc isEmergency*(): jboolean
  proc isBenign*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  NAS_PROTOCOL_MESSAGE_UNKNOWN*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_ATTACH_REQUEST*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_IDENTITY_RESPONSE*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_DETACH_REQUEST*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_TRACKING_AREA_UPDATE_REQUEST*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_LOCATION_UPDATE_REQUEST*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_AUTHENTICATION_AND_CIPHERING_RESPONSE*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_REGISTRATION_REQUEST*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_DEREGISTRATION_REQUEST*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_CM_REESTABLISHMENT_REQUEST*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_CM_SERVICE_REQUEST*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_IMSI_DETACH_INDICATION*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_THREAT_IDENTIFIER_FALSE*: jint {.`static`.}
  NAS_PROTOCOL_MESSAGE_THREAT_IDENTIFIER_TRUE*: jint {.`static`.}
  CELLULAR_IDENTIFIER_UNKNOWN*: jint {.`static`.}
  CELLULAR_IDENTIFIER_IMSI*: jint {.`static`.}
  CELLULAR_IDENTIFIER_IMEI*: jint {.`static`.}
  CELLULAR_IDENTIFIER_SUCI*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CellularIdentifierDisclosure] {.`static`.}

