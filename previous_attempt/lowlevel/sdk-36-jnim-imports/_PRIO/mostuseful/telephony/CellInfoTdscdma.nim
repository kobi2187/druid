import jnim

jclass android.telephony.CellInfoTdscdma* of CellInfo:
  proc getCellIdentity*(): CellIdentityTdscdma
  proc setCellIdentity*(cid: CellIdentityTdscdma)
  proc getCellSignalStrength*(): CellSignalStrengthTdscdma
  proc sanitizeLocationInfo*(): CellInfo
  proc setCellSignalStrength*(css: CellSignalStrengthTdscdma)
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CellInfoTdscdma] {.`static`.}

