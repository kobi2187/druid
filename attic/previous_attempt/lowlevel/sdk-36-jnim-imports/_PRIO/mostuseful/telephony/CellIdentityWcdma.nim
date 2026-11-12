import jnim

jclass android.telephony.CellIdentityWcdma* of CellIdentity:
  proc sanitizeLocationInfo*(): CellIdentityWcdma
  proc getMcc*(): jint
  proc getMnc*(): jint
  proc getLac*(): jint
  proc getCid*(): jint
  proc getPsc*(): jint
  proc getMccString*(): string
  proc getMncString*(): string
  proc getMobileNetworkOperator*(): string
  proc hashCode*(): jint
  proc getUarfcn*(): jint
  proc getChannelNumber*(): jint
  proc getAdditionalPlmns*(): Set[string]
  proc getClosedSubscriberGroupInfo*(): ClosedSubscriberGroupInfo
  proc asCellLocation*(): GsmCellLocation
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CellIdentityWcdma] {.`static`.}

