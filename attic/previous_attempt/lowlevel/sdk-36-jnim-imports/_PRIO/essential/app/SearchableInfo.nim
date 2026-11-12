import jnim

jclass android.app.SearchableInfo* of JVMObject:
  proc getSuggestAuthority*(): string
  proc getSuggestPackage*(): string
  proc getSearchActivity*(): ComponentName
  proc useBadgeLabel*(): jboolean
  proc useBadgeIcon*(): jboolean
  proc shouldRewriteQueryFromData*(): jboolean
  proc shouldRewriteQueryFromText*(): jboolean
  proc getSettingsDescriptionId*(): jint
  proc getSuggestPath*(): string
  proc getSuggestSelection*(): string
  proc getSuggestIntentAction*(): string
  proc getSuggestIntentData*(): string
  proc getSuggestThreshold*(): jint
  proc getActivityContext*(context: Context): Context
  proc getProviderContext*(context: Context, activityContext: Context): Context
  proc findActionKey*(keyCode: jint): ActionKeyInfo
  proc getActivityMetaData*(context: Context, activityInfo: ActivityInfo, userId: jint): SearchableInfo {.`static`.}
  proc getLabelId*(): jint
  proc getHintId*(): jint
  proc getIconId*(): jint
  proc getVoiceSearchEnabled*(): jboolean
  proc getVoiceSearchLaunchWebSearch*(): jboolean
  proc getVoiceSearchLaunchRecognizer*(): jboolean
  proc getVoiceLanguageModeId*(): jint
  proc getVoicePromptTextId*(): jint
  proc getVoiceLanguageId*(): jint
  proc getVoiceMaxResults*(): jint
  proc getSearchButtonText*(): jint
  proc getInputType*(): jint
  proc getImeOptions*(): jint
  proc shouldIncludeInGlobalSearch*(): jboolean
  proc queryAfterZeroResults*(): jboolean
  proc autoUrlDetect*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[SearchableInfo] {.`static`.}

jclass android.app.SearchableInfo.ActionKeyInfo* of JVMObject:
  proc getKeyCode*(): jint
  proc getQueryActionMsg*(): string
  proc getSuggestActionMsg*(): string
  proc getSuggestActionMsgColumn*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.app.ActionKeyInfo* of JVMObject:
  proc getKeyCode*(): jint
  proc getQueryActionMsg*(): string
  proc getSuggestActionMsg*(): string
  proc getSuggestActionMsgColumn*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[ActionKeyInfo] {.`static`.}

