import jnim

jclass android.telephony.SmsManager* of JVMObject:
  proc sendTextMessage*(destinationAddress: string, scAddress: string, text: string, sentIntent: PendingIntent, deliveryIntent: PendingIntent)
  proc sendTextMessage*(destinationAddress: string, scAddress: string, text: string, sentIntent: PendingIntent, deliveryIntent: PendingIntent, messageId: jlong)
  proc sendTextMessage*(destinationAddress: string, scAddress: string, text: string, sentIntent: PendingIntent, deliveryIntent: PendingIntent, priority: jint, expectMore: jboolean, validityPeriod: jint)
  proc sendTextMessageWithoutPersisting*(destinationAddress: string, scAddress: string, text: string, sentIntent: PendingIntent, deliveryIntent: PendingIntent)
  proc injectSmsPdu*(pdu: seq[jbyte], format: string, receivedIntent: PendingIntent)
  proc divideMessage*(text: string): ArrayList[string]
  proc sendMultipartTextMessage*(destinationAddress: string, scAddress: string, parts: ArrayList[string], sentIntents: ArrayList[PendingIntent], deliveryIntents: ArrayList[PendingIntent])
  proc sendMultipartTextMessage*(destinationAddress: string, scAddress: string, parts: List[string], sentIntents: List[PendingIntent], deliveryIntents: List[PendingIntent], messageId: jlong)
  proc sendMultipartTextMessage*(destinationAddress: string, scAddress: string, parts: List[string], sentIntents: List[PendingIntent], deliveryIntents: List[PendingIntent], packageName: string, attributionTag: string)
  proc sendMultipartTextMessageWithoutPersisting*(destinationAddress: string, scAddress: string, parts: List[string], sentIntents: List[PendingIntent], deliveryIntents: List[PendingIntent])
  proc sendMultipartTextMessage*(destinationAddress: string, scAddress: string, parts: ArrayList[string], sentIntents: ArrayList[PendingIntent], deliveryIntents: ArrayList[PendingIntent], priority: jint, expectMore: jboolean, validityPeriod: jint)
  proc sendDataMessage*(destinationAddress: string, scAddress: string, destinationPort: jshort, data: seq[jbyte], sentIntent: PendingIntent, deliveryIntent: PendingIntent)
  proc getDefault*(): SmsManager {.`static`.}
  proc getSmsManagerForContextAndSubscriptionId*(context: Context, subId: jint): SmsManager {.`static`.}
  proc getSmsManagerForSubscriptionId*(subId: jint): SmsManager {.`static`.}
  proc createForSubscriptionId*(subId: jint): SmsManager
  proc getSubscriptionId*(): jint
  proc copyMessageToIcc*(smsc: seq[jbyte], pdu: seq[jbyte], status: jint): jboolean
  proc deleteMessageFromIcc*(messageIndex: jint): jboolean
  proc updateMessageOnIcc*(messageIndex: jint, newStatus: jint, pdu: seq[jbyte]): jboolean
  proc getMessagesFromIcc*(): List[SmsMessage]
  proc getAllMessagesFromIcc*(): ArrayList[SmsMessage]
  proc enableCellBroadcastRange*(startMessageId: jint, endMessageId: jint, ranType: jint): jboolean
  proc disableCellBroadcastRange*(startMessageId: jint, endMessageId: jint, ranType: jint): jboolean
  proc isImsSmsSupported*(): jboolean
  proc getImsSmsFormat*(): string
  proc getDefaultSmsSubscriptionId*(): jint {.`static`.}
  proc isSMSPromptEnabled*(): jboolean
  proc getSmsCapacityOnIcc*(): jint
  proc sendMultimediaMessage*(context: Context, contentUri: Uri, locationUrl: string, configOverrides: Bundle, sentIntent: PendingIntent)
  proc sendMultimediaMessage*(context: Context, contentUri: Uri, locationUrl: string, configOverrides: Bundle, sentIntent: PendingIntent, messageId: jlong)
  proc downloadMultimediaMessage*(context: Context, locationUrl: string, contentUri: Uri, configOverrides: Bundle, downloadedIntent: PendingIntent)
  proc downloadMultimediaMessage*(context: Context, locationUrl: string, contentUri: Uri, configOverrides: Bundle, downloadedIntent: PendingIntent, messageId: jlong)
  proc getCarrierConfigValues*(): Bundle
  proc createAppSpecificSmsToken*(intent: PendingIntent): string
  proc getSmsMessagesForFinancialApp*(params: Bundle, executor: Executor, callback: FinancialSmsCallback)
  proc createAppSpecificSmsTokenWithPackageInfo*(prefixes: string, intent: PendingIntent): string
  proc setStorageMonitorMemoryStatusOverride*(storageAvailable: jboolean)
  proc clearStorageMonitorMemoryStatusOverride*()
  proc checkSmsShortCodeDestination*(destAddress: string, countryIso: string): jint
  proc getSmscAddress*(): string
  proc setSmscAddress*(smsc: string): jboolean
  proc getPremiumSmsConsent*(packageName: string): jint
  proc setPremiumSmsConsent*(packageName: string, permission: jint)
  proc resetAllCellBroadcastRanges*()
  proc getSmscIdentity*(): Uri
  proc getWapMessageSize*(locationUrl: string): jlong
  SMS_RECORD_LENGTH*: jint {.`static`.}
  CDMA_SMS_RECORD_LENGTH*: jint {.`static`.}
  MMS_CONFIG_APPEND_TRANSACTION_ID*: string {.`static`.}
  MMS_CONFIG_MMS_ENABLED*: string {.`static`.}
  MMS_CONFIG_GROUP_MMS_ENABLED*: string {.`static`.}
  MMS_CONFIG_NOTIFY_WAP_MMSC_ENABLED*: string {.`static`.}
  MMS_CONFIG_ALIAS_ENABLED*: string {.`static`.}
  MMS_CONFIG_ALLOW_ATTACH_AUDIO*: string {.`static`.}
  MMS_CONFIG_MULTIPART_SMS_ENABLED*: string {.`static`.}
  MMS_CONFIG_SMS_DELIVERY_REPORT_ENABLED*: string {.`static`.}
  MMS_CONFIG_SUPPORT_MMS_CONTENT_DISPOSITION*: string {.`static`.}
  MMS_CONFIG_SEND_MULTIPART_SMS_AS_SEPARATE_MESSAGES*: string {.`static`.}
  MMS_CONFIG_MMS_READ_REPORT_ENABLED*: string {.`static`.}
  MMS_CONFIG_MMS_DELIVERY_REPORT_ENABLED*: string {.`static`.}
  MMS_CONFIG_MAX_MESSAGE_SIZE*: string {.`static`.}
  MMS_CONFIG_MAX_IMAGE_WIDTH*: string {.`static`.}
  MMS_CONFIG_MAX_IMAGE_HEIGHT*: string {.`static`.}
  MMS_CONFIG_RECIPIENT_LIMIT*: string {.`static`.}
  MMS_CONFIG_ALIAS_MIN_CHARS*: string {.`static`.}
  MMS_CONFIG_ALIAS_MAX_CHARS*: string {.`static`.}
  MMS_CONFIG_SMS_TO_MMS_TEXT_THRESHOLD*: string {.`static`.}
  MMS_CONFIG_SMS_TO_MMS_TEXT_LENGTH_THRESHOLD*: string {.`static`.}
  MMS_CONFIG_MESSAGE_TEXT_MAX_SIZE*: string {.`static`.}
  MMS_CONFIG_SUBJECT_MAX_LENGTH*: string {.`static`.}
  MMS_CONFIG_HTTP_SOCKET_TIMEOUT*: string {.`static`.}
  MMS_CONFIG_UA_PROF_TAG_NAME*: string {.`static`.}
  MMS_CONFIG_USER_AGENT*: string {.`static`.}
  MMS_CONFIG_UA_PROF_URL*: string {.`static`.}
  MMS_CONFIG_HTTP_PARAMS*: string {.`static`.}
  MMS_CONFIG_EMAIL_GATEWAY_NUMBER*: string {.`static`.}
  MMS_CONFIG_NAI_SUFFIX*: string {.`static`.}
  MMS_CONFIG_SHOW_CELL_BROADCAST_APP_LINKS*: string {.`static`.}
  MMS_CONFIG_SUPPORT_HTTP_CHARSET_HEADER*: string {.`static`.}
  MMS_CONFIG_CLOSE_CONNECTION*: string {.`static`.}
  SMS_MESSAGE_PRIORITY_NOT_SPECIFIED*: jint {.`static`.}
  SMS_MESSAGE_PERIOD_NOT_SPECIFIED*: jint {.`static`.}
  SMS_RP_CAUSE_UNALLOCATED_NUMBER*: jint {.`static`.}
  SMS_RP_CAUSE_OPERATOR_DETERMINED_BARRING*: jint {.`static`.}
  SMS_RP_CAUSE_CALL_BARRING*: jint {.`static`.}
  SMS_RP_CAUSE_RESERVED*: jint {.`static`.}
  SMS_RP_CAUSE_SHORT_MESSAGE_TRANSFER_REJECTED*: jint {.`static`.}
  SMS_RP_CAUSE_DESTINATION_OUT_OF_ORDER*: jint {.`static`.}
  SMS_RP_CAUSE_UNIDENTIFIED_SUBSCRIBER*: jint {.`static`.}
  SMS_RP_CAUSE_FACILITY_REJECTED*: jint {.`static`.}
  SMS_RP_CAUSE_UNKNOWN_SUBSCRIBER*: jint {.`static`.}
  SMS_RP_CAUSE_NETWORK_OUT_OF_ORDER*: jint {.`static`.}
  SMS_RP_CAUSE_TEMPORARY_FAILURE*: jint {.`static`.}
  SMS_RP_CAUSE_CONGESTION*: jint {.`static`.}
  SMS_RP_CAUSE_RESOURCES_UNAVAILABLE*: jint {.`static`.}
  SMS_RP_CAUSE_FACILITY_NOT_SUBSCRIBED*: jint {.`static`.}
  SMS_RP_CAUSE_FACILITY_NOT_IMPLEMENTED*: jint {.`static`.}
  SMS_RP_CAUSE_INVALID_MESSAGE_REFERENCE_VALUE*: jint {.`static`.}
  SMS_RP_CAUSE_SEMANTICALLY_INCORRECT_MESSAGE*: jint {.`static`.}
  SMS_RP_CAUSE_INVALID_MANDATORY_INFORMATION*: jint {.`static`.}
  SMS_RP_CAUSE_MESSAGE_TYPE_NON_EXISTENT*: jint {.`static`.}
  SMS_RP_CAUSE_MESSAGE_INCOMPATIBLE_WITH_PROTOCOL_STATE*: jint {.`static`.}
  SMS_RP_CAUSE_INFORMATION_ELEMENT_NON_EXISTENT*: jint {.`static`.}
  SMS_RP_CAUSE_PROTOCOL_ERROR*: jint {.`static`.}
  SMS_RP_CAUSE_INTERWORKING_UNSPECIFIED*: jint {.`static`.}
  PREMIUM_SMS_CONSENT_UNKNOWN*: jint {.`static`.}
  PREMIUM_SMS_CONSENT_ASK_USER*: jint {.`static`.}
  PREMIUM_SMS_CONSENT_NEVER_ALLOW*: jint {.`static`.}
  PREMIUM_SMS_CONSENT_ALWAYS_ALLOW*: jint {.`static`.}
  STATUS_ON_ICC_FREE*: jint {.`static`.}
  STATUS_ON_ICC_READ*: jint {.`static`.}
  STATUS_ON_ICC_UNREAD*: jint {.`static`.}
  STATUS_ON_ICC_SENT*: jint {.`static`.}
  STATUS_ON_ICC_UNSENT*: jint {.`static`.}
  RESULT_ERROR_NONE*: jint {.`static`.}
  RESULT_ERROR_GENERIC_FAILURE*: jint {.`static`.}
  RESULT_ERROR_RADIO_OFF*: jint {.`static`.}
  RESULT_ERROR_NULL_PDU*: jint {.`static`.}
  RESULT_ERROR_NO_SERVICE*: jint {.`static`.}
  RESULT_ERROR_LIMIT_EXCEEDED*: jint {.`static`.}
  RESULT_ERROR_FDN_CHECK_FAILURE*: jint {.`static`.}
  RESULT_ERROR_SHORT_CODE_NOT_ALLOWED*: jint {.`static`.}
  RESULT_ERROR_SHORT_CODE_NEVER_ALLOWED*: jint {.`static`.}
  RESULT_RADIO_NOT_AVAILABLE*: jint {.`static`.}
  RESULT_NETWORK_REJECT*: jint {.`static`.}
  RESULT_INVALID_ARGUMENTS*: jint {.`static`.}
  RESULT_INVALID_STATE*: jint {.`static`.}
  RESULT_NO_MEMORY*: jint {.`static`.}
  RESULT_INVALID_SMS_FORMAT*: jint {.`static`.}
  RESULT_SYSTEM_ERROR*: jint {.`static`.}
  RESULT_MODEM_ERROR*: jint {.`static`.}
  RESULT_NETWORK_ERROR*: jint {.`static`.}
  RESULT_ENCODING_ERROR*: jint {.`static`.}
  RESULT_INVALID_SMSC_ADDRESS*: jint {.`static`.}
  RESULT_OPERATION_NOT_ALLOWED*: jint {.`static`.}
  RESULT_INTERNAL_ERROR*: jint {.`static`.}
  RESULT_NO_RESOURCES*: jint {.`static`.}
  RESULT_CANCELLED*: jint {.`static`.}
  RESULT_REQUEST_NOT_SUPPORTED*: jint {.`static`.}
  RESULT_NO_BLUETOOTH_SERVICE*: jint {.`static`.}
  RESULT_INVALID_BLUETOOTH_ADDRESS*: jint {.`static`.}
  RESULT_BLUETOOTH_DISCONNECTED*: jint {.`static`.}
  RESULT_UNEXPECTED_EVENT_STOP_SENDING*: jint {.`static`.}
  RESULT_SMS_BLOCKED_DURING_EMERGENCY*: jint {.`static`.}
  RESULT_SMS_SEND_RETRY_FAILED*: jint {.`static`.}
  RESULT_REMOTE_EXCEPTION*: jint {.`static`.}
  RESULT_NO_DEFAULT_SMS_APP*: jint {.`static`.}
  RESULT_USER_NOT_ALLOWED*: jint {.`static`.}
  RESULT_RIL_RADIO_NOT_AVAILABLE*: jint {.`static`.}
  RESULT_RIL_SMS_SEND_FAIL_RETRY*: jint {.`static`.}
  RESULT_RIL_NETWORK_REJECT*: jint {.`static`.}
  RESULT_RIL_INVALID_STATE*: jint {.`static`.}
  RESULT_RIL_INVALID_ARGUMENTS*: jint {.`static`.}
  RESULT_RIL_NO_MEMORY*: jint {.`static`.}
  RESULT_RIL_REQUEST_RATE_LIMITED*: jint {.`static`.}
  RESULT_RIL_INVALID_SMS_FORMAT*: jint {.`static`.}
  RESULT_RIL_SYSTEM_ERR*: jint {.`static`.}
  RESULT_RIL_ENCODING_ERR*: jint {.`static`.}
  RESULT_RIL_INVALID_SMSC_ADDRESS*: jint {.`static`.}
  RESULT_RIL_MODEM_ERR*: jint {.`static`.}
  RESULT_RIL_NETWORK_ERR*: jint {.`static`.}
  RESULT_RIL_INTERNAL_ERR*: jint {.`static`.}
  RESULT_RIL_REQUEST_NOT_SUPPORTED*: jint {.`static`.}
  RESULT_RIL_INVALID_MODEM_STATE*: jint {.`static`.}
  RESULT_RIL_NETWORK_NOT_READY*: jint {.`static`.}
  RESULT_RIL_OPERATION_NOT_ALLOWED*: jint {.`static`.}
  RESULT_RIL_NO_RESOURCES*: jint {.`static`.}
  RESULT_RIL_CANCELLED*: jint {.`static`.}
  RESULT_RIL_SIM_ABSENT*: jint {.`static`.}
  RESULT_RIL_SIMULTANEOUS_SMS_AND_CALL_NOT_ALLOWED*: jint {.`static`.}
  RESULT_RIL_ACCESS_BARRED*: jint {.`static`.}
  RESULT_RIL_BLOCKED_DUE_TO_CALL*: jint {.`static`.}
  RESULT_RIL_GENERIC_ERROR*: jint {.`static`.}
  RESULT_RIL_INVALID_RESPONSE*: jint {.`static`.}
  RESULT_RIL_SIM_PIN2*: jint {.`static`.}
  RESULT_RIL_SIM_PUK2*: jint {.`static`.}
  RESULT_RIL_SUBSCRIPTION_NOT_AVAILABLE*: jint {.`static`.}
  RESULT_RIL_SIM_ERROR*: jint {.`static`.}
  RESULT_RIL_INVALID_SIM_STATE*: jint {.`static`.}
  RESULT_RIL_NO_SMS_TO_ACK*: jint {.`static`.}
  RESULT_RIL_SIM_BUSY*: jint {.`static`.}
  RESULT_RIL_SIM_FULL*: jint {.`static`.}
  RESULT_RIL_NO_SUBSCRIPTION*: jint {.`static`.}
  RESULT_RIL_NO_NETWORK_FOUND*: jint {.`static`.}
  RESULT_RIL_DEVICE_IN_USE*: jint {.`static`.}
  RESULT_RIL_ABORTED*: jint {.`static`.}
  RESULT_RECEIVE_DISPATCH_FAILURE*: jint {.`static`.}
  RESULT_RECEIVE_INJECTED_NULL_PDU*: jint {.`static`.}
  RESULT_RECEIVE_RUNTIME_EXCEPTION*: jint {.`static`.}
  RESULT_RECEIVE_NULL_MESSAGE_FROM_RIL*: jint {.`static`.}
  RESULT_RECEIVE_WHILE_ENCRYPTED*: jint {.`static`.}
  RESULT_RECEIVE_SQL_EXCEPTION*: jint {.`static`.}
  RESULT_RECEIVE_URI_EXCEPTION*: jint {.`static`.}
  MMS_ERROR_UNSPECIFIED*: jint {.`static`.}
  MMS_ERROR_INVALID_APN*: jint {.`static`.}
  MMS_ERROR_UNABLE_CONNECT_MMS*: jint {.`static`.}
  MMS_ERROR_HTTP_FAILURE*: jint {.`static`.}
  MMS_ERROR_IO_ERROR*: jint {.`static`.}
  MMS_ERROR_RETRY*: jint {.`static`.}
  MMS_ERROR_CONFIGURATION_ERROR*: jint {.`static`.}
  MMS_ERROR_NO_DATA_NETWORK*: jint {.`static`.}
  MMS_ERROR_INVALID_SUBSCRIPTION_ID*: jint {.`static`.}
  MMS_ERROR_INACTIVE_SUBSCRIPTION*: jint {.`static`.}
  MMS_ERROR_DATA_DISABLED*: jint {.`static`.}
  MMS_ERROR_MMS_DISABLED_BY_CARRIER*: jint {.`static`.}
  MMS_ERROR_TOO_LARGE_FOR_TRANSPORT*: jint {.`static`.}
  EXTRA_MMS_DATA*: string {.`static`.}
  EXTRA_MMS_HTTP_STATUS*: string {.`static`.}
  REGEX_PREFIX_DELIMITER*: string {.`static`.}
  RESULT_STATUS_SUCCESS*: jint {.`static`.}
  RESULT_STATUS_TIMEOUT*: jint {.`static`.}
  EXTRA_SMS_MESSAGE*: string {.`static`.}
  EXTRA_STATUS*: string {.`static`.}
  EXTRA_SIM_SUBSCRIPTION_ID*: string {.`static`.}
  SMS_CATEGORY_NOT_SHORT_CODE*: jint {.`static`.}
  SMS_CATEGORY_FREE_SHORT_CODE*: jint {.`static`.}
  SMS_CATEGORY_STANDARD_SHORT_CODE*: jint {.`static`.}
  SMS_CATEGORY_POSSIBLE_PREMIUM_SHORT_CODE*: jint {.`static`.}
  SMS_CATEGORY_PREMIUM_SHORT_CODE*: jint {.`static`.}

jclass android.telephony.SmsManager.FinancialSmsCallback* of JVMObject:
  proc onFinancialSmsMessages*(msgs: CursorWindow)

jclass android.telephony.FinancialSmsCallback* of JVMObject:
  proc onFinancialSmsMessages*(msgs: CursorWindow)

