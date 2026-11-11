import jnim

jclass android.telephony.SignalStrength* of JVMObject:
  proc getCellSignalStrengths*(): List[CellSignalStrength]
  proc getCellSignalStrengths*(clazz: Class[T]): List[T]
  proc updateLevel*(cc: PersistableBundle, ss: ServiceState)
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getTimestampMillis*(): jlong
  proc describeContents*(): jint
  proc getGsmSignalStrength*(): jint
  proc getGsmBitErrorRate*(): jint
  proc getCdmaDbm*(): jint
  proc getCdmaEcio*(): jint
  proc getEvdoDbm*(): jint
  proc getEvdoEcio*(): jint
  proc getEvdoSnr*(): jint
  proc getLteSignalStrength*(): jint
  proc getLteRsrp*(): jint
  proc getLteRsrq*(): jint
  proc getLteRssnr*(): jint
  proc getLteCqi*(): jint
  proc getLevel*(): jint
  proc getAsuLevel*(): jint
  proc getDbm*(): jint
  proc getGsmDbm*(): jint
  proc getGsmLevel*(): jint
  proc getGsmAsuLevel*(): jint
  proc getCdmaLevel*(): jint
  proc getCdmaAsuLevel*(): jint
  proc getEvdoLevel*(): jint
  proc getEvdoAsuLevel*(): jint
  proc getLteDbm*(): jint
  proc getLteLevel*(): jint
  proc getLteAsuLevel*(): jint
  proc isGsm*(): jboolean
  proc getTdScdmaDbm*(): jint
  proc getTdScdmaLevel*(): jint
  proc getTdScdmaAsuLevel*(): jint
  proc getWcdmaRscp*(): jint
  proc getWcdmaAsuLevel*(): jint
  proc getWcdmaDbm*(): jint
  proc getWcdmaLevel*(): jint
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc fillInNotifierBundle*(m: Bundle)
  SIGNAL_STRENGTH_NONE_OR_UNKNOWN*: jint {.`static`.}
  SIGNAL_STRENGTH_POOR*: jint {.`static`.}
  SIGNAL_STRENGTH_MODERATE*: jint {.`static`.}
  SIGNAL_STRENGTH_GOOD*: jint {.`static`.}
  SIGNAL_STRENGTH_GREAT*: jint {.`static`.}
  NUM_SIGNAL_STRENGTH_BINS*: jint {.`static`.}
  INVALID*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[SignalStrength] {.`static`.}

