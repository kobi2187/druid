import jnim

jclass android.media.AudioDeviceAttributes* of JVMObject:
  proc getRole*(): jint
  proc getType*(): jint
  proc getAddress*(): string
  proc setAddress*(address: string)
  proc getName*(): string
  proc getInternalType*(): jint
  proc getAudioProfiles*(): List[AudioProfile]
  proc getAudioDescriptors*(): List[AudioDescriptor]
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc equalTypeAddress*(o: JObject): jboolean
  proc roleToString*(role: jint): string {.`static`.}
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  ROLE_INPUT*: jint {.`static`.}
  ROLE_OUTPUT*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AudioDeviceAttributes] {.`static`.}

