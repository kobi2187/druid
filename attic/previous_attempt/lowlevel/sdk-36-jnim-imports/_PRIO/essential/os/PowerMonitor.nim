import jnim

jclass android.os.PowerMonitor* of JVMObject:
  proc getType*(): jint
  proc getName*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  POWER_MONITOR_TYPE_CONSUMER*: jint {.`static`.}
  POWER_MONITOR_TYPE_MEASUREMENT*: jint {.`static`.}
  index*: jint
  CREATOR*: Creator[PowerMonitor] {.`static`.}

