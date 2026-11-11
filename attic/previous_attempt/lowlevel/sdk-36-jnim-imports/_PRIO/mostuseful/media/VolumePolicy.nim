import jnim

jclass android.media.VolumePolicy* of JVMObject:
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  DEFAULT*: VolumePolicy {.`static`.}
  A11Y_MODE_MEDIA_A11Y_VOLUME*: jint {.`static`.}
  A11Y_MODE_INDEPENDENT_A11Y_VOLUME*: jint {.`static`.}
  volumeDownToEnterSilent*: jboolean
  volumeUpToExitSilent*: jboolean
  doNotDisturbWhenSilent*: jboolean
  vibrateToSilentDebounce*: jint
  CREATOR*: Parcelable.Creator[VolumePolicy] {.`static`.}

