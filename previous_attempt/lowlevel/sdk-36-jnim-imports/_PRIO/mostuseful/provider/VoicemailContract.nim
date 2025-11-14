import jnim

jclass android.provider.VoicemailContract* of JVMObject:
  AUTHORITY*: string {.`static`.}
  PARAM_KEY_SOURCE_PACKAGE*: string {.`static`.}
  ACTION_NEW_VOICEMAIL*: string {.`static`.}
  ACTION_FETCH_VOICEMAIL*: string {.`static`.}
  ACTION_SYNC_VOICEMAIL*: string {.`static`.}
  ACTION_VOICEMAIL_SMS_RECEIVED*: string {.`static`.}
  EXTRA_VOICEMAIL_SMS*: string {.`static`.}
  EXTRA_TARGET_PACKAGE*: string {.`static`.}
  EXTRA_SELF_CHANGE*: string {.`static`.}
  EXTRA_PHONE_ACCOUNT_HANDLE*: string {.`static`.}
  SOURCE_PACKAGE_FIELD*: string {.`static`.}

jclass android.provider.VoicemailContract.Voicemails* of JVMObject:
  proc buildSourceUri*(packageName: string): Uri {.`static`.}
  proc insert*(context: Context, voicemail: Voicemail): Uri {.`static`.}
  proc insert*(context: Context, voicemails: List[Voicemail]): jint {.`static`.}
  proc deleteAll*(context: Context): jint {.`static`.}

jclass android.provider.VoicemailContract.Status* of JVMObject:
  proc buildSourceUri*(packageName: string): Uri {.`static`.}

jclass android.provider.Voicemails* of JVMObject:
  proc buildSourceUri*(packageName: string): Uri {.`static`.}
  proc insert*(context: Context, voicemail: Voicemail): Uri {.`static`.}
  proc insert*(context: Context, voicemails: List[Voicemail]): jint {.`static`.}
  proc deleteAll*(context: Context): jint {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  DIR_TYPE*: string {.`static`.}
  ITEM_TYPE*: string {.`static`.}
  NUMBER*: string {.`static`.}
  DATE*: string {.`static`.}
  DURATION*: string {.`static`.}
  NEW*: string {.`static`.}
  IS_READ*: string {.`static`.}
  STATE*: string {.`static`.}
  STATE_INBOX*: jint {.`static`.}
  STATE_DELETED*: jint {.`static`.}
  STATE_UNDELETED*: jint {.`static`.}
  SOURCE_PACKAGE*: string {.`static`.}
  SOURCE_DATA*: string {.`static`.}
  HAS_CONTENT*: string {.`static`.}
  MIME_TYPE*: string {.`static`.}
  TRANSCRIPTION*: string {.`static`.}
  TRANSCRIPTION_STATE*: string {.`static`.}
  TRANSCRIPTION_NOT_STARTED*: jint {.`static`.}
  TRANSCRIPTION_IN_PROGRESS*: jint {.`static`.}
  TRANSCRIPTION_FAILED*: jint {.`static`.}
  TRANSCRIPTION_AVAILABLE*: jint {.`static`.}
  _DATA*: string {.`static`.}
  PHONE_ACCOUNT_COMPONENT_NAME*: string {.`static`.}
  PHONE_ACCOUNT_ID*: string {.`static`.}
  DIRTY*: string {.`static`.}
  DIRTY_RETAIN*: jint {.`static`.}
  DELETED*: string {.`static`.}
  LAST_MODIFIED*: string {.`static`.}
  BACKED_UP*: string {.`static`.}
  RESTORED*: string {.`static`.}
  ARCHIVED*: string {.`static`.}
  IS_OMTP_VOICEMAIL*: string {.`static`.}

jclass android.provider.Status* of JVMObject:
  proc buildSourceUri*(packageName: string): Uri {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  DIR_TYPE*: string {.`static`.}
  ITEM_TYPE*: string {.`static`.}
  SOURCE_PACKAGE*: string {.`static`.}
  SOURCE_TYPE*: string {.`static`.}
  PHONE_ACCOUNT_COMPONENT_NAME*: string {.`static`.}
  PHONE_ACCOUNT_ID*: string {.`static`.}
  SETTINGS_URI*: string {.`static`.}
  VOICEMAIL_ACCESS_URI*: string {.`static`.}
  CONFIGURATION_STATE*: string {.`static`.}
  CONFIGURATION_STATE_OK*: jint {.`static`.}
  CONFIGURATION_STATE_NOT_CONFIGURED*: jint {.`static`.}
  CONFIGURATION_STATE_CAN_BE_CONFIGURED*: jint {.`static`.}
  CONFIGURATION_STATE_CONFIGURING*: jint {.`static`.}
  CONFIGURATION_STATE_FAILED*: jint {.`static`.}
  CONFIGURATION_STATE_DISABLED*: jint {.`static`.}
  DATA_CHANNEL_STATE*: string {.`static`.}
  DATA_CHANNEL_STATE_OK*: jint {.`static`.}
  DATA_CHANNEL_STATE_NO_CONNECTION*: jint {.`static`.}
  DATA_CHANNEL_STATE_NO_CONNECTION_CELLULAR_REQUIRED*: jint {.`static`.}
  DATA_CHANNEL_STATE_BAD_CONFIGURATION*: jint {.`static`.}
  DATA_CHANNEL_STATE_COMMUNICATION_ERROR*: jint {.`static`.}
  DATA_CHANNEL_STATE_SERVER_ERROR*: jint {.`static`.}
  DATA_CHANNEL_STATE_SERVER_CONNECTION_ERROR*: jint {.`static`.}
  NOTIFICATION_CHANNEL_STATE*: string {.`static`.}
  NOTIFICATION_CHANNEL_STATE_OK*: jint {.`static`.}
  NOTIFICATION_CHANNEL_STATE_NO_CONNECTION*: jint {.`static`.}
  NOTIFICATION_CHANNEL_STATE_MESSAGE_WAITING*: jint {.`static`.}
  QUOTA_OCCUPIED*: string {.`static`.}
  QUOTA_TOTAL*: string {.`static`.}
  QUOTA_UNAVAILABLE*: jint {.`static`.}

