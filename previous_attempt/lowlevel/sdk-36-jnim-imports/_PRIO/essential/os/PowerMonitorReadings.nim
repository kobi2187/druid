import jnim

jclass android.os.PowerMonitorReadings* of JVMObject:
  proc getConsumedEnergy*(powerMonitor: PowerMonitor): jlong
  proc getTimestampMillis*(powerMonitor: PowerMonitor): jlong
  proc getGranularity*(): jint
  proc toString*(): string
  ENERGY_UNAVAILABLE*: jint {.`static`.}
  GRANULARITY_UNSPECIFIED*: jint {.`static`.}
  GRANULARITY_FINE*: jint {.`static`.}

