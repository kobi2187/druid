import jnim

jclass android.hardware.SensorDirectChannel* of JVMObject:
  proc isOpen*(): jboolean
  proc isValid*(): jboolean
  proc close*()
  proc configure*(sensor: Sensor, rateLevel: jint): jint
  TYPE_MEMORY_FILE*: jint {.`static`.}
  TYPE_HARDWARE_BUFFER*: jint {.`static`.}
  RATE_STOP*: jint {.`static`.}
  RATE_NORMAL*: jint {.`static`.}
  RATE_FAST*: jint {.`static`.}
  RATE_VERY_FAST*: jint {.`static`.}

