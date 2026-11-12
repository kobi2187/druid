import jnim

jclass android.provider.SimPhonebookContract* of JVMObject:
  proc getEfUriPath*(efType: jint): string {.`static`.}
  AUTHORITY*: string {.`static`.}
  AUTHORITY_URI*: Uri {.`static`.}
  SUBSCRIPTION_ID_PATH_SEGMENT*: string {.`static`.}

jclass android.provider.SimPhonebookContract.SimRecords* of JVMObject:
  proc getContentUri*(subscriptionId: jint, efType: jint): Uri {.`static`.}
  proc getItemUri*(subscriptionId: jint, efType: jint, recordNumber: jint): Uri {.`static`.}
  proc getEncodedNameLength*(resolver: ContentResolver, name: string): jint {.`static`.}

jclass android.provider.SimPhonebookContract.ElementaryFiles* of JVMObject:
  proc getItemUri*(subscriptionId: jint, efType: jint): Uri {.`static`.}

jclass android.provider.SimRecords* of JVMObject:
  proc getContentUri*(subscriptionId: jint, efType: jint): Uri {.`static`.}
  proc getItemUri*(subscriptionId: jint, efType: jint, recordNumber: jint): Uri {.`static`.}
  proc getEncodedNameLength*(resolver: ContentResolver, name: string): jint {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}
  ELEMENTARY_FILE_TYPE*: string {.`static`.}
  RECORD_NUMBER*: string {.`static`.}
  NAME*: string {.`static`.}
  PHONE_NUMBER*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  ERROR_NAME_UNSUPPORTED*: jint {.`static`.}
  GET_ENCODED_NAME_LENGTH_METHOD_NAME*: string {.`static`.}
  EXTRA_ENCODED_NAME_LENGTH*: string {.`static`.}
  QUERY_ARG_PIN2*: string {.`static`.}

jclass android.provider.ElementaryFiles* of JVMObject:
  proc getItemUri*(subscriptionId: jint, efType: jint): Uri {.`static`.}
  SLOT_INDEX*: string {.`static`.}
  SUBSCRIPTION_ID*: string {.`static`.}
  EF_TYPE*: string {.`static`.}
  MAX_RECORDS*: string {.`static`.}
  RECORD_COUNT*: string {.`static`.}
  NAME_MAX_LENGTH*: string {.`static`.}
  PHONE_NUMBER_MAX_LENGTH*: string {.`static`.}
  EF_UNKNOWN*: jint {.`static`.}
  EF_ADN*: jint {.`static`.}
  EF_FDN*: jint {.`static`.}
  EF_SDN*: jint {.`static`.}
  PATH_SEGMENT_EF_ADN*: string {.`static`.}
  PATH_SEGMENT_EF_FDN*: string {.`static`.}
  PATH_SEGMENT_EF_SDN*: string {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  ELEMENTARY_FILES_PATH_SEGMENT*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

