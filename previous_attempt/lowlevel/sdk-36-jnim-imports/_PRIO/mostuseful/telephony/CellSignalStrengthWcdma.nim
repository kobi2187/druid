import jnim

jclass android.telephony.CellSignalStrengthWcdma* of CellSignalStrength:
  proc copy*(): CellSignalStrengthWcdma
  proc setDefaultValues*()
  proc getLevel*(): jint
  proc updateLevel*(cc: PersistableBundle, ss: ServiceState)
  proc getDbm*(): jint
  proc getAsuLevel*(): jint
  proc getRssi*(): jint
  proc getRscp*(): jint
  proc getEcNo*(): jint
  proc getBitErrorRate*(): jint
  proc hashCode*(): jint
  proc isValid*(): jboolean
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  LEVEL_CALCULATION_METHOD_RSSI*: string {.`static`.}
  LEVEL_CALCULATION_METHOD_RSCP*: string {.`static`.}
  CREATOR*: Parcelable.Creator[CellSignalStrengthWcdma] {.`static`.}

