import jnim

jclass android.hardware.BatteryState* of JVMObject:
  proc isPresent*(): jboolean
  proc getStatus*(): jint
  proc getCapacity*(): jfloat
  STATUS_UNKNOWN*: jint {.`static`.}
  STATUS_CHARGING*: jint {.`static`.}
  STATUS_DISCHARGING*: jint {.`static`.}
  STATUS_NOT_CHARGING*: jint {.`static`.}
  STATUS_FULL*: jint {.`static`.}

