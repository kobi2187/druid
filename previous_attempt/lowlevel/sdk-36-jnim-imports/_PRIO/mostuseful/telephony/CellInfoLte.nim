import jnim

jclass android.telephony.CellInfoLte* of CellInfo:
  proc getCellIdentity*(): CellIdentityLte
  proc setCellIdentity*(cid: CellIdentityLte)
  proc getCellSignalStrength*(): CellSignalStrengthLte
  proc sanitizeLocationInfo*(): CellInfo
  proc setCellSignalStrength*(css: CellSignalStrengthLte)
  proc setCellConfig*(cellConfig: CellConfigLte)
  proc getCellConfig*(): CellConfigLte
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CellInfoLte] {.`static`.}

