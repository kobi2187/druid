import jnim

jclass android.provider.Downloads* of JVMObject:
  proc removeAllDownloadsByPackage*(context: Context, notification_package: string, notification_class: string) {.`static`.}
  CALL_MEDIASTORE_DOWNLOADS_DELETED*: string {.`static`.}
  CALL_CREATE_EXTERNAL_PUBLIC_DIR*: string {.`static`.}
  CALL_REVOKE_MEDIASTORE_URI_PERMS*: string {.`static`.}
  EXTRA_IDS*: string {.`static`.}
  EXTRA_MIME_TYPES*: string {.`static`.}
  DIR_TYPE*: string {.`static`.}

jclass android.provider.Downloads.Impl* of JVMObject:
  proc isStatusInformational*(status: jint): jboolean {.`static`.}
  proc isStatusSuccess*(status: jint): jboolean {.`static`.}
  proc isStatusError*(status: jint): jboolean {.`static`.}
  proc isStatusClientError*(status: jint): jboolean {.`static`.}
  proc isStatusServerError*(status: jint): jboolean {.`static`.}
  proc isNotificationToBeDisplayed*(visibility: jint): jboolean {.`static`.}
  proc isStatusCompleted*(status: jint): jboolean {.`static`.}
  proc statusToString*(status: jint): string {.`static`.}

jclass android.provider.Impl* of JVMObject:
  proc isStatusInformational*(status: jint): jboolean {.`static`.}
  proc isStatusSuccess*(status: jint): jboolean {.`static`.}
  proc isStatusError*(status: jint): jboolean {.`static`.}
  proc isStatusClientError*(status: jint): jboolean {.`static`.}
  proc isStatusServerError*(status: jint): jboolean {.`static`.}
  proc isNotificationToBeDisplayed*(visibility: jint): jboolean {.`static`.}
  proc isStatusCompleted*(status: jint): jboolean {.`static`.}
  proc statusToString*(status: jint): string {.`static`.}
  AUTHORITY*: string {.`static`.}
  PERMISSION_ACCESS*: string {.`static`.}
  PERMISSION_ACCESS_ADVANCED*: string {.`static`.}
  PERMISSION_ACCESS_ALL*: string {.`static`.}
  PERMISSION_CACHE*: string {.`static`.}
  PERMISSION_SEND_INTENTS*: string {.`static`.}
  PERMISSION_CACHE_NON_PURGEABLE*: string {.`static`.}
  PERMISSION_NO_NOTIFICATION*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  ALL_DOWNLOADS_CONTENT_URI*: Uri {.`static`.}
  PUBLICLY_ACCESSIBLE_DOWNLOADS_URI_SEGMENT*: string {.`static`.}
  PUBLICLY_ACCESSIBLE_DOWNLOADS_URI*: Uri {.`static`.}
  ACTION_DOWNLOAD_COMPLETED*: string {.`static`.}
  ACTION_NOTIFICATION_CLICKED*: string {.`static`.}
  COLUMN_URI*: string {.`static`.}
  COLUMN_APP_DATA*: string {.`static`.}
  COLUMN_NO_INTEGRITY*: string {.`static`.}
  COLUMN_FILE_NAME_HINT*: string {.`static`.}
  _DATA*: string {.`static`.}
  COLUMN_MIME_TYPE*: string {.`static`.}
  COLUMN_DESTINATION*: string {.`static`.}
  COLUMN_VISIBILITY*: string {.`static`.}
  COLUMN_CONTROL*: string {.`static`.}
  COLUMN_STATUS*: string {.`static`.}
  COLUMN_LAST_MODIFICATION*: string {.`static`.}
  COLUMN_NOTIFICATION_PACKAGE*: string {.`static`.}
  COLUMN_NOTIFICATION_CLASS*: string {.`static`.}
  COLUMN_NOTIFICATION_EXTRAS*: string {.`static`.}
  COLUMN_COOKIE_DATA*: string {.`static`.}
  COLUMN_USER_AGENT*: string {.`static`.}
  COLUMN_REFERER*: string {.`static`.}
  COLUMN_TOTAL_BYTES*: string {.`static`.}
  COLUMN_CURRENT_BYTES*: string {.`static`.}
  COLUMN_OTHER_UID*: string {.`static`.}
  COLUMN_TITLE*: string {.`static`.}
  COLUMN_DESCRIPTION*: string {.`static`.}
  COLUMN_IS_PUBLIC_API*: string {.`static`.}
  COLUMN_ALLOWED_NETWORK_TYPES*: string {.`static`.}
  COLUMN_ALLOW_ROAMING*: string {.`static`.}
  COLUMN_ALLOW_METERED*: string {.`static`.}
  COLUMN_IS_VISIBLE_IN_DOWNLOADS_UI*: string {.`static`.}
  COLUMN_BYPASS_RECOMMENDED_SIZE_LIMIT*: string {.`static`.}
  COLUMN_DELETED*: string {.`static`.}
  COLUMN_MEDIAPROVIDER_URI*: string {.`static`.}
  COLUMN_MEDIASTORE_URI*: string {.`static`.}
  COLUMN_MEDIA_SCANNED*: string {.`static`.}
  MEDIA_NOT_SCANNED*: jint {.`static`.}
  MEDIA_SCANNED*: jint {.`static`.}
  MEDIA_NOT_SCANNABLE*: jint {.`static`.}
  COLUMN_ERROR_MSG*: string {.`static`.}
  COLUMN_LAST_UPDATESRC*: string {.`static`.}
  COLUMN_FAILED_CONNECTIONS*: string {.`static`.}
  COLUMN_ALLOW_WRITE*: string {.`static`.}
  FLAG_REQUIRES_CHARGING*: jint {.`static`.}
  FLAG_REQUIRES_DEVICE_IDLE*: jint {.`static`.}
  COLUMN_FLAGS*: string {.`static`.}
  LAST_UPDATESRC_NOT_RELEVANT*: jint {.`static`.}
  LAST_UPDATESRC_DONT_NOTIFY_DOWNLOADSVC*: jint {.`static`.}
  DESTINATION_EXTERNAL*: jint {.`static`.}
  DESTINATION_CACHE_PARTITION*: jint {.`static`.}
  DESTINATION_CACHE_PARTITION_PURGEABLE*: jint {.`static`.}
  DESTINATION_CACHE_PARTITION_NOROAMING*: jint {.`static`.}
  DESTINATION_FILE_URI*: jint {.`static`.}
  DESTINATION_SYSTEMCACHE_PARTITION*: jint {.`static`.}
  DESTINATION_NON_DOWNLOADMANAGER_DOWNLOAD*: jint {.`static`.}
  CONTROL_RUN*: jint {.`static`.}
  CONTROL_PAUSED*: jint {.`static`.}
  STATUS_PENDING*: jint {.`static`.}
  STATUS_RUNNING*: jint {.`static`.}
  STATUS_PAUSED_BY_APP*: jint {.`static`.}
  STATUS_WAITING_TO_RETRY*: jint {.`static`.}
  STATUS_WAITING_FOR_NETWORK*: jint {.`static`.}
  STATUS_QUEUED_FOR_WIFI*: jint {.`static`.}
  STATUS_INSUFFICIENT_SPACE_ERROR*: jint {.`static`.}
  STATUS_DEVICE_NOT_FOUND_ERROR*: jint {.`static`.}
  STATUS_SUCCESS*: jint {.`static`.}
  STATUS_BAD_REQUEST*: jint {.`static`.}
  STATUS_NOT_ACCEPTABLE*: jint {.`static`.}
  STATUS_LENGTH_REQUIRED*: jint {.`static`.}
  STATUS_PRECONDITION_FAILED*: jint {.`static`.}
  MIN_ARTIFICIAL_ERROR_STATUS*: jint {.`static`.}
  STATUS_FILE_ALREADY_EXISTS_ERROR*: jint {.`static`.}
  STATUS_CANNOT_RESUME*: jint {.`static`.}
  STATUS_CANCELED*: jint {.`static`.}
  STATUS_UNKNOWN_ERROR*: jint {.`static`.}
  STATUS_FILE_ERROR*: jint {.`static`.}
  STATUS_UNHANDLED_REDIRECT*: jint {.`static`.}
  STATUS_UNHANDLED_HTTP_CODE*: jint {.`static`.}
  STATUS_HTTP_DATA_ERROR*: jint {.`static`.}
  STATUS_HTTP_EXCEPTION*: jint {.`static`.}
  STATUS_TOO_MANY_REDIRECTS*: jint {.`static`.}
  STATUS_BLOCKED*: jint {.`static`.}
  VISIBILITY_VISIBLE*: jint {.`static`.}
  VISIBILITY_VISIBLE_NOTIFY_COMPLETED*: jint {.`static`.}
  VISIBILITY_HIDDEN*: jint {.`static`.}

jclass android.provider.RequestHeaders* of JVMObject:
  HEADERS_DB_TABLE*: string {.`static`.}
  COLUMN_DOWNLOAD_ID*: string {.`static`.}
  COLUMN_HEADER*: string {.`static`.}
  COLUMN_VALUE*: string {.`static`.}
  URI_SEGMENT*: string {.`static`.}
  INSERT_KEY_PREFIX*: string {.`static`.}

