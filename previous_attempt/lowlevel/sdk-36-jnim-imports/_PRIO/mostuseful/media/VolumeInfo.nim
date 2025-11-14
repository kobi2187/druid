import jnim

jclass android.media.VolumeInfo* of JVMObject:
  proc hasStreamType*(): jboolean
  proc getStreamType*(): jint
  proc hasVolumeGroup*(): jboolean
  proc getVolumeGroup*(): AudioVolumeGroup
  proc hasMuteCommand*(): jboolean
  proc isMuted*(): jboolean
  proc getVolumeIndex*(): jint
  proc getMinVolumeIndex*(): jint
  proc getMaxVolumeIndex*(): jint
  proc getDefaultVolumeInfo*(): VolumeInfo {.`static`.}
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  INDEX_NOT_SET*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[VolumeInfo] {.`static`.}

jclass android.media.VolumeInfo.Builder* of JVMObject:
  proc setMuted*(isMuted: jboolean): Builder
  proc setVolumeIndex*(volIndex: jint): Builder
  proc setMinVolumeIndex*(minIndex: jint): Builder
  proc setMaxVolumeIndex*(maxIndex: jint): Builder
  proc build*(): VolumeInfo

jclass android.media.Builder* of JVMObject:
  proc setMuted*(isMuted: jboolean): Builder
  proc setVolumeIndex*(volIndex: jint): Builder
  proc setMinVolumeIndex*(minIndex: jint): Builder
  proc setMaxVolumeIndex*(maxIndex: jint): Builder
  proc build*(): VolumeInfo

