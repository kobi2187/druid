import jnim

jclass android.telephony.CellSignalStrengthLte* of CellSignalStrength:
  proc copy*(): CellSignalStrengthLte
  proc setDefaultValues*()
  proc getLevel*(): jint
  proc updateLevel*(cc: PersistableBundle, ss: ServiceState)
  proc getRsrq*(): jint
  proc getRssi*(): jint
  proc getRssnr*(): jint
  proc getRsrp*(): jint
  proc getCqiTableIndex*(): jint
  proc getCqi*(): jint
  proc getDbm*(): jint
  proc getAsuLevel*(): jint
  proc getTimingAdvance*(): jint
  proc hashCode*(): jint
  proc isValid*(): jboolean
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc convertRssnrUnitFromTenDbToDB*(rssnr: jint): jint {.`static`.}
  proc convertRssiAsuToDBm*(rssiAsu: jint): jint {.`static`.}
  USE_RSRP*: jint {.`static`.}
  USE_RSRQ*: jint {.`static`.}
  USE_RSSNR*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CellSignalStrengthLte] {.`static`.}

