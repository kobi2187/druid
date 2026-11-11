import jnim

jclass android.media.AudioAttributes* of JVMObject:
  proc getSdkUsages*(): seq[jint] {.`static`.}
  proc getContentType*(): jint
  proc getUsage*(): jint
  proc getSystemUsage*(): jint
  proc getCapturePreset*(): jint
  proc getFlags*(): jint
  proc getAllFlags*(): jint
  proc getBundle*(): Bundle
  proc getTags*(): Set[string]
  proc areHapticChannelsMuted*(): jboolean
  proc isContentSpatialized*(): jboolean
  proc getSpatializationBehavior*(): jint
  proc getAllowedCapturePolicy*(): jint
  proc isForCallRedirection*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc usageToString*(): string
  proc usageToString*(usage: jint): string {.`static`.}
  proc usageToXsdString*(usage: jint): string {.`static`.}
  proc xsdStringToUsage*(xsdUsage: string): jint {.`static`.}
  proc contentTypeToString*(): string
  proc isSystemUsage*(usage: jint): jboolean {.`static`.}
  proc isSdkUsage*(usage: jint): jboolean {.`static`.}
  proc isHiddenUsage*(usage: jint): jboolean {.`static`.}
  proc isSdkContentType*(contentType: jint): jboolean {.`static`.}
  proc getVolumeControlStream*(): jint
  proc toLegacyStreamType*(aa: AudioAttributes): jint {.`static`.}
  proc capturePolicyToFlags*(capturePolicy: jint, flags: jint): jint {.`static`.}
  CONTENT_TYPE_UNKNOWN*: jint {.`static`.}
  CONTENT_TYPE_SPEECH*: jint {.`static`.}
  CONTENT_TYPE_MUSIC*: jint {.`static`.}
  CONTENT_TYPE_MOVIE*: jint {.`static`.}
  CONTENT_TYPE_SONIFICATION*: jint {.`static`.}
  CONTENT_TYPE_ULTRASOUND*: jint {.`static`.}
  USAGE_UNKNOWN*: jint {.`static`.}
  USAGE_MEDIA*: jint {.`static`.}
  USAGE_VOICE_COMMUNICATION*: jint {.`static`.}
  USAGE_VOICE_COMMUNICATION_SIGNALLING*: jint {.`static`.}
  USAGE_ALARM*: jint {.`static`.}
  USAGE_NOTIFICATION*: jint {.`static`.}
  USAGE_NOTIFICATION_RINGTONE*: jint {.`static`.}
  USAGE_NOTIFICATION_COMMUNICATION_REQUEST*: jint {.`static`.}
  USAGE_NOTIFICATION_COMMUNICATION_INSTANT*: jint {.`static`.}
  USAGE_NOTIFICATION_COMMUNICATION_DELAYED*: jint {.`static`.}
  USAGE_NOTIFICATION_EVENT*: jint {.`static`.}
  USAGE_ASSISTANCE_ACCESSIBILITY*: jint {.`static`.}
  USAGE_ASSISTANCE_NAVIGATION_GUIDANCE*: jint {.`static`.}
  USAGE_ASSISTANCE_SONIFICATION*: jint {.`static`.}
  USAGE_GAME*: jint {.`static`.}
  USAGE_VIRTUAL_SOURCE*: jint {.`static`.}
  USAGE_ASSISTANT*: jint {.`static`.}
  USAGE_CALL_ASSISTANT*: jint {.`static`.}
  USAGE_EMERGENCY*: jint {.`static`.}
  USAGE_SAFETY*: jint {.`static`.}
  USAGE_VEHICLE_STATUS*: jint {.`static`.}
  USAGE_ANNOUNCEMENT*: jint {.`static`.}
  USAGE_SPEAKER_CLEANUP*: jint {.`static`.}
  SUPPRESSIBLE_NOTIFICATION*: jint {.`static`.}
  SUPPRESSIBLE_CALL*: jint {.`static`.}
  SUPPRESSIBLE_NEVER*: jint {.`static`.}
  SUPPRESSIBLE_ALARM*: jint {.`static`.}
  SUPPRESSIBLE_MEDIA*: jint {.`static`.}
  SUPPRESSIBLE_SYSTEM*: jint {.`static`.}
  SUPPRESSIBLE_USAGES*: SparseIntArray {.`static`.}
  SDK_USAGES*: IntArray {.`static`.}
  FLAG_AUDIBILITY_ENFORCED*: jint {.`static`.}
  FLAG_SECURE*: jint {.`static`.}
  FLAG_SCO*: jint {.`static`.}
  FLAG_BEACON*: jint {.`static`.}
  FLAG_HW_AV_SYNC*: jint {.`static`.}
  FLAG_HW_HOTWORD*: jint {.`static`.}
  FLAG_BYPASS_INTERRUPTION_POLICY*: jint {.`static`.}
  FLAG_BYPASS_MUTE*: jint {.`static`.}
  FLAG_LOW_LATENCY*: jint {.`static`.}
  FLAG_DEEP_BUFFER*: jint {.`static`.}
  FLAG_NO_MEDIA_PROJECTION*: jint {.`static`.}
  FLAG_MUTE_HAPTIC*: jint {.`static`.}
  FLAG_NO_SYSTEM_CAPTURE*: jint {.`static`.}
  FLAG_CAPTURE_PRIVATE*: jint {.`static`.}
  FLAG_CONTENT_SPATIALIZED*: jint {.`static`.}
  FLAG_NEVER_SPATIALIZE*: jint {.`static`.}
  FLAG_CALL_REDIRECTION*: jint {.`static`.}
  ALLOW_CAPTURE_BY_ALL*: jint {.`static`.}
  ALLOW_CAPTURE_BY_SYSTEM*: jint {.`static`.}
  ALLOW_CAPTURE_BY_NONE*: jint {.`static`.}
  SPATIALIZATION_BEHAVIOR_AUTO*: jint {.`static`.}
  SPATIALIZATION_BEHAVIOR_NEVER*: jint {.`static`.}
  FLATTEN_TAGS*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AudioAttributes] {.`static`.}

jclass android.media.AudioAttributes.Builder* of JVMObject:
  proc build*(): AudioAttributes
  proc setUsage*(usage: jint): Builder
  proc setSystemUsage*(systemUsage: jint): Builder
  proc setContentType*(contentType: jint): Builder
  proc setInternalContentType*(contentType: jint): Builder
  proc setFlags*(flags: jint): Builder
  proc setHotwordModeEnabled*(enable: jboolean): Builder
  proc setAllowedCapturePolicy*(capturePolicy: jint): Builder
  proc setIsContentSpatialized*(isSpatialized: jboolean): Builder
  proc setSpatializationBehavior*(sb: jint): Builder
  proc replaceFlags*(flags: jint): Builder
  proc addBundle*(bundle: Bundle): Builder
  proc addTag*(tag: string): Builder
  proc replaceTags*(tags: HashSet[string]): Builder
  proc setLegacyStreamType*(streamType: jint): Builder
  proc setInternalLegacyStreamType*(streamType: jint): Builder
  proc setCapturePreset*(preset: jint): Builder
  proc setInternalCapturePreset*(preset: jint): Builder
  proc setHapticChannelsMuted*(muted: jboolean): Builder
  proc setPrivacySensitive*(privacySensitive: jboolean): Builder
  proc setForCallRedirection*(): Builder

jclass android.media.Builder* of JVMObject:
  proc build*(): AudioAttributes
  proc setUsage*(usage: jint): Builder
  proc setSystemUsage*(systemUsage: jint): Builder
  proc setContentType*(contentType: jint): Builder
  proc setInternalContentType*(contentType: jint): Builder
  proc setFlags*(flags: jint): Builder
  proc setHotwordModeEnabled*(enable: jboolean): Builder
  proc setAllowedCapturePolicy*(capturePolicy: jint): Builder
  proc setIsContentSpatialized*(isSpatialized: jboolean): Builder
  proc setSpatializationBehavior*(sb: jint): Builder
  proc replaceFlags*(flags: jint): Builder
  proc addBundle*(bundle: Bundle): Builder
  proc addTag*(tag: string): Builder
  proc replaceTags*(tags: HashSet[string]): Builder
  proc setLegacyStreamType*(streamType: jint): Builder
  proc setInternalLegacyStreamType*(streamType: jint): Builder
  proc setCapturePreset*(preset: jint): Builder
  proc setInternalCapturePreset*(preset: jint): Builder
  proc setHapticChannelsMuted*(muted: jboolean): Builder
  proc setPrivacySensitive*(privacySensitive: jboolean): Builder
  proc setForCallRedirection*(): Builder

