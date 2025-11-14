import jnim

jclass android.telecom.PhoneAccount* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc builder*(accountHandle: PhoneAccountHandle, label: CharSequence): Builder {.`static`.}
  proc toBuilder*(): Builder
  proc getAccountHandle*(): PhoneAccountHandle
  proc getAddress*(): Uri
  proc getSubscriptionAddress*(): Uri
  proc getCapabilities*(): jint
  proc hasCapabilities*(capability: jint): jboolean
  proc hasAudioRoutes*(routes: jint): jboolean
  proc getLabel*(): CharSequence
  proc getShortDescription*(): CharSequence
  proc getSupportedUriSchemes*(): List[string]
  proc getExtras*(): Bundle
  proc getSupportedAudioRoutes*(): jint
  proc getIcon*(): Icon
  proc isEnabled*(): jboolean
  proc getGroupId*(): string
  proc supportsUriScheme*(uriScheme: string): jboolean
  proc getHighlightColor*(): jint
  proc setIsEnabled*(isEnabled: jboolean)
  proc isSelfManaged*(): jboolean
  proc getSimultaneousCallingRestriction*(): Set[PhoneAccountHandle]
  proc hasSimultaneousCallingRestriction*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  proc capabilitiesToString*(): string
  EXTRA_SORT_ORDER*: string {.`static`.}
  EXTRA_CALL_SUBJECT_MAX_LENGTH*: string {.`static`.}
  EXTRA_CALL_SUBJECT_CHARACTER_ENCODING*: string {.`static`.}
  EXTRA_ALWAYS_USE_VOIP_AUDIO_MODE*: string {.`static`.}
  EXTRA_SUPPORTS_HANDOVER_TO*: string {.`static`.}
  EXTRA_SUPPORTS_VIDEO_CALLING_FALLBACK*: string {.`static`.}
  EXTRA_SUPPORTS_HANDOVER_FROM*: string {.`static`.}
  EXTRA_LOG_SELF_MANAGED_CALLS*: string {.`static`.}
  EXTRA_PLAY_CALL_RECORDING_TONE*: string {.`static`.}
  EXTRA_SKIP_CALL_FILTERING*: string {.`static`.}
  EXTRA_ADD_SELF_MANAGED_CALLS_TO_INCALLSERVICE*: string {.`static`.}
  CAPABILITY_CONNECTION_MANAGER*: jint {.`static`.}
  CAPABILITY_CALL_PROVIDER*: jint {.`static`.}
  CAPABILITY_SIM_SUBSCRIPTION*: jint {.`static`.}
  CAPABILITY_VIDEO_CALLING*: jint {.`static`.}
  CAPABILITY_PLACE_EMERGENCY_CALLS*: jint {.`static`.}
  CAPABILITY_MULTI_USER*: jint {.`static`.}
  CAPABILITY_CALL_SUBJECT*: jint {.`static`.}
  CAPABILITY_EMERGENCY_CALLS_ONLY*: jint {.`static`.}
  CAPABILITY_VIDEO_CALLING_RELIES_ON_PRESENCE*: jint {.`static`.}
  CAPABILITY_EMERGENCY_VIDEO_CALLING*: jint {.`static`.}
  CAPABILITY_SUPPORTS_VIDEO_CALLING*: jint {.`static`.}
  CAPABILITY_SELF_MANAGED*: jint {.`static`.}
  CAPABILITY_RTT*: jint {.`static`.}
  CAPABILITY_EMERGENCY_PREFERRED*: jint {.`static`.}
  CAPABILITY_ADHOC_CONFERENCE_CALLING*: jint {.`static`.}
  CAPABILITY_CALL_COMPOSER*: jint {.`static`.}
  CAPABILITY_SUPPORTS_VOICE_CALLING_INDICATIONS*: jint {.`static`.}
  CAPABILITY_VOICE_CALLING_AVAILABLE*: jint {.`static`.}
  CAPABILITY_SUPPORTS_TRANSACTIONAL_OPERATIONS*: jint {.`static`.}
  CAPABILITY_SUPPORTS_CALL_STREAMING*: jint {.`static`.}
  SCHEME_TEL*: string {.`static`.}
  SCHEME_VOICEMAIL*: string {.`static`.}
  SCHEME_SIP*: string {.`static`.}
  NO_ICON_TINT*: jint {.`static`.}
  NO_HIGHLIGHT_COLOR*: jint {.`static`.}
  NO_RESOURCE_ID*: jint {.`static`.}
  CREATOR*: Creator[PhoneAccount] {.`static`.}

jclass android.telecom.PhoneAccount.Builder* of JVMObject:
  proc setLabel*(label: CharSequence): Builder
  proc setAddress*(value: Uri): Builder
  proc setSubscriptionAddress*(value: Uri): Builder
  proc setCapabilities*(value: jint): Builder
  proc setIcon*(icon: Icon): Builder
  proc setHighlightColor*(value: jint): Builder
  proc setShortDescription*(value: CharSequence): Builder
  proc addSupportedUriScheme*(uriScheme: string): Builder
  proc setSupportedUriSchemes*(uriSchemes: List[string]): Builder
  proc setExtras*(extras: Bundle): Builder
  proc setIsEnabled*(isEnabled: jboolean): Builder
  proc setGroupId*(groupId: string): Builder
  proc setSupportedAudioRoutes*(routes: jint): Builder
  proc setSimultaneousCallingRestriction*(handles: Set[PhoneAccountHandle]): Builder
  proc clearSimultaneousCallingRestriction*(): Builder
  proc build*(): PhoneAccount

jclass android.telecom.Builder* of JVMObject:
  proc setLabel*(label: CharSequence): Builder
  proc setAddress*(value: Uri): Builder
  proc setSubscriptionAddress*(value: Uri): Builder
  proc setCapabilities*(value: jint): Builder
  proc setIcon*(icon: Icon): Builder
  proc setHighlightColor*(value: jint): Builder
  proc setShortDescription*(value: CharSequence): Builder
  proc addSupportedUriScheme*(uriScheme: string): Builder
  proc setSupportedUriSchemes*(uriSchemes: List[string]): Builder
  proc setExtras*(extras: Bundle): Builder
  proc setIsEnabled*(isEnabled: jboolean): Builder
  proc setGroupId*(groupId: string): Builder
  proc setSupportedAudioRoutes*(routes: jint): Builder
  proc setSimultaneousCallingRestriction*(handles: Set[PhoneAccountHandle]): Builder
  proc clearSimultaneousCallingRestriction*(): Builder
  proc build*(): PhoneAccount

