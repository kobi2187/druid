import jnim

jclass android.telecom.TelecomManager* of JVMObject:
  proc from*(context: Context): TelecomManager {.`static`.}
  proc getDefaultOutgoingPhoneAccount*(uriScheme: string): PhoneAccountHandle
  proc getUserSelectedOutgoingPhoneAccount*(): PhoneAccountHandle
  proc setUserSelectedOutgoingPhoneAccount*(accountHandle: PhoneAccountHandle)
  proc getSimCallManager*(): PhoneAccountHandle
  proc getSimCallManagerForSubscription*(subscriptionId: jint): PhoneAccountHandle
  proc getSimCallManager*(userId: jint): PhoneAccountHandle
  proc getConnectionManager*(): PhoneAccountHandle
  proc getPhoneAccountsSupportingScheme*(uriScheme: string): List[PhoneAccountHandle]
  proc getCallCapablePhoneAccounts*(): List[PhoneAccountHandle]
  proc getCallCapablePhoneAccountsAcrossProfiles*(): List[PhoneAccountHandle]
  proc getSelfManagedPhoneAccounts*(): List[PhoneAccountHandle]
  proc getOwnSelfManagedPhoneAccounts*(): List[PhoneAccountHandle]
  proc getRegisteredPhoneAccounts*(): List[PhoneAccount]
  proc getCallCapablePhoneAccounts*(includeDisabledAccounts: jboolean): List[PhoneAccountHandle]
  proc getCallCapablePhoneAccountsAcrossProfiles*(includeDisabledAccounts: jboolean): List[PhoneAccountHandle]
  proc getPhoneAccountsForPackage*(): List[PhoneAccountHandle]
  proc getPhoneAccount*(account: PhoneAccountHandle): PhoneAccount
  proc getAllPhoneAccountsCount*(): jint
  proc getAllPhoneAccounts*(): List[PhoneAccount]
  proc getAllPhoneAccountHandles*(): List[PhoneAccountHandle]
  proc registerPhoneAccount*(account: PhoneAccount)
  proc unregisterPhoneAccount*(accountHandle: PhoneAccountHandle)
  proc clearPhoneAccounts*()
  proc clearAccounts*()
  proc clearAccountsForPackage*(packageName: string)
  proc getDefaultPhoneApp*(): ComponentName
  proc getDefaultDialerPackage*(): string
  proc getDefaultDialerPackage*(userHandle: UserHandle): string
  proc setDefaultDialer*(packageName: string): jboolean
  proc getSystemDialerPackage*(): string
  proc isVoiceMailNumber*(accountHandle: PhoneAccountHandle, number: string): jboolean
  proc getVoiceMailNumber*(accountHandle: PhoneAccountHandle): string
  proc hasForegroundServiceDelegation*(handle: PhoneAccountHandle): jboolean
  proc getLine1Number*(accountHandle: PhoneAccountHandle): string
  proc isInCall*(): jboolean
  proc hasManageOngoingCallsPermission*(): jboolean
  proc isInManagedCall*(): jboolean
  proc getCallState*(): jint
  proc isRinging*(): jboolean
  proc endCall*(): jboolean
  proc acceptRingingCall*()
  proc acceptRingingCall*(videoState: jint)
  proc silenceRinger*()
  proc isTtySupported*(): jboolean
  proc getCurrentTtyMode*(): jint
  proc addNewIncomingCall*(phoneAccount: PhoneAccountHandle, extras: Bundle)
  proc addNewIncomingConference*(phoneAccount: PhoneAccountHandle, extras: Bundle)
  proc addNewUnknownCall*(phoneAccount: PhoneAccountHandle, extras: Bundle)
  proc handleMmi*(dialString: string): jboolean
  proc handleMmi*(dialString: string, accountHandle: PhoneAccountHandle): jboolean
  proc getAdnUriForPhoneAccount*(accountHandle: PhoneAccountHandle): Uri
  proc cancelMissedCallsNotification*()
  proc showInCallScreen*(showDialpad: jboolean)
  proc placeCall*(address: Uri, extras: Bundle)
  proc startConference*(participants: List[Uri], extras: Bundle)
  proc enablePhoneAccount*(handle: PhoneAccountHandle, isEnabled: jboolean)
  proc dumpAnalytics*(): TelecomAnalytics
  proc createManageBlockedNumbersIntent*(): Intent
  proc createLaunchEmergencyDialerIntent*(number: string): Intent
  proc isIncomingCallPermitted*(phoneAccountHandle: PhoneAccountHandle): jboolean
  proc isOutgoingCallPermitted*(phoneAccountHandle: PhoneAccountHandle): jboolean
  proc acceptHandover*(srcAddr: Uri, videoState: jint, destAcct: PhoneAccountHandle)
  proc isInEmergencyCall*(): jboolean
  proc isInSelfManagedCall*(packageName: string, userHandle: UserHandle): jboolean
  proc addCall*(callAttributes: CallAttributes, executor: Executor, pendingControl: OutcomeReceiver[CallControl, CallException], handshakes: CallControlCallback, events: CallEventCallback)
  proc handleCallIntent*(intent: Intent, callingPackageProxy: string)
  ACTION_INCOMING_CALL*: string {.`static`.}
  ACTION_NEW_UNKNOWN_CALL*: string {.`static`.}
  ACTION_CONFIGURE_PHONE_ACCOUNT*: string {.`static`.}
  ACTION_SHOW_CALL_ACCESSIBILITY_SETTINGS*: string {.`static`.}
  ACTION_SHOW_CALL_SETTINGS*: string {.`static`.}
  ACTION_SHOW_RESPOND_VIA_SMS_SETTINGS*: string {.`static`.}
  ACTION_CHANGE_PHONE_ACCOUNTS*: string {.`static`.}
  ACTION_PHONE_ACCOUNT_REGISTERED*: string {.`static`.}
  ACTION_PHONE_ACCOUNT_UNREGISTERED*: string {.`static`.}
  ACTION_CHANGE_DEFAULT_DIALER*: string {.`static`.}
  ACTION_DEFAULT_DIALER_CHANGED*: string {.`static`.}
  EXTRA_CHANGE_DEFAULT_DIALER_PACKAGE_NAME*: string {.`static`.}
  ACTION_DEFAULT_CALL_SCREENING_APP_CHANGED*: string {.`static`.}
  EXTRA_DEFAULT_CALL_SCREENING_APP_COMPONENT_NAME*: string {.`static`.}
  EXTRA_DO_NOT_LOG_CALL*: string {.`static`.}
  EXTRA_IS_DEFAULT_CALL_SCREENING_APP*: string {.`static`.}
  EXTRA_START_CALL_WITH_SPEAKERPHONE*: string {.`static`.}
  EXTRA_START_CALL_WITH_VIDEO_STATE*: string {.`static`.}
  EXTRA_INCOMING_VIDEO_STATE*: string {.`static`.}
  EXTRA_PHONE_ACCOUNT_HANDLE*: string {.`static`.}
  EXTRA_CALL_SUBJECT*: string {.`static`.}
  PRIORITY_NORMAL*: jint {.`static`.}
  PRIORITY_URGENT*: jint {.`static`.}
  EXTRA_PRIORITY*: string {.`static`.}
  EXTRA_LOCATION*: string {.`static`.}
  EXTRA_HAS_PICTURE*: string {.`static`.}
  EXTRA_PICTURE_URI*: string {.`static`.}
  EXTRA_OUTGOING_PICTURE*: string {.`static`.}
  EXTRA_INCOMING_CALL_ADDRESS*: string {.`static`.}
  EXTRA_INCOMING_CALL_EXTRAS*: string {.`static`.}
  EXTRA_CALL_HAS_IN_BAND_RINGTONE*: string {.`static`.}
  EXTRA_OUTGOING_CALL_EXTRAS*: string {.`static`.}
  EXTRA_IS_USER_INTENT_EMERGENCY_CALL*: string {.`static`.}
  EXTRA_UNKNOWN_CALL_HANDLE*: string {.`static`.}
  EXTRA_CALL_CREATED_TIME_MILLIS*: string {.`static`.}
  EXTRA_CALL_LOG_URI*: string {.`static`.}
  EXTRA_CALL_ANSWERED_TIME_MILLIS*: string {.`static`.}
  EXTRA_CALL_CREATED_EPOCH_TIME_MILLIS*: string {.`static`.}
  EXTRA_CALL_TELECOM_ROUTING_START_TIME_MILLIS*: string {.`static`.}
  EXTRA_CALL_TELECOM_ROUTING_END_TIME_MILLIS*: string {.`static`.}
  EXTRA_CALL_DISCONNECT_CAUSE*: string {.`static`.}
  EXTRA_CALL_DISCONNECT_MESSAGE*: string {.`static`.}
  CALL_AUTO_DISCONNECT_MESSAGE_STRING*: string {.`static`.}
  EXTRA_CONNECTION_SERVICE*: string {.`static`.}
  EXTRA_CALL_TECHNOLOGY_TYPE*: string {.`static`.}
  EXTRA_CALL_NETWORK_TYPE*: string {.`static`.}
  GATEWAY_PROVIDER_PACKAGE*: string {.`static`.}
  GATEWAY_ORIGINAL_ADDRESS*: string {.`static`.}
  EXTRA_CALL_BACK_NUMBER*: string {.`static`.}
  EXTRA_NEW_OUTGOING_CALL_CANCEL_TIMEOUT*: string {.`static`.}
  EXTRA_IS_HANDOVER*: string {.`static`.}
  EXTRA_IS_HANDOVER_CONNECTION*: string {.`static`.}
  EXTRA_HANDOVER_FROM_PHONE_ACCOUNT*: string {.`static`.}
  EXTRA_CALL_AUDIO_STATE*: string {.`static`.}
  EXTRA_START_CALL_WITH_RTT*: string {.`static`.}
  ACTION_POST_CALL*: string {.`static`.}
  EXTRA_HANDLE*: string {.`static`.}
  EXTRA_DISCONNECT_CAUSE*: string {.`static`.}
  EXTRA_CALL_DURATION*: string {.`static`.}
  DURATION_VERY_SHORT*: jint {.`static`.}
  DURATION_SHORT*: jint {.`static`.}
  DURATION_MEDIUM*: jint {.`static`.}
  DURATION_LONG*: jint {.`static`.}
  VERY_SHORT_CALL_TIME_MS*: jlong {.`static`.}
  SHORT_CALL_TIME_MS*: jlong {.`static`.}
  MEDIUM_CALL_TIME_MS*: jlong {.`static`.}
  METADATA_IN_CALL_SERVICE_UI*: string {.`static`.}
  METADATA_IN_CALL_SERVICE_CAR_MODE_UI*: string {.`static`.}
  METADATA_IN_CALL_SERVICE_RINGING*: string {.`static`.}
  METADATA_INCLUDE_EXTERNAL_CALLS*: string {.`static`.}
  METADATA_INCLUDE_SELF_MANAGED_CALLS*: string {.`static`.}
  DTMF_CHARACTER_PAUSE*: jchar {.`static`.}
  DTMF_CHARACTER_WAIT*: jchar {.`static`.}
  TTY_MODE_OFF*: jint {.`static`.}
  TTY_MODE_FULL*: jint {.`static`.}
  TTY_MODE_HCO*: jint {.`static`.}
  TTY_MODE_VCO*: jint {.`static`.}
  ACTION_CURRENT_TTY_MODE_CHANGED*: string {.`static`.}
  EXTRA_CURRENT_TTY_MODE*: string {.`static`.}
  ACTION_TTY_PREFERRED_MODE_CHANGED*: string {.`static`.}
  EXTRA_TTY_PREFERRED_MODE*: string {.`static`.}
  ACTION_SHOW_MISSED_CALLS_NOTIFICATION*: string {.`static`.}
  EXTRA_NOTIFICATION_COUNT*: string {.`static`.}
  EXTRA_NOTIFICATION_PHONE_NUMBER*: string {.`static`.}
  EXTRA_CLEAR_MISSED_CALLS_INTENT*: string {.`static`.}
  EXTRA_CALL_BACK_INTENT*: string {.`static`.}
  EMERGENCY_DIALER_COMPONENT*: ComponentName {.`static`.}
  EXTRA_USE_ASSISTED_DIALING*: string {.`static`.}
  EXTRA_CALL_SOURCE*: string {.`static`.}
  ACTION_SHOW_SWITCH_TO_WORK_PROFILE_FOR_CALL_DIALOG*: string {.`static`.}
  EXTRA_MANAGED_PROFILE_USER_ID*: string {.`static`.}
  CALL_SOURCE_EMERGENCY_SHORTCUT*: jint {.`static`.}
  CALL_SOURCE_EMERGENCY_DIALPAD*: jint {.`static`.}
  CALL_SOURCE_UNSPECIFIED*: jint {.`static`.}
  PRESENTATION_ALLOWED*: jint {.`static`.}
  PRESENTATION_RESTRICTED*: jint {.`static`.}
  PRESENTATION_UNKNOWN*: jint {.`static`.}
  PRESENTATION_PAYPHONE*: jint {.`static`.}
  PRESENTATION_UNAVAILABLE*: jint {.`static`.}
  PROPERTY_VIDEOCALL_AUDIO_OUTPUT*: string {.`static`.}
  AUDIO_OUTPUT_ENABLE_SPEAKER*: jint {.`static`.}
  AUDIO_OUTPUT_DISABLE_SPEAKER*: jint {.`static`.}
  AUDIO_OUTPUT_DEFAULT*: jint {.`static`.}
  ENABLE_GET_CALL_STATE_PERMISSION_PROTECTION*: jlong {.`static`.}
  ENABLE_GET_PHONE_ACCOUNT_PERMISSION_PROTECTION*: jlong {.`static`.}
  TELECOM_TRANSACTION_SUCCESS*: jint {.`static`.}
  TRANSACTION_CALL_ID_KEY*: string {.`static`.}

