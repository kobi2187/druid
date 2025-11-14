import jnim

jclass android.os.Temperature* of JVMObject:
  proc isValidType*(type: jint): jboolean {.`static`.}
  proc isValidStatus*(status: jint): jboolean {.`static`.}
  proc getValue*(): jfloat
  proc getType*(): jint
  proc getName*(): string
  proc getStatus*(): jint
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc writeToParcel*(p: Parcel, flags: jint)
  proc describeContents*(): jint
  THROTTLING_NONE*: jint {.`static`.}
  THROTTLING_LIGHT*: jint {.`static`.}
  THROTTLING_MODERATE*: jint {.`static`.}
  THROTTLING_SEVERE*: jint {.`static`.}
  THROTTLING_CRITICAL*: jint {.`static`.}
  THROTTLING_EMERGENCY*: jint {.`static`.}
  THROTTLING_SHUTDOWN*: jint {.`static`.}
  TYPE_UNKNOWN*: jint {.`static`.}
  TYPE_CPU*: jint {.`static`.}
  TYPE_GPU*: jint {.`static`.}
  TYPE_BATTERY*: jint {.`static`.}
  TYPE_SKIN*: jint {.`static`.}
  TYPE_USB_PORT*: jint {.`static`.}
  TYPE_POWER_AMPLIFIER*: jint {.`static`.}
  TYPE_BCL_VOLTAGE*: jint {.`static`.}
  TYPE_BCL_CURRENT*: jint {.`static`.}
  TYPE_BCL_PERCENTAGE*: jint {.`static`.}
  TYPE_NPU*: jint {.`static`.}
  TYPE_TPU*: jint {.`static`.}
  TYPE_DISPLAY*: jint {.`static`.}
  TYPE_MODEM*: jint {.`static`.}
  TYPE_SOC*: jint {.`static`.}
  TYPE_WIFI*: jint {.`static`.}
  TYPE_CAMERA*: jint {.`static`.}
  TYPE_FLASHLIGHT*: jint {.`static`.}
  TYPE_SPEAKER*: jint {.`static`.}
  TYPE_AMBIENT*: jint {.`static`.}
  TYPE_POGO*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[Temperature] {.`static`.}

