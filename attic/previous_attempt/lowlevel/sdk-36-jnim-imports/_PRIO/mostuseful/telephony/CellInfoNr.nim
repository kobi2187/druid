import jnim

jclass android.telephony.CellInfoNr* of CellInfo:
  proc getCellIdentity*(): CellIdentity
  proc setCellIdentity*(cid: CellIdentityNr)
  proc getCellSignalStrength*(): CellSignalStrength
  proc sanitizeLocationInfo*(): CellInfo
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CellInfoNr] {.`static`.}

