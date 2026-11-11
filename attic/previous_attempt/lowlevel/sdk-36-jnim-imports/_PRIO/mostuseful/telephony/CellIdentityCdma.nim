import jnim

jclass android.telephony.CellIdentityCdma* of CellIdentity:
  proc sanitizeLocationInfo*(): CellIdentityCdma
  proc getNetworkId*(): jint
  proc getSystemId*(): jint
  proc getBasestationId*(): jint
  proc getLongitude*(): jint
  proc getLatitude*(): jint
  proc hashCode*(): jint
  proc asCellLocation*(): CdmaCellLocation
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CellIdentityCdma] {.`static`.}

