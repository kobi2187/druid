import jnim

jclass android.app.NotificationChannel* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc copy*(): NotificationChannel
  proc lockFields*(field: jint)
  proc unlockFields*(field: jint)
  proc setUserVisibleTaskShown*(shown: jboolean)
  proc setDeleted*(deleted: jboolean)
  proc setDeletedTimeMs*(time: jlong)
  proc setImportantConversation*(importantConvo: jboolean)
  proc setBlockable*(blockable: jboolean)
  proc setName*(name: CharSequence)
  proc setDescription*(description: string)
  proc setId*(id: string)
  proc setGroup*(groupId: string)
  proc setShowBadge*(showBadge: jboolean)
  proc setSound*(sound: Uri, audioAttributes: AudioAttributes)
  proc enableLights*(lights: jboolean)
  proc setLightColor*(argb: jint)
  proc enableVibration*(vibration: jboolean)
  proc setVibrationPattern*(vibrationPattern: seq[jlong])
  proc setVibrationEffect*(effect: VibrationEffect)
  proc setImportance*(importance: jint)
  proc setBypassDnd*(bypassDnd: jboolean)
  proc setLockscreenVisibility*(lockscreenVisibility: jint)
  proc setAllowBubbles*(allowBubbles: jboolean)
  proc setAllowBubbles*(allowed: jint)
  proc setConversationId*(parentChannelId: string, conversationId: string)
  proc getId*(): string
  proc getName*(): CharSequence
  proc getDescription*(): string
  proc getImportance*(): jint
  proc canBypassDnd*(): jboolean
  proc isConversation*(): jboolean
  proc isImportantConversation*(): jboolean
  proc getSound*(): Uri
  proc getAudioAttributes*(): AudioAttributes
  proc shouldShowLights*(): jboolean
  proc getLightColor*(): jint
  proc shouldVibrate*(): jboolean
  proc getVibrationPattern*(): seq[jlong]
  proc getVibrationEffect*(): VibrationEffect
  proc getLockscreenVisibility*(): jint
  proc canShowBadge*(): jboolean
  proc getGroup*(): string
  proc canBubble*(): jboolean
  proc getAllowBubbles*(): jint
  proc getParentChannelId*(): string
  proc getConversationId*(): string
  proc isDeleted*(): jboolean
  proc getDeletedTimeMs*(): jlong
  proc getUserLockedFields*(): jint
  proc isUserVisibleTaskShown*(): jboolean
  proc isBlockable*(): jboolean
  proc setImportanceLockedByCriticalDeviceFunction*(locked: jboolean)
  proc isImportanceLockedByCriticalDeviceFunction*(): jboolean
  proc getOriginalImportance*(): jint
  proc setOriginalImportance*(importance: jint)
  proc setDemoted*(demoted: jboolean)
  proc isDemoted*(): jboolean
  proc hasUserSetImportance*(): jboolean
  proc hasUserSetSound*(): jboolean
  proc getLastNotificationUpdateTimeMs*(): jlong
  proc setLastNotificationUpdateTimeMs*(updateTimeMs: jlong)
  proc populateFromXmlForRestore*(parser: XmlPullParser, pkgInstalled: jboolean, context: Context)
  proc populateFromXml*(parser: XmlPullParser)
  proc isSoundRestored*(): jboolean
  proc restoreSoundUri*(context: Context, uri: Uri, pkgInstalled: jboolean, usage: jint): Uri
  proc writeXml*(output:XmlSerializer)
  proc writeXmlForBackup*(output:XmlSerializer, context: Context)
  proc toJson*(): JSONObject
  proc getChannelIdForBundleType*(type: jint): string {.`static`.}
  proc describeContents*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc dump*(pw: PrintWriter, prefix: string, redacted: jboolean)
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  DEFAULT_CHANNEL_ID*: string {.`static`.}
  PROMOTIONS_ID*: string {.`static`.}
  SOCIAL_MEDIA_ID*: string {.`static`.}
  NEWS_ID*: string {.`static`.}
  RECS_ID*: string {.`static`.}
  SYSTEM_RESERVED_IDS*: ArrayList[string] {.`static`.}
  CONVERSATION_CHANNEL_ID_FORMAT*: string {.`static`.}
  PLACEHOLDER_CONVERSATION_ID*: string {.`static`.}
  EDIT_SOUND*: string {.`static`.}
  EDIT_VIBRATION*: string {.`static`.}
  EDIT_IMPORTANCE*: string {.`static`.}
  EDIT_LOCKED_DEVICE*: string {.`static`.}
  EDIT_ZEN*: string {.`static`.}
  EDIT_CONVERSATION*: string {.`static`.}
  EDIT_LAUNCHER*: string {.`static`.}
  MAX_TEXT_LENGTH*: jint {.`static`.}
  MAX_VIBRATION_LENGTH*: jint {.`static`.}
  MAX_SERIALIZED_VIBRATION_LENGTH*: jint {.`static`.}
  USER_LOCKED_PRIORITY*: jint {.`static`.}
  USER_LOCKED_VISIBILITY*: jint {.`static`.}
  USER_LOCKED_IMPORTANCE*: jint {.`static`.}
  USER_LOCKED_LIGHTS*: jint {.`static`.}
  USER_LOCKED_VIBRATION*: jint {.`static`.}
  USER_LOCKED_SOUND*: jint {.`static`.}
  USER_LOCKED_SHOW_BADGE*: jint {.`static`.}
  USER_LOCKED_ALLOW_BUBBLE*: jint {.`static`.}
  LOCKABLE_FIELDS*: jint {.`static`.}
  DEFAULT_ALLOW_BUBBLE*: jint {.`static`.}
  ALLOW_BUBBLE_ON*: jint {.`static`.}
  ALLOW_BUBBLE_OFF*: jint {.`static`.}
  CREATOR*: Creator[NotificationChannel] {.`static`.}

