import jnim

jclass android.provider.Telephony.Sms* of JVMObject:
  proc getDefaultSmsPackage*(context: Context): string {.`static`.}
  proc query*(cr: ContentResolver, projection: seq[string]): Cursor {.`static`.}
  proc query*(cr: ContentResolver, projection: seq[string], where: string, orderBy: string): Cursor {.`static`.}
  proc addMessageToUri*(resolver: ContentResolver, uri: Uri, address: string, body: string, subject: string, date: Long, read: jboolean, deliveryReport: jboolean): Uri {.`static`.}
  proc addMessageToUri*(subId: jint, resolver: ContentResolver, uri: Uri, address: string, body: string, subject: string, date: Long, read: jboolean, deliveryReport: jboolean): Uri {.`static`.}
  proc addMessageToUri*(resolver: ContentResolver, uri: Uri, address: string, body: string, subject: string, date: Long, read: jboolean, deliveryReport: jboolean, threadId: jlong): Uri {.`static`.}
  proc addMessageToUri*(subId: jint, resolver: ContentResolver, uri: Uri, address: string, body: string, subject: string, date: Long, read: jboolean, deliveryReport: jboolean, threadId: jlong): Uri {.`static`.}
  proc moveMessageToFolder*(context: Context, uri: Uri, folder: jint, error: jint): jboolean {.`static`.}
  proc isOutgoingFolder*(messageType: jint): jboolean {.`static`.}

jclass android.provider.Telephony.Threads* of JVMObject:
  proc getOrCreateThreadId*(context: Context, recipient: string): jlong {.`static`.}
  proc getOrCreateThreadId*(context: Context, recipients: Set[string]): jlong {.`static`.}

jclass android.provider.Telephony.Mms* of JVMObject:
  proc query*(cr: ContentResolver, projection: seq[string]): Cursor {.`static`.}
  proc query*(cr: ContentResolver, projection: seq[string], where: string, orderBy: string): Cursor {.`static`.}
  proc extractAddrSpec*(address: string): string {.`static`.}
  proc isEmailAddress*(address: string): jboolean {.`static`.}
  proc isPhoneNumber*(number: string): jboolean {.`static`.}

jclass android.provider.Telephony.ServiceStateTable* of JVMObject:
  proc getUriForSubscriptionIdAndField*(subscriptionId: jint, field: string): Uri {.`static`.}
  proc getUriForSubscriptionId*(subscriptionId: jint): Uri {.`static`.}

jclass android.provider.Telephony.CarrierId* of JVMObject:
  proc getUriForSubscriptionId*(subscriptionId: jint): Uri {.`static`.}
  proc getSpecificCarrierIdUriForSubscriptionId*(subscriptionId: jint): Uri {.`static`.}

jclass android.provider.Telephony.SimInfo* of JVMObject:
  proc getAllColumns*(): List[string] {.`static`.}

jclass android.provider.Telephony.SatelliteDatagrams* of JVMObject:
  proc getAllColumns*(): List[string] {.`static`.}

jclass android.provider.TextBasedSmsColumns* of JVMObject:
  MESSAGE_TYPE_ALL*: jint {.`static`.}
  MESSAGE_TYPE_INBOX*: jint {.`static`.}
  MESSAGE_TYPE_SENT*: jint {.`static`.}
  MESSAGE_TYPE_DRAFT*: jint {.`static`.}
  MESSAGE_TYPE_OUTBOX*: jint {.`static`.}
  MESSAGE_TYPE_FAILED*: jint {.`static`.}
  MESSAGE_TYPE_QUEUED*: jint {.`static`.}
  TYP*: string {.`static`.}
  THREAD_ID*: string {.`static`.}
  ADDRESS*: string {.`static`.}
  DATE*: string {.`static`.}
  DATE_SENT*: string {.`static`.}
  READ*: string {.`static`.}
  SEEN*: string {.`static`.}
  STATUS*: string {.`static`.}
  STATUS_NONE*: jint {.`static`.}
  STATUS_COMPLETE*: jint {.`static`.}
  STATUS_PENDING*: jint {.`static`.}
  STATUS_FAILED*: jint {.`static`.}
  SUBJECT*: string {.`static`.}
  BODY*: string {.`static`.}
  PERSON*: string {.`static`.}
  PROTOCOL*: string {.`static`.}
  REPLY_PATH_PRESENT*: string {.`static`.}
  SERVICE_CENTER*: string {.`static`.}
  LOCKED*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}
  MTU*: string {.`static`.}
  ERROR_CODE*: string {.`static`.}
  CREATOR*: string {.`static`.}

jclass android.provider.TextBasedSmsChangesColumns* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  ID*: string {.`static`.}
  ORIG_ROW_ID*: string {.`static`.}
  SUB_ID*: string {.`static`.}
  TYP*: string {.`static`.}
  TYPE_UPDATE*: jint {.`static`.}
  TYPE_DELETE*: jint {.`static`.}
  NEW_READ_STATUS*: string {.`static`.}

jclass android.provider.Sms* of JVMObject:
  proc getDefaultSmsPackage*(context: Context): string {.`static`.}
  proc query*(cr: ContentResolver, projection: seq[string]): Cursor {.`static`.}
  proc query*(cr: ContentResolver, projection: seq[string], where: string, orderBy: string): Cursor {.`static`.}
  proc addMessageToUri*(resolver: ContentResolver, uri: Uri, address: string, body: string, subject: string, date: Long, read: jboolean, deliveryReport: jboolean): Uri {.`static`.}
  proc addMessageToUri*(subId: jint, resolver: ContentResolver, uri: Uri, address: string, body: string, subject: string, date: Long, read: jboolean, deliveryReport: jboolean): Uri {.`static`.}
  proc addMessageToUri*(resolver: ContentResolver, uri: Uri, address: string, body: string, subject: string, date: Long, read: jboolean, deliveryReport: jboolean, threadId: jlong): Uri {.`static`.}
  proc addMessageToUri*(subId: jint, resolver: ContentResolver, uri: Uri, address: string, body: string, subject: string, date: Long, read: jboolean, deliveryReport: jboolean, threadId: jlong): Uri {.`static`.}
  proc moveMessageToFolder*(context: Context, uri: Uri, folder: jint, error: jint): jboolean {.`static`.}
  proc isOutgoingFolder*(messageType: jint): jboolean {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Sms.Inbox* of JVMObject:
  proc addMessage*(resolver: ContentResolver, address: string, body: string, subject: string, date: Long, read: jboolean): Uri {.`static`.}
  proc addMessage*(subId: jint, resolver: ContentResolver, address: string, body: string, subject: string, date: Long, read: jboolean): Uri {.`static`.}

jclass android.provider.Sms.Sent* of JVMObject:
  proc addMessage*(resolver: ContentResolver, address: string, body: string, subject: string, date: Long): Uri {.`static`.}
  proc addMessage*(subId: jint, resolver: ContentResolver, address: string, body: string, subject: string, date: Long): Uri {.`static`.}

jclass android.provider.Sms.Draft* of JVMObject:
  proc addMessage*(resolver: ContentResolver, address: string, body: string, subject: string, date: Long): Uri {.`static`.}
  proc addMessage*(subId: jint, resolver: ContentResolver, address: string, body: string, subject: string, date: Long): Uri {.`static`.}

jclass android.provider.Sms.Outbox* of JVMObject:
  proc addMessage*(resolver: ContentResolver, address: string, body: string, subject: string, date: Long, deliveryReport: jboolean, threadId: jlong): Uri {.`static`.}
  proc addMessage*(subId: jint, resolver: ContentResolver, address: string, body: string, subject: string, date: Long, deliveryReport: jboolean, threadId: jlong): Uri {.`static`.}

jclass android.provider.Sms.Intents* of JVMObject:
  proc getMessagesFromIntent*(intent: Intent): seq[SmsMessage] {.`static`.}

jclass android.provider.Inbox* of JVMObject:
  proc addMessage*(resolver: ContentResolver, address: string, body: string, subject: string, date: Long, read: jboolean): Uri {.`static`.}
  proc addMessage*(subId: jint, resolver: ContentResolver, address: string, body: string, subject: string, date: Long, read: jboolean): Uri {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Sent* of JVMObject:
  proc addMessage*(resolver: ContentResolver, address: string, body: string, subject: string, date: Long): Uri {.`static`.}
  proc addMessage*(subId: jint, resolver: ContentResolver, address: string, body: string, subject: string, date: Long): Uri {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Draft* of JVMObject:
  proc addMessage*(resolver: ContentResolver, address: string, body: string, subject: string, date: Long): Uri {.`static`.}
  proc addMessage*(subId: jint, resolver: ContentResolver, address: string, body: string, subject: string, date: Long): Uri {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Outbox* of JVMObject:
  proc addMessage*(resolver: ContentResolver, address: string, body: string, subject: string, date: Long, deliveryReport: jboolean, threadId: jlong): Uri {.`static`.}
  proc addMessage*(subId: jint, resolver: ContentResolver, address: string, body: string, subject: string, date: Long, deliveryReport: jboolean, threadId: jlong): Uri {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Conversations* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  SNIPPET*: string {.`static`.}
  MESSAGE_COUNT*: string {.`static`.}

jclass android.provider.Intents* of JVMObject:
  proc getMessagesFromIntent*(intent: Intent): seq[SmsMessage] {.`static`.}
  RESULT_SMS_HANDLED*: jint {.`static`.}
  RESULT_SMS_GENERIC_ERROR*: jint {.`static`.}
  RESULT_SMS_OUT_OF_MEMORY*: jint {.`static`.}
  RESULT_SMS_UNSUPPORTED*: jint {.`static`.}
  RESULT_SMS_DUPLICATED*: jint {.`static`.}
  RESULT_SMS_DISPATCH_FAILURE*: jint {.`static`.}
  RESULT_SMS_NULL_PDU*: jint {.`static`.}
  RESULT_SMS_NULL_MESSAGE*: jint {.`static`.}
  RESULT_SMS_RECEIVED_WHILE_ENCRYPTED*: jint {.`static`.}
  RESULT_SMS_DATABASE_ERROR*: jint {.`static`.}
  RESULT_SMS_INVALID_URI*: jint {.`static`.}
  ACTION_CHANGE_DEFAULT*: string {.`static`.}
  EXTRA_PACKAGE_NAME*: string {.`static`.}
  SMS_DELIVER_ACTION*: string {.`static`.}
  SMS_RECEIVED_ACTION*: string {.`static`.}
  DATA_SMS_RECEIVED_ACTION*: string {.`static`.}
  WAP_PUSH_DELIVER_ACTION*: string {.`static`.}
  WAP_PUSH_RECEIVED_ACTION*: string {.`static`.}
  SMS_CB_RECEIVED_ACTION*: string {.`static`.}
  SMS_CARRIER_PROVISION_ACTION*: string {.`static`.}
  ACTION_SMS_EMERGENCY_CB_RECEIVED*: string {.`static`.}
  SMS_SERVICE_CATEGORY_PROGRAM_DATA_RECEIVED_ACTION*: string {.`static`.}
  SIM_FULL_ACTION*: string {.`static`.}
  SMS_REJECTED_ACTION*: string {.`static`.}
  MMS_DOWNLOADED_ACTION*: string {.`static`.}
  SECRET_CODE_ACTION*: string {.`static`.}
  ACTION_DEFAULT_SMS_PACKAGE_CHANGED*: string {.`static`.}
  EXTRA_IS_DEFAULT_SMS_APP*: string {.`static`.}
  ACTION_EXTERNAL_PROVIDER_CHANGE*: string {.`static`.}
  ACTION_SMS_MMS_DB_CREATED*: string {.`static`.}
  EXTRA_IS_INITIAL_CREATE*: string {.`static`.}
  ACTION_SMS_MMS_DB_LOST*: string {.`static`.}
  EXTRA_IS_CORRUPTED*: string {.`static`.}

jclass android.provider.CarrierColumns* of BaseColumns:
  MCC*: string {.`static`.}
  MNC*: string {.`static`.}
  KEY_TYPE*: string {.`static`.}
  PUBLIC_KEY*: string {.`static`.}
  KEY_IDENTIFIER*: string {.`static`.}
  EXPIRATION_TIME*: string {.`static`.}
  LAST_MODIFIED*: string {.`static`.}
  CARRIER_ID*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.BaseMmsColumns* of BaseColumns:
  MESSAGE_BOX_ALL*: jint {.`static`.}
  MESSAGE_BOX_INBOX*: jint {.`static`.}
  MESSAGE_BOX_SENT*: jint {.`static`.}
  MESSAGE_BOX_DRAFTS*: jint {.`static`.}
  MESSAGE_BOX_OUTBOX*: jint {.`static`.}
  MESSAGE_BOX_FAILED*: jint {.`static`.}
  THREAD_ID*: string {.`static`.}
  DATE*: string {.`static`.}
  DATE_SENT*: string {.`static`.}
  MESSAGE_BOX*: string {.`static`.}
  READ*: string {.`static`.}
  SEEN*: string {.`static`.}
  TEXT_ONLY*: string {.`static`.}
  MESSAGE_ID*: string {.`static`.}
  SUBJECT*: string {.`static`.}
  SUBJECT_CHARSET*: string {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_LOCATION*: string {.`static`.}
  EXPIRY*: string {.`static`.}
  MESSAGE_CLASS*: string {.`static`.}
  MESSAGE_TYPE*: string {.`static`.}
  MMS_VERSION*: string {.`static`.}
  MESSAGE_SIZE*: string {.`static`.}
  PRIORITY*: string {.`static`.}
  READ_REPORT*: string {.`static`.}
  REPORT_ALLOWED*: string {.`static`.}
  RESPONSE_STATUS*: string {.`static`.}
  STATUS*: string {.`static`.}
  TRANSACTION_ID*: string {.`static`.}
  RETRIEVE_STATUS*: string {.`static`.}
  RETRIEVE_TEXT*: string {.`static`.}
  RETRIEVE_TEXT_CHARSET*: string {.`static`.}
  READ_STATUS*: string {.`static`.}
  CONTENT_CLASS*: string {.`static`.}
  DELIVERY_REPORT*: string {.`static`.}
  DELIVERY_TIME_TOKEN*: string {.`static`.}
  DELIVERY_TIME*: string {.`static`.}
  RESPONSE_TEXT*: string {.`static`.}
  SENDER_VISIBILITY*: string {.`static`.}
  REPLY_CHARGING*: string {.`static`.}
  REPLY_CHARGING_DEADLINE_TOKEN*: string {.`static`.}
  REPLY_CHARGING_DEADLINE*: string {.`static`.}
  REPLY_CHARGING_ID*: string {.`static`.}
  REPLY_CHARGING_SIZE*: string {.`static`.}
  PREVIOUSLY_SENT_BY*: string {.`static`.}
  PREVIOUSLY_SENT_DATE*: string {.`static`.}
  STORE*: string {.`static`.}
  MM_STATE*: string {.`static`.}
  MM_FLAGS_TOKEN*: string {.`static`.}
  MM_FLAGS*: string {.`static`.}
  STORE_STATUS*: string {.`static`.}
  STORE_STATUS_TEXT*: string {.`static`.}
  STORED*: string {.`static`.}
  TOTALS*: string {.`static`.}
  MBOX_TOTALS*: string {.`static`.}
  MBOX_TOTALS_TOKEN*: string {.`static`.}
  QUOTAS*: string {.`static`.}
  MBOX_QUOTAS*: string {.`static`.}
  MBOX_QUOTAS_TOKEN*: string {.`static`.}
  MESSAGE_COUNT*: string {.`static`.}
  START*: string {.`static`.}
  DISTRIBUTION_INDICATOR*: string {.`static`.}
  ELEMENT_DESCRIPTOR*: string {.`static`.}
  LIMIT*: string {.`static`.}
  RECOMMENDED_RETRIEVAL_MODE*: string {.`static`.}
  RECOMMENDED_RETRIEVAL_MODE_TEXT*: string {.`static`.}
  STATUS_TEXT*: string {.`static`.}
  APPLIC_ID*: string {.`static`.}
  REPLY_APPLIC_ID*: string {.`static`.}
  AUX_APPLIC_ID*: string {.`static`.}
  DRM_CONTENT*: string {.`static`.}
  ADAPTATION_ALLOWED*: string {.`static`.}
  REPLACE_ID*: string {.`static`.}
  CANCEL_ID*: string {.`static`.}
  CANCEL_STATUS*: string {.`static`.}
  LOCKED*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}
  CREATOR*: string {.`static`.}

jclass android.provider.CanonicalAddressesColumns* of BaseColumns:
  ADDRESS*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}

jclass android.provider.ThreadsColumns* of BaseColumns:
  DATE*: string {.`static`.}
  RECIPIENT_IDS*: string {.`static`.}
  MESSAGE_COUNT*: string {.`static`.}
  READ*: string {.`static`.}
  SNIPPET*: string {.`static`.}
  SNIPPET_CHARSET*: string {.`static`.}
  TYP*: string {.`static`.}
  ERROR*: string {.`static`.}
  HAS_ATTACHMENT*: string {.`static`.}
  ARCHIVED*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}

jclass android.provider.Threads* of JVMObject:
  proc getOrCreateThreadId*(context: Context, recipient: string): jlong {.`static`.}
  proc getOrCreateThreadId*(context: Context, recipients: Set[string]): jlong {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  OBSOLETE_THREADS_URI*: Uri {.`static`.}
  COMMON_THREAD*: jint {.`static`.}
  BROADCAST_THREAD*: jint {.`static`.}

jclass android.provider.Mms* of JVMObject:
  proc query*(cr: ContentResolver, projection: seq[string]): Cursor {.`static`.}
  proc query*(cr: ContentResolver, projection: seq[string], where: string, orderBy: string): Cursor {.`static`.}
  proc extractAddrSpec*(address: string): string {.`static`.}
  proc isEmailAddress*(address: string): jboolean {.`static`.}
  proc isPhoneNumber*(number: string): jboolean {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  REPORT_REQUEST_URI*: Uri {.`static`.}
  REPORT_STATUS_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  NAME_ADDR_EMAIL_PATTERN*: Pattern {.`static`.}

jclass android.provider.Mms.Addr* of JVMObject:
  proc getAddrUriForMessage*(messageId: string): Uri {.`static`.}

jclass android.provider.Mms.Part* of JVMObject:
  proc getPartUriForMessage*(messageId: string): Uri {.`static`.}

jclass android.provider.Inbox* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Sent* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Draft* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Outbox* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Addr* of JVMObject:
  proc getAddrUriForMessage*(messageId: string): Uri {.`static`.}
  MSG_ID*: string {.`static`.}
  CONTACT_ID*: string {.`static`.}
  ADDRESS*: string {.`static`.}
  TYP*: string {.`static`.}
  CHARSET*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}

jclass android.provider.Part* of JVMObject:
  proc getPartUriForMessage*(messageId: string): Uri {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  MSG_ID*: string {.`static`.}
  SEQ*: string {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  NAME*: string {.`static`.}
  CHARSET*: string {.`static`.}
  FILENAME*: string {.`static`.}
  CONTENT_DISPOSITION*: string {.`static`.}
  CONTENT_ID*: string {.`static`.}
  CONTENT_LOCATION*: string {.`static`.}
  CT_START*: string {.`static`.}
  CT_TYPE*: string {.`static`.}
  _DATA*: string {.`static`.}
  TEXT*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}

jclass android.provider.Rate* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  SENT_TIME*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}

jclass android.provider.Intents* of JVMObject:
  CONTENT_CHANGED_ACTION*: string {.`static`.}
  DELETED_CONTENTS*: string {.`static`.}

jclass android.provider.MmsSms* of JVMObject:
  TYPE_DISCRIMINATOR_COLUMN*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_CONVERSATIONS_URI*: Uri {.`static`.}
  CONTENT_FILTER_BYPHONE_URI*: Uri {.`static`.}
  CONTENT_UNDELIVERED_URI*: Uri {.`static`.}
  CONTENT_DRAFT_URI*: Uri {.`static`.}
  CONTENT_LOCKED_URI*: Uri {.`static`.}
  SEARCH_URI*: Uri {.`static`.}
  SMS_PROTO*: jint {.`static`.}
  MMS_PROTO*: jint {.`static`.}
  NO_ERROR*: jint {.`static`.}
  ERR_TYPE_GENERIC*: jint {.`static`.}
  ERR_TYPE_SMS_PROTO_TRANSIENT*: jint {.`static`.}
  ERR_TYPE_MMS_PROTO_TRANSIENT*: jint {.`static`.}
  ERR_TYPE_TRANSPORT_FAILURE*: jint {.`static`.}
  ERR_TYPE_GENERIC_PERMANENT*: jint {.`static`.}
  ERR_TYPE_SMS_PROTO_PERMANENT*: jint {.`static`.}
  ERR_TYPE_MMS_PROTO_PERMANENT*: jint {.`static`.}

jclass android.provider.PendingMessages* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  PROTO_TYPE*: string {.`static`.}
  MSG_ID*: string {.`static`.}
  MSG_TYPE*: string {.`static`.}
  ERROR_TYPE*: string {.`static`.}
  ERROR_CODE*: string {.`static`.}
  RETRY_INDEX*: string {.`static`.}
  DUE_TIME*: string {.`static`.}
  LAST_TRY*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}

jclass android.provider.WordsTable* of JVMObject:
  ID*: string {.`static`.}
  SOURCE_ROW_ID*: string {.`static`.}
  TABLE_ID*: string {.`static`.}
  INDEXED_TEXT*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}

jclass android.provider.Carriers* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  SIM_APN_URI*: Uri {.`static`.}
  DPC_URI*: Uri {.`static`.}
  FILTERED_URI*: Uri {.`static`.}
  ENFORCE_MANAGED_URI*: Uri {.`static`.}
  PREFERRED_APN_URI*: Uri {.`static`.}
  PREFERRED_APN_SET_URI*: Uri {.`static`.}
  APN_ID*: string {.`static`.}
  ENFORCE_KEY*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  NAME*: string {.`static`.}
  APN*: string {.`static`.}
  PROXY*: string {.`static`.}
  PORT*: string {.`static`.}
  MMSPROXY*: string {.`static`.}
  MMSPORT*: string {.`static`.}
  SERVER*: string {.`static`.}
  USER*: string {.`static`.}
  PASSWORD*: string {.`static`.}
  MMSC*: string {.`static`.}
  MCC*: string {.`static`.}
  MNC*: string {.`static`.}
  NUMERIC*: string {.`static`.}
  AUTH_TYPE*: string {.`static`.}
  TYP*: string {.`static`.}
  PROTOCOL*: string {.`static`.}
  ROAMING_PROTOCOL*: string {.`static`.}
  CURRENT*: string {.`static`.}
  CARRIER_ENABLED*: string {.`static`.}
  BEARER*: string {.`static`.}
  BEARER_BITMASK*: string {.`static`.}
  NETWORK_TYPE_BITMASK*: string {.`static`.}
  LINGERING_NETWORK_TYPE_BITMASK*: string {.`static`.}
  ALWAYS_ON*: string {.`static`.}
  INFRASTRUCTURE_BITMASK*: string {.`static`.}
  ESIM_BOOTSTRAP_PROVISIONING*: string {.`static`.}
  MVNO_TYPE*: string {.`static`.}
  MVNO_MATCH_DATA*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}
  PROFILE_ID*: string {.`static`.}
  MODEM_PERSIST*: string {.`static`.}
  MAX_CONNECTIONS*: string {.`static`.}
  WAIT_TIME_RETRY*: string {.`static`.}
  TIME_LIMIT_FOR_MAX_CONNECTIONS*: string {.`static`.}
  MTU*: string {.`static`.}
  MTU_V4*: string {.`static`.}
  MTU_V6*: string {.`static`.}
  EDITED_STATUS*: string {.`static`.}
  USER_VISIBLE*: string {.`static`.}
  USER_EDITABLE*: string {.`static`.}
  INVALID_APN_ID*: jint {.`static`.}
  UNEDITED*: jint {.`static`.}
  USER_EDITED*: jint {.`static`.}
  USER_DELETED*: jint {.`static`.}
  USER_DELETED_BUT_PRESENT_IN_XML*: jint {.`static`.}
  CARRIER_EDITED*: jint {.`static`.}
  CARRIER_DELETED*: jint {.`static`.}
  CARRIER_DELETED_BUT_PRESENT_IN_XML*: jint {.`static`.}
  OWNED_BY*: string {.`static`.}
  OWNED_BY_DPC*: jint {.`static`.}
  OWNED_BY_OTHERS*: jint {.`static`.}
  APN_SET_ID*: string {.`static`.}
  NO_APN_SET_ID*: jint {.`static`.}
  MATCH_ALL_APN_SET_ID*: jint {.`static`.}
  CARRIER_ID*: string {.`static`.}
  SKIP_464XLAT*: string {.`static`.}
  SKIP_464XLAT_DEFAULT*: jint {.`static`.}
  SKIP_464XLAT_DISABLE*: jint {.`static`.}
  SKIP_464XLAT_ENABLE*: jint {.`static`.}
  APN_READING_PERMISSION_CHANGE_ID*: jlong {.`static`.}

jclass android.provider.CellBroadcasts* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  MESSAGE_HISTORY_URI*: Uri {.`static`.}
  AUTHORITY_LEGACY*: string {.`static`.}
  AUTHORITY_LEGACY_URI*: Uri {.`static`.}
  CALL_METHOD_GET_PREFERENCE*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}
  SLOT_INDEX*: string {.`static`.}
  GEOGRAPHICAL_SCOPE*: string {.`static`.}
  SERIAL_NUMBER*: string {.`static`.}
  PLMN*: string {.`static`.}
  LAC*: string {.`static`.}
  CID*: string {.`static`.}
  SERVICE_CATEGORY*: string {.`static`.}
  LANGUAGE_CODE*: string {.`static`.}
  DATA_CODING_SCHEME*: string {.`static`.}
  MESSAGE_BODY*: string {.`static`.}
  DELIVERY_TIME*: string {.`static`.}
  MESSAGE_READ*: string {.`static`.}
  MESSAGE_FORMAT*: string {.`static`.}
  MESSAGE_PRIORITY*: string {.`static`.}
  ETWS_WARNING_TYPE*: string {.`static`.}
  ETWS_IS_PRIMARY*: string {.`static`.}
  CMAS_MESSAGE_CLASS*: string {.`static`.}
  CMAS_CATEGORY*: string {.`static`.}
  CMAS_RESPONSE_TYPE*: string {.`static`.}
  CMAS_SEVERITY*: string {.`static`.}
  CMAS_URGENCY*: string {.`static`.}
  CMAS_CERTAINTY*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  RECEIVED_TIME*: string {.`static`.}
  LOCATION_CHECK_TIME*: string {.`static`.}
  MESSAGE_BROADCASTED*: string {.`static`.}
  MESSAGE_DISPLAYED*: string {.`static`.}
  GEOMETRIES*: string {.`static`.}
  MAXIMUM_WAIT_TIME*: string {.`static`.}
  QUERY_COLUMNS*: string {.`static`.}

jclass android.provider.Preference* of JVMObject:
  ENABLE_AREA_UPDATE_INFO_PREF*: string {.`static`.}
  ENABLE_TEST_ALERT_PREF*: string {.`static`.}
  ENABLE_STATE_LOCAL_TEST_PREF*: string {.`static`.}
  ENABLE_PUBLIC_SAFETY_PREF*: string {.`static`.}
  ENABLE_CMAS_AMBER_PREF*: string {.`static`.}
  ENABLE_CMAS_SEVERE_THREAT_PREF*: string {.`static`.}
  ENABLE_CMAS_EXTREME_THREAT_PREF*: string {.`static`.}
  ENABLE_CMAS_PRESIDENTIAL_PREF*: string {.`static`.}
  ENABLE_ALERT_VIBRATION_PREF*: string {.`static`.}
  ENABLE_EMERGENCY_PERF*: string {.`static`.}
  ENABLE_CMAS_IN_SECOND_LANGUAGE_PREF*: string {.`static`.}

jclass android.provider.ServiceStateTable* of JVMObject:
  proc getUriForSubscriptionIdAndField*(subscriptionId: jint, field: string): Uri {.`static`.}
  proc getUriForSubscriptionId*(subscriptionId: jint): Uri {.`static`.}
  AUTHORITY*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  VOICE_REG_STATE*: string {.`static`.}
  DATA_REG_STATE*: string {.`static`.}
  VOICE_OPERATOR_NUMERIC*: string {.`static`.}
  IS_MANUAL_NETWORK_SELECTION*: string {.`static`.}
  DATA_NETWORK_TYPE*: string {.`static`.}
  DUPLEX_MODE*: string {.`static`.}

jclass android.provider.CarrierId* of JVMObject:
  proc getUriForSubscriptionId*(subscriptionId: jint): Uri {.`static`.}
  proc getSpecificCarrierIdUriForSubscriptionId*(subscriptionId: jint): Uri {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  AUTHORITY*: string {.`static`.}
  CARRIER_NAME*: string {.`static`.}
  CARRIER_ID*: string {.`static`.}
  SPECIFIC_CARRIER_ID*: string {.`static`.}
  SPECIFIC_CARRIER_ID_NAME*: string {.`static`.}
  PARENT_CARRIER_ID*: string {.`static`.}

jclass android.provider.All* of JVMObject:
  MCCMNC*: string {.`static`.}
  GID1*: string {.`static`.}
  GID2*: string {.`static`.}
  PLMN*: string {.`static`.}
  IMSI_PREFIX_XPATTERN*: string {.`static`.}
  SPN*: string {.`static`.}
  APN*: string {.`static`.}
  ICCID_PREFIX*: string {.`static`.}
  PRIVILEGE_ACCESS_RULE*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.SimInfo* of JVMObject:
  proc getAllColumns*(): List[string] {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  COLUMN_UNIQUE_KEY_SUBSCRIPTION_ID*: string {.`static`.}
  COLUMN_ICC_ID*: string {.`static`.}
  COLUMN_SIM_SLOT_INDEX*: string {.`static`.}
  SIM_NOT_INSERTED*: jint {.`static`.}
  COLUMN_SUBSCRIPTION_TYPE*: string {.`static`.}
  SUBSCRIPTION_TYPE_LOCAL_SIM*: jint {.`static`.}
  SUBSCRIPTION_TYPE_REMOTE_SIM*: jint {.`static`.}
  COLUMN_DATA_ENABLED_OVERRIDE_RULES*: string {.`static`.}
  COLUMN_ENABLED_MOBILE_DATA_POLICIES*: string {.`static`.}
  COLUMN_DISPLAY_NAME*: string {.`static`.}
  COLUMN_CARRIER_NAME*: string {.`static`.}
  COLUMN_NAME_SOURCE*: string {.`static`.}
  NAME_SOURCE_UNKNOWN*: jint {.`static`.}
  NAME_SOURCE_CARRIER_ID*: jint {.`static`.}
  NAME_SOURCE_SIM_SPN*: jint {.`static`.}
  NAME_SOURCE_USER_INPUT*: jint {.`static`.}
  NAME_SOURCE_CARRIER*: jint {.`static`.}
  NAME_SOURCE_SIM_PNN*: jint {.`static`.}
  COLUMN_COLOR*: string {.`static`.}
  COLOR_DEFAULT*: jint {.`static`.}
  COLUMN_NUMBER*: string {.`static`.}
  COLUMN_DISPLAY_NUMBER_FORMAT*: string {.`static`.}
  DISPLAY_NUMBER_DEFAULT*: jint {.`static`.}
  COLUMN_DATA_ROAMING*: string {.`static`.}
  DATA_ROAMING_ENABLE*: jint {.`static`.}
  DATA_ROAMING_DISABLE*: jint {.`static`.}
  COLUMN_CARRIER_ID*: string {.`static`.}
  COLUMN_EHPLMNS*: string {.`static`.}
  COLUMN_HPLMNS*: string {.`static`.}
  COLUMN_MCC_STRING*: string {.`static`.}
  COLUMN_MNC_STRING*: string {.`static`.}
  COLUMN_MCC*: string {.`static`.}
  COLUMN_MNC*: string {.`static`.}
  COLUMN_ISO_COUNTRY_CODE*: string {.`static`.}
  COLUMN_SIM_PROVISIONING_STATUS*: string {.`static`.}
  SIM_PROVISIONED*: jint {.`static`.}
  COLUMN_IS_EMBEDDED*: string {.`static`.}
  COLUMN_CARD_ID*: string {.`static`.}
  COLUMN_ACCESS_RULES*: string {.`static`.}
  COLUMN_ACCESS_RULES_FROM_CARRIER_CONFIGS*: string {.`static`.}
  COLUMN_IS_REMOVABLE*: string {.`static`.}
  COLUMN_CB_EXTREME_THREAT_ALERT*: string {.`static`.}
  COLUMN_CB_SEVERE_THREAT_ALERT*: string {.`static`.}
  COLUMN_CB_AMBER_ALERT*: string {.`static`.}
  COLUMN_CB_EMERGENCY_ALERT*: string {.`static`.}
  COLUMN_CB_ALERT_SOUND_DURATION*: string {.`static`.}
  COLUMN_CB_ALERT_REMINDER_INTERVAL*: string {.`static`.}
  COLUMN_CB_ALERT_VIBRATE*: string {.`static`.}
  COLUMN_CB_ALERT_SPEECH*: string {.`static`.}
  COLUMN_CB_ETWS_TEST_ALERT*: string {.`static`.}
  COLUMN_CB_CHANNEL_50_ALERT*: string {.`static`.}
  COLUMN_CB_CMAS_TEST_ALERT*: string {.`static`.}
  COLUMN_CB_OPT_OUT_DIALOG*: string {.`static`.}
  COLUMN_ENHANCED_4G_MODE_ENABLED*: string {.`static`.}
  COLUMN_VT_IMS_ENABLED*: string {.`static`.}
  COLUMN_WFC_IMS_ENABLED*: string {.`static`.}
  COLUMN_WFC_IMS_MODE*: string {.`static`.}
  COLUMN_WFC_IMS_ROAMING_MODE*: string {.`static`.}
  COLUMN_WFC_IMS_ROAMING_ENABLED*: string {.`static`.}
  COLUMN_IMS_RCS_UCE_ENABLED*: string {.`static`.}
  COLUMN_CROSS_SIM_CALLING_ENABLED*: string {.`static`.}
  COLUMN_IS_OPPORTUNISTIC*: string {.`static`.}
  COLUMN_GROUP_UUID*: string {.`static`.}
  COLUMN_GROUP_OWNER*: string {.`static`.}
  COLUMN_IS_METERED*: string {.`static`.}
  COLUMN_PROFILE_CLASS*: string {.`static`.}
  COLUMN_PORT_INDEX*: string {.`static`.}
  PROFILE_CLASS_TESTING*: jint {.`static`.}
  PROFILE_CLASS_PROVISIONING*: jint {.`static`.}
  PROFILE_CLASS_OPERATIONAL*: jint {.`static`.}
  PROFILE_CLASS_UNSET*: jint {.`static`.}
  COLUMN_IMSI*: string {.`static`.}
  COLUMN_UICC_APPLICATIONS_ENABLED*: string {.`static`.}
  COLUMN_ALLOWED_NETWORK_TYPES*: string {.`static`.}
  COLUMN_ALLOWED_NETWORK_TYPES_FOR_REASONS*: string {.`static`.}
  COLUMN_RCS_CONFIG*: string {.`static`.}
  COLUMN_D2D_STATUS_SHARING*: string {.`static`.}
  COLUMN_VOIMS_OPT_IN_STATUS*: string {.`static`.}
  COLUMN_D2D_STATUS_SHARING_SELECTED_CONTACTS*: string {.`static`.}
  COLUMN_NR_ADVANCED_CALLING_ENABLED*: string {.`static`.}
  COLUMN_PHONE_NUMBER_SOURCE_CARRIER*: string {.`static`.}
  COLUMN_PHONE_NUMBER_SOURCE_IMS*: string {.`static`.}
  COLUMN_TP_MESSAGE_REF*: string {.`static`.}
  COLUMN_USAGE_SETTING*: string {.`static`.}
  COLUMN_USER_HANDLE*: string {.`static`.}
  COLUMN_SATELLITE_ENABLED*: string {.`static`.}
  COLUMN_SATELLITE_ATTACH_ENABLED_FOR_CARRIER*: string {.`static`.}
  COLUMN_IS_ONLY_NTN*: string {.`static`.}
  COLUMN_TRANSFER_STATUS*: string {.`static`.}
  COLUMN_SERVICE_CAPABILITIES*: string {.`static`.}
  COLUMN_SATELLITE_ENTITLEMENT_STATUS*: string {.`static`.}
  COLUMN_SATELLITE_ENTITLEMENT_PLMNS*: string {.`static`.}
  COLUMN_SATELLITE_ESOS_SUPPORTED*: string {.`static`.}
  COLUMN_IS_SATELLITE_PROVISIONED_FOR_NON_IP_DATAGRAM*: string {.`static`.}
  COLUMN_SATELLITE_ENTITLEMENT_BARRED_PLMNS*: string {.`static`.}
  COLUMN_SATELLITE_ENTITLEMENT_DATA_PLAN_PLMNS*: string {.`static`.}
  COLUMN_SATELLITE_ENTITLEMENT_SERVICE_TYPE_MAP*: string {.`static`.}
  COLUMN_SATELLITE_ENTITLEMENT_DATA_SERVICE_POLICY*: string {.`static`.}
  COLUMN_SATELLITE_ENTITLEMENT_VOICE_SERVICE_POLICY*: string {.`static`.}

jclass android.provider.SatelliteDatagrams* of JVMObject:
  proc getAllColumns*(): List[string] {.`static`.}
  PROVIDER_NAME*: string {.`static`.}
  TABLE_NAME*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  COLUMN_UNIQUE_KEY_DATAGRAM_ID*: string {.`static`.}
  COLUMN_DATAGRAM*: string {.`static`.}

