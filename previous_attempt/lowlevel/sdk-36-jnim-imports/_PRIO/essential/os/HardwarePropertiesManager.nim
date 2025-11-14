import jnim

jclass android.os.HardwarePropertiesManager* of JVMObject:
  proc getDeviceTemperatures*(type: jint, source: jint): seq[jfloat]
  proc getCpuUsages*(): seq[CpuUsageInfo]
  proc getFanSpeeds*(): seq[jfloat]
  DEVICE_TEMPERATURE_CPU*: jint {.`static`.}
  DEVICE_TEMPERATURE_GPU*: jint {.`static`.}
  DEVICE_TEMPERATURE_BATTERY*: jint {.`static`.}
  DEVICE_TEMPERATURE_SKIN*: jint {.`static`.}
  TEMPERATURE_CURRENT*: jint {.`static`.}
  TEMPERATURE_THROTTLING*: jint {.`static`.}
  TEMPERATURE_SHUTDOWN*: jint {.`static`.}
  TEMPERATURE_THROTTLING_BELOW_VR_MIN*: jint {.`static`.}
  UNDEFINED_TEMPERATURE*: jfloat {.`static`.}

