import jnim

jclass android.os.CoolingDevice* of JVMObject:
  proc isValidType*(type: jint): jboolean {.`static`.}
  proc getValue*(): jlong
  proc getType*(): jint
  proc getName*(): string
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc writeToParcel*(p: Parcel, flags: jint)
  proc describeContents*(): jint
  TYPE_FAN*: jint {.`static`.}
  TYPE_BATTERY*: jint {.`static`.}
  TYPE_CPU*: jint {.`static`.}
  TYPE_GPU*: jint {.`static`.}
  TYPE_MODEM*: jint {.`static`.}
  TYPE_NPU*: jint {.`static`.}
  TYPE_COMPONENT*: jint {.`static`.}
  TYPE_TPU*: jint {.`static`.}
  TYPE_POWER_AMPLIFIER*: jint {.`static`.}
  TYPE_DISPLAY*: jint {.`static`.}
  TYPE_SPEAKER*: jint {.`static`.}
  TYPE_WIFI*: jint {.`static`.}
  TYPE_CAMERA*: jint {.`static`.}
  TYPE_FLASHLIGHT*: jint {.`static`.}
  TYPE_USB_PORT*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CoolingDevice] {.`static`.}

