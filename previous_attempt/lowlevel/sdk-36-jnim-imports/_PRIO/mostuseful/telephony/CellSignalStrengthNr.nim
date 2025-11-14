import jnim

jclass android.telephony.CellSignalStrengthNr* of CellSignalStrength:
  proc flip*(val: jint): jint {.`static`.}
  proc getSsRsrp*(): jint
  proc getSsRsrq*(): jint
  proc getSsSinr*(): jint
  proc getCsiRsrp*(): jint
  proc getCsiRsrq*(): jint
  proc getCsiSinr*(): jint
  proc getCsiCqiTableIndex*(): jint
  proc getCsiCqiReport*(): List[Integer]
  proc getTimingAdvanceMicros*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc setDefaultValues*()
  proc getLevel*(): jint
  proc updateLevel*(cc: PersistableBundle, ss: ServiceState)
  proc getAsuLevel*(): jint
  proc getDbm*(): jint
  proc copy*(): CellSignalStrengthNr
  proc hashCode*(): jint
  proc isValid*(): jboolean
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  UNKNOWN_ASU_LEVEL*: jint {.`static`.}
  USE_SSRSRP*: jint {.`static`.}
  USE_SSRSRQ*: jint {.`static`.}
  USE_SSSINR*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CellSignalStrengthNr] {.`static`.}

