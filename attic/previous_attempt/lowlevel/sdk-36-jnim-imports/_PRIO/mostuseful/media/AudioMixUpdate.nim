import jnim

jclass android.media.AudioMixUpdate* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  audioMix*: android.media.AudioMix
  newCriteria*: android.media.AudioMixMatchCriterion
  CREATOR*: android.os.Parcelable.Creator[AudioMixUpdate] {.`static`.}

