import jnim

jclass android.telephony.CellIdentityLte* of CellIdentity:
  proc sanitizeLocationInfo*(): CellIdentityLte
  proc getMcc*(): jint
  proc getMnc*(): jint
  proc getCi*(): jint
  proc getPci*(): jint
  proc getTac*(): jint
  proc getEarfcn*(): jint
  proc getBands*(): seq[jint]
  proc getBandwidth*(): jint
  proc getMccString*(): string
  proc getMncString*(): string
  proc getMobileNetworkOperator*(): string
  proc getChannelNumber*(): jint
  proc getAdditionalPlmns*(): Set[string]
  proc getClosedSubscriberGroupInfo*(): ClosedSubscriberGroupInfo
  proc asCellLocation*(): GsmCellLocation
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CellIdentityLte] {.`static`.}

