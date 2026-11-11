import jnim

jclass android.media.AudioRoutesInfo* of JVMObject:
  proc describeContents*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  MAIN_SPEAKER*: jint {.`static`.}
  MAIN_HEADSET*: jint {.`static`.}
  MAIN_HEADPHONES*: jint {.`static`.}
  MAIN_DOCK_SPEAKERS*: jint {.`static`.}
  MAIN_HDMI*: jint {.`static`.}
  MAIN_USB*: jint {.`static`.}
  bluetoothName*: CharSequence
  mainType*: jint
  CREATOR*: Parcelable.Creator[AudioRoutesInfo] {.`static`.}

