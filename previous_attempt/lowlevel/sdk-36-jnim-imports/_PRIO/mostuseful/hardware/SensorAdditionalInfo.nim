import jnim

jclass android.hardware.SensorAdditionalInfo* of JVMObject:
  proc createLocalGeomagneticField*(strength: jfloat, declination: jfloat, inclination: jfloat): SensorAdditionalInfo {.`static`.}
  proc createCustomInfo*(aSensor: Sensor, type: jint, data: seq[jfloat]): SensorAdditionalInfo {.`static`.}
  sensor*: Sensor
  typ*: jint
  serial*: jint
  floatValues*: jfloat
  intValues*: jint
  TYPE_FRAME_BEGIN*: jint {.`static`.}
  TYPE_FRAME_END*: jint {.`static`.}
  TYPE_UNTRACKED_DELAY*: jint {.`static`.}
  TYPE_INTERNAL_TEMPERATURE*: jint {.`static`.}
  TYPE_VEC3_CALIBRATION*: jint {.`static`.}
  TYPE_SENSOR_PLACEMENT*: jint {.`static`.}
  TYPE_SAMPLING*: jint {.`static`.}
  TYPE_LOCAL_GEOMAGNETIC_FIELD*: jint {.`static`.}
  TYPE_LOCAL_GRAVITY*: jint {.`static`.}
  TYPE_DOCK_STATE*: jint {.`static`.}
  TYPE_HIGH_PERFORMANCE_MODE*: jint {.`static`.}
  TYPE_MAGNETIC_FIELD_CALIBRATION*: jint {.`static`.}
  TYPE_CUSTOM_INFO*: jint {.`static`.}
  TYPE_DEBUG_INFO*: jint {.`static`.}

