import jnim

jclass android.telephony.CellIdentityGsm* of CellIdentity:
  proc sanitizeLocationInfo*(): CellIdentityGsm
  proc getMcc*(): jint
  proc getMnc*(): jint
  proc getLac*(): jint
  proc getCid*(): jint
  proc getArfcn*(): jint
  proc getBsic*(): jint
  proc getMobileNetworkOperator*(): string
  proc getMccString*(): string
  proc getMncString*(): string
  proc getChannelNumber*(): jint
  proc getAdditionalPlmns*(): Set[string]
  proc getPsc*(): jint
  proc asCellLocation*(): GsmCellLocation
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CellIdentityGsm] {.`static`.}

