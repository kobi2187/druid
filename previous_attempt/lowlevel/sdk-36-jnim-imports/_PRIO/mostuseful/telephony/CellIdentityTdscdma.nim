import jnim

jclass android.telephony.CellIdentityTdscdma* of CellIdentity:
  proc sanitizeLocationInfo*(): CellIdentityTdscdma
  proc getMccString*(): string
  proc getMncString*(): string
  proc getMobileNetworkOperator*(): string
  proc getLac*(): jint
  proc getCid*(): jint
  proc getCpid*(): jint
  proc getUarfcn*(): jint
  proc getChannelNumber*(): jint
  proc getAdditionalPlmns*(): Set[string]
  proc getClosedSubscriberGroupInfo*(): ClosedSubscriberGroupInfo
  proc asCellLocation*(): GsmCellLocation
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CellIdentityTdscdma] {.`static`.}

