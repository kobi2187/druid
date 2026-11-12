import jnim

jclass android.telephony.CellInfoCdma* of CellInfo:
  proc getCellIdentity*(): CellIdentityCdma
  proc setCellIdentity*(cid: CellIdentityCdma)
  proc getCellSignalStrength*(): CellSignalStrengthCdma
  proc sanitizeLocationInfo*(): CellInfo
  proc setCellSignalStrength*(css: CellSignalStrengthCdma)
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CellInfoCdma] {.`static`.}

