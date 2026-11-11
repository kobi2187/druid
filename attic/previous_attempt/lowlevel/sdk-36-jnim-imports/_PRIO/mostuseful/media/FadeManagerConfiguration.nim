import jnim

jclass android.media.FadeManagerConfiguration* of JVMObject:
  proc getFadeState*(): jint
  proc getFadeableUsages*(): List[Integer]
  proc getUnfadeablePlayerTypes*(): List[Integer]
  proc getUnfadeableContentTypes*(): List[Integer]
  proc getUnfadeableUids*(): List[Integer]
  proc getUnfadeableAudioAttributes*(): List[AudioAttributes]
  proc getFadeOutDurationForUsage*(usage: jint): jlong
  proc getFadeInDurationForUsage*(usage: jint): jlong
  proc getFadeOutVolumeShaperConfigForUsage*(usage: jint): VolumeShaper.Configuration
  proc getFadeInVolumeShaperConfigForUsage*(usage: jint): VolumeShaper.Configuration
  proc getFadeOutDurationForAudioAttributes*(audioAttributes: AudioAttributes): jlong
  proc getFadeInDurationForAudioAttributes*(audioAttributes: AudioAttributes): jlong
  proc getFadeOutVolumeShaperConfigForAudioAttributes*(audioAttributes: AudioAttributes): VolumeShaper.Configuration
  proc getFadeInVolumeShaperConfigForAudioAttributes*(audioAttributes: AudioAttributes): VolumeShaper.Configuration
  proc getAudioAttributesWithVolumeShaperConfigs*(): List[AudioAttributes]
  proc getFadeInDelayForOffenders*(): jlong
  proc isFadeEnabled*(): jboolean
  proc isUsageFadeable*(usage: jint): jboolean
  proc isContentTypeUnfadeable*(contentType: jint): jboolean
  proc isPlayerTypeUnfadeable*(playerType: jint): jboolean
  proc isAudioAttributesUnfadeable*(audioAttributes: AudioAttributes): jboolean
  proc isUidUnfadeable*(uid: jint): jboolean
  proc getDefaultFadeOutDurationMillis*(): jlong {.`static`.}
  proc getDefaultFadeInDurationMillis*(): jlong {.`static`.}
  proc toString*(): string
  proc fadeStateToString*(fadeState: jint): string {.`static`.}
  proc describeContents*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  TAG*: string {.`static`.}
  FADE_STATE_DISABLED*: jint {.`static`.}
  FADE_STATE_ENABLED_DEFAULT*: jint {.`static`.}
  VOLUME_SHAPER_SYSTEM_FADE_ID*: jint {.`static`.}
  DURATION_NOT_SET*: jlong {.`static`.}
  CREATOR*: Creator[FadeManagerConfiguration] {.`static`.}

jclass android.media.FadeManagerConfiguration.Builder* of JVMObject:
  proc setFadeState*(state: jint): Builder
  proc setFadeOutVolumeShaperConfigForUsage*(usage: jint, fadeOutVShaperConfig: VolumeShaper.Configuration): Builder
  proc setFadeInVolumeShaperConfigForUsage*(usage: jint, fadeInVShaperConfig: VolumeShaper.Configuration): Builder
  proc setFadeOutDurationForUsage*(usage: jint, fadeOutDurationMillis: jlong): Builder
  proc setFadeInDurationForUsage*(usage: jint, fadeInDurationMillis: jlong): Builder
  proc setFadeOutVolumeShaperConfigForAudioAttributes*(audioAttributes: AudioAttributes, fadeOutVShaperConfig: VolumeShaper.Configuration): Builder
  proc setFadeInVolumeShaperConfigForAudioAttributes*(audioAttributes: AudioAttributes, fadeInVShaperConfig: VolumeShaper.Configuration): Builder
  proc setFadeOutDurationForAudioAttributes*(audioAttributes: AudioAttributes, fadeOutDurationMillis: jlong): Builder
  proc setFadeInDurationForAudioAttributes*(audioAttributes: AudioAttributes, fadeInDurationMillis: jlong): Builder
  proc setFadeableUsages*(usages: List[Integer]): Builder
  proc addFadeableUsage*(usage: jint): Builder
  proc clearFadeableUsages*(): Builder
  proc setUnfadeableContentTypes*(contentTypes: List[Integer]): Builder
  proc addUnfadeableContentType*(contentType: jint): Builder
  proc clearUnfadeableContentTypes*(): Builder
  proc setUnfadeableUids*(uids: List[Integer]): Builder
  proc addUnfadeableUid*(uid: jint): Builder
  proc clearUnfadeableUids*(): Builder
  proc setUnfadeableAudioAttributes*(attrs: List[AudioAttributes]): Builder
  proc addUnfadeableAudioAttributes*(audioAttributes: AudioAttributes): Builder
  proc clearUnfadeableAudioAttributes*(): Builder
  proc setFadeInDelayForOffenders*(delayMillis: jlong): Builder
  proc build*(): FadeManagerConfiguration

jclass android.media.Builder* of JVMObject:
  proc setFadeState*(state: jint): Builder
  proc setFadeOutVolumeShaperConfigForUsage*(usage: jint, fadeOutVShaperConfig: VolumeShaper.Configuration): Builder
  proc setFadeInVolumeShaperConfigForUsage*(usage: jint, fadeInVShaperConfig: VolumeShaper.Configuration): Builder
  proc setFadeOutDurationForUsage*(usage: jint, fadeOutDurationMillis: jlong): Builder
  proc setFadeInDurationForUsage*(usage: jint, fadeInDurationMillis: jlong): Builder
  proc setFadeOutVolumeShaperConfigForAudioAttributes*(audioAttributes: AudioAttributes, fadeOutVShaperConfig: VolumeShaper.Configuration): Builder
  proc setFadeInVolumeShaperConfigForAudioAttributes*(audioAttributes: AudioAttributes, fadeInVShaperConfig: VolumeShaper.Configuration): Builder
  proc setFadeOutDurationForAudioAttributes*(audioAttributes: AudioAttributes, fadeOutDurationMillis: jlong): Builder
  proc setFadeInDurationForAudioAttributes*(audioAttributes: AudioAttributes, fadeInDurationMillis: jlong): Builder
  proc setFadeableUsages*(usages: List[Integer]): Builder
  proc addFadeableUsage*(usage: jint): Builder
  proc clearFadeableUsages*(): Builder
  proc setUnfadeableContentTypes*(contentTypes: List[Integer]): Builder
  proc addUnfadeableContentType*(contentType: jint): Builder
  proc clearUnfadeableContentTypes*(): Builder
  proc setUnfadeableUids*(uids: List[Integer]): Builder
  proc addUnfadeableUid*(uid: jint): Builder
  proc clearUnfadeableUids*(): Builder
  proc setUnfadeableAudioAttributes*(attrs: List[AudioAttributes]): Builder
  proc addUnfadeableAudioAttributes*(audioAttributes: AudioAttributes): Builder
  proc clearUnfadeableAudioAttributes*(): Builder
  proc setFadeInDelayForOffenders*(delayMillis: jlong): Builder
  proc build*(): FadeManagerConfiguration

