import jnim

jclass android.media.PlayerBase* of JVMObject:
  proc getPlayerIId*(): jint
  proc setStartDelayMs*(delayMs: jint)
  proc deprecateStreamTypeForPlayback*(streamType: jint, className: string, opName: string) {.`static`.}

jclass android.media.PlayerBase.PlayerIdCard* of JVMObject:
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean

jclass android.media.PlayerIdCard* of JVMObject:
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  mPlayerType*: jint
  AUDIO_ATTRIBUTES_NONE*: jint {.`static`.}
  AUDIO_ATTRIBUTES_DEFINED*: jint {.`static`.}
  mAttributes*: AudioAttributes
  mIPlayer*: IPlayer
  mSessionId*: jint
  CREATOR*: Parcelable.Creator[PlayerIdCard] {.`static`.}

