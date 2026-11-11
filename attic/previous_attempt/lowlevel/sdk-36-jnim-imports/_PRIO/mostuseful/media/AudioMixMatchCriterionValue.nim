import jnim

jclass android.media.AudioMixMatchCriterionValue* of JVMObject:
  proc getTag*(): jint
  proc usage*(_value: jint): AudioMixMatchCriterionValue {.`static`.}
  proc getUsage*(): jint
  proc setUsage*(_value: jint)
  proc source*(_value: jint): AudioMixMatchCriterionValue {.`static`.}
  proc getSource*(): jint
  proc setSource*(_value: jint)
  proc uid*(_value: jint): AudioMixMatchCriterionValue {.`static`.}
  proc getUid*(): jint
  proc setUid*(_value: jint)
  proc userId*(_value: jint): AudioMixMatchCriterionValue {.`static`.}
  proc getUserId*(): jint
  proc setUserId*(_value: jint)
  proc audioSessionId*(_value: jint): AudioMixMatchCriterionValue {.`static`.}
  proc getAudioSessionId*(): jint
  proc setAudioSessionId*(_value: jint)
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  usage*: jint {.`static`.}
  source*: jint {.`static`.}
  uid*: jint {.`static`.}
  userId*: jint {.`static`.}
  audioSessionId*: jint {.`static`.}
  CREATOR*: android.os.Parcelable.Creator[AudioMixMatchCriterionValue] {.`static`.}

