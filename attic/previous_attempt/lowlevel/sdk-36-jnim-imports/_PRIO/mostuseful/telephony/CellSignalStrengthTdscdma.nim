import jnim

jclass android.telephony.CellSignalStrengthTdscdma* of CellSignalStrength:
  proc copy*(): CellSignalStrengthTdscdma
  proc setDefaultValues*()
  proc getLevel*(): jint
  proc updateLevel*(cc: PersistableBundle, ss: ServiceState)
  proc getDbm*(): jint
  proc getRscp*(): jint
  proc getRssi*(): jint
  proc getBitErrorRate*(): jint
  proc getAsuLevel*(): jint
  proc hashCode*(): jint
  proc isValid*(): jboolean
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[CellSignalStrengthTdscdma] {.`static`.}

