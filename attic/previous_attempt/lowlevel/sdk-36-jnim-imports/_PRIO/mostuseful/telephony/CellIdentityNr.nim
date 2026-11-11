import jnim

jclass android.telephony.CellIdentityNr* of CellIdentity:
  proc sanitizeLocationInfo*(): CellIdentityNr
  proc asCellLocation*(): CellLocation
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc getNci*(): jlong
  proc getNrarfcn*(): jint
  proc getBands*(): seq[jint]
  proc getPci*(): jint
  proc getTac*(): jint
  proc getMccString*(): string
  proc getMncString*(): string
  proc getChannelNumber*(): jint
  proc getAdditionalPlmns*(): Set[string]
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, type: jint)
  CREATOR*: Creator[CellIdentityNr] {.`static`.}

