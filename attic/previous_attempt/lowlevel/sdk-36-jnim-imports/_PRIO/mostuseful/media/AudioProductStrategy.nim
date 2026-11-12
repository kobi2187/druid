import jnim

jclass android.media.AudioProductStrategy* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  id*: jint
  name*: string
  audioAttributes*: android.media.AudioAttributesEx
  CREATOR*: android.os.Parcelable.Creator[AudioProductStrategy] {.`static`.}

