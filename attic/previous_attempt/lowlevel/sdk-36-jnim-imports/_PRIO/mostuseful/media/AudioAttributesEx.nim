import jnim

jclass android.media.AudioAttributesEx* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  attributes*: android.media.audio.common.AudioAttributes
  streamType*: jint
  groupId*: jint
  CREATOR*: android.os.Parcelable.Creator[AudioAttributesEx] {.`static`.}

