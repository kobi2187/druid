import jnim

jclass android.media.PlaybackParams* of JVMObject:
  proc allowDefaults*(): PlaybackParams
  proc setAudioFallbackMode*(audioFallbackMode: jint): PlaybackParams
  proc getAudioFallbackMode*(): jint
  proc setAudioStretchMode*(audioStretchMode: jint): PlaybackParams
  proc getAudioStretchMode*(): jint
  proc setPitch*(pitch: jfloat): PlaybackParams
  proc getPitch*(): jfloat
  proc setSpeed*(speed: jfloat): PlaybackParams
  proc getSpeed*(): jfloat
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  AUDIO_FALLBACK_MODE_DEFAULT*: jint {.`static`.}
  AUDIO_FALLBACK_MODE_MUTE*: jint {.`static`.}
  AUDIO_FALLBACK_MODE_FAIL*: jint {.`static`.}
  AUDIO_STRETCH_MODE_DEFAULT*: jint {.`static`.}
  AUDIO_STRETCH_MODE_VOICE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[PlaybackParams] {.`static`.}

