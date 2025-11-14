import jnim

jclass android.media.AudioClient* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  clientTid*: jint
  attributionSource*: android.content.AttributionSourceState
  CREATOR*: android.os.Parcelable.Creator[AudioClient] {.`static`.}

