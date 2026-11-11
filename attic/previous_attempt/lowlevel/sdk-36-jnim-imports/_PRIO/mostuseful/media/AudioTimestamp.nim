import jnim

jclass android.media.AudioTimestamp* of JVMObject:
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  TIMEBASE_MONOTONIC*: jint {.`static`.}
  TIMEBASE_BOOTTIME*: jint {.`static`.}
  framePosition*: jlong
  nanoTime*: jlong
  CREATOR*: Creator[AudioTimestamp] {.`static`.}

