import jnim

jclass android.media.MediaSyncEvent* of JVMObject:
  proc createEvent*(eventType: jint): MediaSyncEvent {.`static`.}
  proc setAudioSessionId*(audioSessionId: jint): MediaSyncEvent
  proc getType*(): jint
  proc getAudioSessionId*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc typeToString*(type: jint): string {.`static`.}
  SYNC_EVENT_NONE*: jint {.`static`.}
  SYNC_EVENT_PRESENTATION_COMPLETE*: jint {.`static`.}
  SYNC_EVENT_SHARE_AUDIO_HISTORY*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[MediaSyncEvent] {.`static`.}

