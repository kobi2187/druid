import jnim

jclass android.telephony.CellInfoGsm* of CellInfo:
  proc getCellIdentity*(): CellIdentityGsm
  proc setCellIdentity*(cid: CellIdentityGsm)
  proc getCellSignalStrength*(): CellSignalStrengthGsm
  proc sanitizeLocationInfo*(): CellInfo
  proc setCellSignalStrength*(css: CellSignalStrengthGsm)
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CellInfoGsm] {.`static`.}

