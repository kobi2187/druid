import jnim

jclass android.telephony.CellSignalStrengthGsm* of CellSignalStrength:
  proc copy*(): CellSignalStrengthGsm
  proc setDefaultValues*()
  proc getLevel*(): jint
  proc updateLevel*(cc: PersistableBundle, ss: ServiceState)
  proc getTimingAdvance*(): jint
  proc getDbm*(): jint
  proc getAsuLevel*(): jint
  proc getRssi*(): jint
  proc getBitErrorRate*(): jint
  proc hashCode*(): jint
  proc isValid*(): jboolean
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[CellSignalStrengthGsm] {.`static`.}

