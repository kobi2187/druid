import jnim

jclass android.telephony.CellInfoWcdma* of CellInfo:
  proc getCellIdentity*(): CellIdentityWcdma
  proc setCellIdentity*(cid: CellIdentityWcdma)
  proc getCellSignalStrength*(): CellSignalStrengthWcdma
  proc sanitizeLocationInfo*(): CellInfo
  proc setCellSignalStrength*(css: CellSignalStrengthWcdma)
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CellInfoWcdma] {.`static`.}

