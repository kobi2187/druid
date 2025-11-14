import jnim

jclass android.telephony.AccessNetworkUtils* of JVMObject:
  proc getDuplexModeForEutranBand*(band: jint): jint {.`static`.}
  proc getOperatingBandForEarfcn*(earfcn: jint): jint {.`static`.}
  proc getOperatingBandForNrarfcn*(nrarfcn: jint): jint {.`static`.}
  proc getOperatingBandForArfcn*(arfcn: jint): jint {.`static`.}
  proc getOperatingBandForUarfcn*(uarfcn: jint): jint {.`static`.}
  proc getFrequencyRangeGroupFromGeranBand*(band: jint): jint {.`static`.}
  proc getFrequencyRangeGroupFromUtranBand*(band: jint): jint {.`static`.}
  proc getFrequencyRangeGroupFromEutranBand*(band: jint): jint {.`static`.}
  proc getFrequencyRangeGroupFromNrBand*(band: jint): jint {.`static`.}
  proc getFrequencyFromNrArfcn*(nrArfcn: jint): jint {.`static`.}
  proc getFrequencyFromEarfcn*(band: jint, earfcn: jint, isUplink: jboolean): jint {.`static`.}
  proc getFrequencyFromUarfcn*(band: jint, uarfcn: jint, isUplink: jboolean): jint {.`static`.}
  proc getFrequencyFromArfcn*(band: jint, arfcn: jint, isUplink: jboolean): jint {.`static`.}
  proc getFrequencyRangeFromArfcn*(frequency: jint): jint {.`static`.}
  INVALID_BAND*: jint {.`static`.}
  INVALID_FREQUENCY*: jint {.`static`.}

