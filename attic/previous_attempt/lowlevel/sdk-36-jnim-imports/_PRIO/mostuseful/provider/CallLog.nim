import jnim

jclass android.provider.CallLog* of JVMObject:
  proc storeCallComposerPicture*(context: Context, input: InputStream, executor: Executor, callback: OutcomeReceiver[Uri, CallComposerLoggingException]) {.`static`.}
  AUTHORITY*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  CALL_COMPOSER_SEGMENT*: string {.`static`.}
  CALL_COMPOSER_PICTURE_URI*: Uri {.`static`.}
  SHADOW_AUTHORITY*: string {.`static`.}
  SHADOW_CALL_COMPOSER_PICTURE_URI*: Uri {.`static`.}

jclass android.provider.CallLog.CallComposerLoggingException* of JVMObject:
  proc getErrorCode*(): jint
  proc toString*(): string

jclass android.provider.CallLog.Calls* of JVMObject:
  proc addCall*(ci: CallerInfo, context: Context, number: string, presentation: jint, callType: jint, features: jint, accountHandle: PhoneAccountHandle, start: jlong, duration: jint, dataUsage: Long, missedReason: jlong, isPhoneAccountMigrationPending: jint): Uri {.`static`.}
  proc addCall*(ci: CallerInfo, context: Context, number: string, postDialDigits: string, viaNumber: string, presentation: jint, callType: jint, features: jint, accountHandle: PhoneAccountHandle, start: jlong, duration: jint, dataUsage: Long, addForAllUsers: jboolean, userToBeInsertedTo: UserHandle, missedReason: jlong, isPhoneAccountMigrationPending: jint): Uri {.`static`.}
  proc addCall*(ci: CallerInfo, context: Context, number: string, postDialDigits: string, viaNumber: string, presentation: jint, callType: jint, features: jint, accountHandle: PhoneAccountHandle, start: jlong, duration: jint, dataUsage: Long, addForAllUsers: jboolean, userToBeInsertedTo: UserHandle, isRead: jboolean, callBlockReason: jint, callScreeningAppName: CharSequence, callScreeningComponentName: string, missedReason: jlong, isPhoneAccountMigrationPending: jint): Uri {.`static`.}
  proc addCall*(context: Context, params: AddCallParams): Uri {.`static`.}
  proc shouldHaveSharedCallLogEntries*(context: Context, userManager: UserManager, userId: jint): jboolean {.`static`.}
  proc getLastOutgoingCall*(context: Context): string {.`static`.}
  proc isUserMissed*(missedReason: jlong): jboolean {.`static`.}

jclass android.provider.CallComposerLoggingException* of Throwable:
  proc getErrorCode*(): jint
  proc toString*(): string
  ERROR_UNKNOWN*: jint {.`static`.}
  ERROR_REMOTE_END_CLOSED*: jint {.`static`.}
  ERROR_STORAGE_FULL*: jint {.`static`.}
  ERROR_INPUT_CLOSED*: jint {.`static`.}

jclass android.provider.AddCallParams.AddCallParametersBuilder* of JVMObject:
  proc setCallerInfo*(callerInfo: CallerInfo): AddCallParametersBuilder
  proc setNumber*(number: string): AddCallParametersBuilder
  proc setPostDialDigits*(postDialDigits: string): AddCallParametersBuilder
  proc setViaNumber*(viaNumber: string): AddCallParametersBuilder
  proc setPresentation*(presentation: jint): AddCallParametersBuilder
  proc setCallType*(callType: jint): AddCallParametersBuilder
  proc setFeatures*(features: jint): AddCallParametersBuilder
  proc setAccountHandle*(accountHandle: PhoneAccountHandle): AddCallParametersBuilder
  proc setStart*(start: jlong): AddCallParametersBuilder
  proc setDuration*(duration: jint): AddCallParametersBuilder
  proc setDataUsage*(dataUsage: jlong): AddCallParametersBuilder
  proc setAddForAllUsers*(addForAllUsers: jboolean): AddCallParametersBuilder
  proc setUserToBeInsertedTo*(userToBeInsertedTo: UserHandle): AddCallParametersBuilder
  proc setIsRead*(isRead: jboolean): AddCallParametersBuilder
  proc setCallBlockReason*(callBlockReason: jint): AddCallParametersBuilder
  proc setCallScreeningAppName*(callScreeningAppName: CharSequence): AddCallParametersBuilder
  proc setCallScreeningComponentName*(callScreeningComponentName: string): AddCallParametersBuilder
  proc setMissedReason*(missedReason: jlong): AddCallParametersBuilder
  proc setPriority*(priority: jint): AddCallParametersBuilder
  proc setSubject*(subject: string): AddCallParametersBuilder
  proc setLatitude*(latitude: jdouble): AddCallParametersBuilder
  proc setLongitude*(longitude: jdouble): AddCallParametersBuilder
  proc setPictureUri*(pictureUri: Uri): AddCallParametersBuilder
  proc setIsPhoneAccountMigrationPending*(isPhoneAccountMigrationPending: jint): AddCallParametersBuilder
  proc setIsBusinessCall*(isBusinessCall: jboolean): AddCallParametersBuilder
  proc setAssertedDisplayName*(assertedDisplayName: string): AddCallParametersBuilder
  proc build*(): AddCallParams

jclass android.provider.AddCallParametersBuilder* of JVMObject:
  proc setCallerInfo*(callerInfo: CallerInfo): AddCallParametersBuilder
  proc setNumber*(number: string): AddCallParametersBuilder
  proc setPostDialDigits*(postDialDigits: string): AddCallParametersBuilder
  proc setViaNumber*(viaNumber: string): AddCallParametersBuilder
  proc setPresentation*(presentation: jint): AddCallParametersBuilder
  proc setCallType*(callType: jint): AddCallParametersBuilder
  proc setFeatures*(features: jint): AddCallParametersBuilder
  proc setAccountHandle*(accountHandle: PhoneAccountHandle): AddCallParametersBuilder
  proc setStart*(start: jlong): AddCallParametersBuilder
  proc setDuration*(duration: jint): AddCallParametersBuilder
  proc setDataUsage*(dataUsage: jlong): AddCallParametersBuilder
  proc setAddForAllUsers*(addForAllUsers: jboolean): AddCallParametersBuilder
  proc setUserToBeInsertedTo*(userToBeInsertedTo: UserHandle): AddCallParametersBuilder
  proc setIsRead*(isRead: jboolean): AddCallParametersBuilder
  proc setCallBlockReason*(callBlockReason: jint): AddCallParametersBuilder
  proc setCallScreeningAppName*(callScreeningAppName: CharSequence): AddCallParametersBuilder
  proc setCallScreeningComponentName*(callScreeningComponentName: string): AddCallParametersBuilder
  proc setMissedReason*(missedReason: jlong): AddCallParametersBuilder
  proc setPriority*(priority: jint): AddCallParametersBuilder
  proc setSubject*(subject: string): AddCallParametersBuilder
  proc setLatitude*(latitude: jdouble): AddCallParametersBuilder
  proc setLongitude*(longitude: jdouble): AddCallParametersBuilder
  proc setPictureUri*(pictureUri: Uri): AddCallParametersBuilder
  proc setIsPhoneAccountMigrationPending*(isPhoneAccountMigrationPending: jint): AddCallParametersBuilder
  proc setIsBusinessCall*(isBusinessCall: jboolean): AddCallParametersBuilder
  proc setAssertedDisplayName*(assertedDisplayName: string): AddCallParametersBuilder
  proc build*(): AddCallParams
  MAX_NUMBER_OF_CHARACTERS*: jint {.`static`.}

jclass android.provider.Calls* of JVMObject:
  proc addCall*(ci: CallerInfo, context: Context, number: string, presentation: jint, callType: jint, features: jint, accountHandle: PhoneAccountHandle, start: jlong, duration: jint, dataUsage: Long, missedReason: jlong, isPhoneAccountMigrationPending: jint): Uri {.`static`.}
  proc addCall*(ci: CallerInfo, context: Context, number: string, postDialDigits: string, viaNumber: string, presentation: jint, callType: jint, features: jint, accountHandle: PhoneAccountHandle, start: jlong, duration: jint, dataUsage: Long, addForAllUsers: jboolean, userToBeInsertedTo: UserHandle, missedReason: jlong, isPhoneAccountMigrationPending: jint): Uri {.`static`.}
  proc addCall*(ci: CallerInfo, context: Context, number: string, postDialDigits: string, viaNumber: string, presentation: jint, callType: jint, features: jint, accountHandle: PhoneAccountHandle, start: jlong, duration: jint, dataUsage: Long, addForAllUsers: jboolean, userToBeInsertedTo: UserHandle, isRead: jboolean, callBlockReason: jint, callScreeningAppName: CharSequence, callScreeningComponentName: string, missedReason: jlong, isPhoneAccountMigrationPending: jint): Uri {.`static`.}
  proc addCall*(context: Context, params: AddCallParams): Uri {.`static`.}
  proc shouldHaveSharedCallLogEntries*(context: Context, userManager: UserManager, userId: jint): jboolean {.`static`.}
  proc getLastOutgoingCall*(context: Context): string {.`static`.}
  proc isUserMissed*(missedReason: jlong): jboolean {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  SHADOW_CONTENT_URI*: Uri {.`static`.}
  CONTENT_FILTER_URI*: Uri {.`static`.}
  LIMIT_PARAM_KEY*: string {.`static`.}
  OFFSET_PARAM_KEY*: string {.`static`.}
  ALLOW_VOICEMAILS_PARAM_KEY*: string {.`static`.}
  EXTRA_CALL_TYPE_FILTER*: string {.`static`.}
  CONTENT_URI_WITH_VOICEMAIL*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  TYP*: string {.`static`.}
  INCOMING_TYPE*: jint {.`static`.}
  OUTGOING_TYPE*: jint {.`static`.}
  MISSED_TYPE*: jint {.`static`.}
  VOICEMAIL_TYPE*: jint {.`static`.}
  REJECTED_TYPE*: jint {.`static`.}
  BLOCKED_TYPE*: jint {.`static`.}
  ANSWERED_EXTERNALLY_TYPE*: jint {.`static`.}
  FEATURES*: string {.`static`.}
  FEATURES_VIDEO*: jint {.`static`.}
  FEATURES_PULLED_EXTERNALLY*: jint {.`static`.}
  FEATURES_HD_CALL*: jint {.`static`.}
  FEATURES_WIFI*: jint {.`static`.}
  FEATURES_ASSISTED_DIALING_USED*: jint {.`static`.}
  FEATURES_RTT*: jint {.`static`.}
  FEATURES_VOLTE*: jint {.`static`.}
  NUMBER*: string {.`static`.}
  IS_BUSINESS_CALL*: string {.`static`.}
  ASSERTED_DISPLAY_NAME*: string {.`static`.}
  NUMBER_PRESENTATION*: string {.`static`.}
  PRESENTATION_ALLOWED*: jint {.`static`.}
  PRESENTATION_RESTRICTED*: jint {.`static`.}
  PRESENTATION_UNKNOWN*: jint {.`static`.}
  PRESENTATION_PAYPHONE*: jint {.`static`.}
  PRESENTATION_UNAVAILABLE*: jint {.`static`.}
  COUNTRY_ISO*: string {.`static`.}
  DATE*: string {.`static`.}
  DURATION*: string {.`static`.}
  DATA_USAGE*: string {.`static`.}
  NEW*: string {.`static`.}
  CACHED_NAME*: string {.`static`.}
  CACHED_NUMBER_TYPE*: string {.`static`.}
  CACHED_NUMBER_LABEL*: string {.`static`.}
  VOICEMAIL_URI*: string {.`static`.}
  TRANSCRIPTION*: string {.`static`.}
  TRANSCRIPTION_STATE*: string {.`static`.}
  IS_READ*: string {.`static`.}
  GEOCODED_LOCATION*: string {.`static`.}
  CACHED_LOOKUP_URI*: string {.`static`.}
  CACHED_MATCHED_NUMBER*: string {.`static`.}
  CACHED_NORMALIZED_NUMBER*: string {.`static`.}
  CACHED_PHOTO_ID*: string {.`static`.}
  CACHED_PHOTO_URI*: string {.`static`.}
  CACHED_FORMATTED_NUMBER*: string {.`static`.}
  PHONE_ACCOUNT_COMPONENT_NAME*: string {.`static`.}
  PHONE_ACCOUNT_ID*: string {.`static`.}
  PHONE_ACCOUNT_ADDRESS*: string {.`static`.}
  PHONE_ACCOUNT_HIDDEN*: string {.`static`.}
  SUB_ID*: string {.`static`.}
  POST_DIAL_DIGITS*: string {.`static`.}
  VIA_NUMBER*: string {.`static`.}
  ADD_FOR_ALL_USERS*: string {.`static`.}
  LAST_MODIFIED*: string {.`static`.}
  BLOCK_REASON_NOT_BLOCKED*: jint {.`static`.}
  BLOCK_REASON_CALL_SCREENING_SERVICE*: jint {.`static`.}
  BLOCK_REASON_DIRECT_TO_VOICEMAIL*: jint {.`static`.}
  BLOCK_REASON_BLOCKED_NUMBER*: jint {.`static`.}
  BLOCK_REASON_UNKNOWN_NUMBER*: jint {.`static`.}
  BLOCK_REASON_RESTRICTED_NUMBER*: jint {.`static`.}
  BLOCK_REASON_PAY_PHONE*: jint {.`static`.}
  BLOCK_REASON_NOT_IN_CONTACTS*: jint {.`static`.}
  CALL_SCREENING_COMPONENT_NAME*: string {.`static`.}
  CALL_SCREENING_APP_NAME*: string {.`static`.}
  BLOCK_REASON*: string {.`static`.}
  MISSED_REASON_NOT_MISSED*: jlong {.`static`.}
  AUTO_MISSED_EMERGENCY_CALL*: jlong {.`static`.}
  AUTO_MISSED_MAXIMUM_RINGING*: jlong {.`static`.}
  AUTO_MISSED_MAXIMUM_DIALING*: jlong {.`static`.}
  USER_MISSED_NO_ANSWER*: jlong {.`static`.}
  USER_MISSED_SHORT_RING*: jlong {.`static`.}
  SHORT_RING_THRESHOLD*: jlong {.`static`.}
  USER_MISSED_DND_MODE*: jlong {.`static`.}
  USER_MISSED_LOW_RING_VOLUME*: jlong {.`static`.}
  LOW_RING_VOLUME*: jint {.`static`.}
  USER_MISSED_NO_VIBRATE*: jlong {.`static`.}
  USER_MISSED_CALL_SCREENING_SERVICE_SILENCED*: jlong {.`static`.}
  USER_MISSED_CALL_FILTERS_TIMEOUT*: jlong {.`static`.}
  USER_MISSED_NEVER_RANG*: jlong {.`static`.}
  USER_MISSED_NOT_RUNNING*: jlong {.`static`.}
  MISSED_REASON*: string {.`static`.}
  SUBJECT*: string {.`static`.}
  PRIORITY_NORMAL*: jint {.`static`.}
  PRIORITY_URGENT*: jint {.`static`.}
  PRIORITY*: string {.`static`.}
  COMPOSER_PHOTO_URI*: string {.`static`.}
  LOCATION*: string {.`static`.}
  IS_PHONE_ACCOUNT_MIGRATION_PENDING*: string {.`static`.}

jclass android.provider.Locations* of JVMObject:
  AUTHORITY*: string {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  LATITUDE*: string {.`static`.}
  LONGITUDE*: string {.`static`.}

