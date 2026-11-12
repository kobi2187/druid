import jnim

jclass android.telephony.CellSignalStrength* of JVMObject:
  proc setDefaultValues*()
  proc getLevel*(): jint
  proc getAsuLevel*(): jint
  proc getDbm*(): jint
  proc copy*(): CellSignalStrength
  proc isValid*(): jboolean
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc updateLevel*(cc: PersistableBundle, ss: ServiceState)
  proc getRssiDbmFromAsu*(asu: jint): jint {.`static`.}
  proc getRscpDbmFromAsu*(asu: jint): jint {.`static`.}
  proc getEcNoDbFromAsu*(asu: jint): jint {.`static`.}
  proc getNumSignalStrengthLevels*(): jint {.`static`.}
  SIGNAL_STRENGTH_NONE_OR_UNKNOWN*: jint {.`static`.}
  SIGNAL_STRENGTH_POOR*: jint {.`static`.}
  SIGNAL_STRENGTH_MODERATE*: jint {.`static`.}
  SIGNAL_STRENGTH_GOOD*: jint {.`static`.}
  SIGNAL_STRENGTH_GREAT*: jint {.`static`.}
  NUM_SIGNAL_STRENGTH_BINS*: jint {.`static`.}

