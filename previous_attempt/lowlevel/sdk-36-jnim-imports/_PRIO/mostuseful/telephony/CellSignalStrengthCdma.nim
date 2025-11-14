import jnim

jclass android.telephony.CellSignalStrengthCdma* of CellSignalStrength:
  proc copy*(): CellSignalStrengthCdma
  proc setDefaultValues*()
  proc getLevel*(): jint
  proc updateLevel*(cc: PersistableBundle, ss: ServiceState)
  proc getAsuLevel*(): jint
  proc getCdmaLevel*(): jint
  proc getEvdoLevel*(): jint
  proc getEvdoAsuLevel*(): jint
  proc getDbm*(): jint
  proc getCdmaDbm*(): jint
  proc setCdmaDbm*(cdmaDbm: jint)
  proc getCdmaEcio*(): jint
  proc setCdmaEcio*(cdmaEcio: jint)
  proc getEvdoDbm*(): jint
  proc setEvdoDbm*(evdoDbm: jint)
  proc getEvdoEcio*(): jint
  proc setEvdoEcio*(evdoEcio: jint)
  proc getEvdoSnr*(): jint
  proc setEvdoSnr*(evdoSnr: jint)
  proc hashCode*(): jint
  proc isValid*(): jboolean
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[CellSignalStrengthCdma] {.`static`.}

