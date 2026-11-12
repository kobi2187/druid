import jnim

jclass android.media.AudioMixMatchCriterion* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  invert*: jboolean
  value*: android.media.AudioMixMatchCriterionValue
  CREATOR*: android.os.Parcelable.Creator[AudioMixMatchCriterion] {.`static`.}

