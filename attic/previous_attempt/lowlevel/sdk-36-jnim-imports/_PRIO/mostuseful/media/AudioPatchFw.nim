import jnim

jclass android.media.AudioPatchFw* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  id*: jint
  sources*: android.media.AudioPortConfigFw
  sinks*: android.media.AudioPortConfigFw
  CREATOR*: android.os.Parcelable.Creator[AudioPatchFw] {.`static`.}

