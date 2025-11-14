import jnim

jclass android.app.DownloadManager* of JVMObject:
  proc setAccessAllDownloads*(accessAllDownloads: jboolean)
  proc setAccessFilename*(accessFilename: jboolean)
  proc onMediaStoreDownloadsDeleted*(idToMime: LongSparseArray[string])
  proc enqueue*(request: Request): jlong
  proc markRowDeleted*(ids: jlong): jint
  proc remove*(ids: jlong): jint
  proc query*(query: Query): Cursor
  proc query*(query: Query, projection: seq[string]): Cursor
  proc openDownloadedFile*(id: jlong): ParcelFileDescriptor
  proc getUriForDownloadedFile*(id: jlong): Uri
  proc getMimeTypeForDownloadedFile*(id: jlong): string
  proc restartDownload*(ids: jlong)
  proc forceDownload*(ids: jlong)
  proc getMaxBytesOverMobile*(context: Context): Long {.`static`.}
  proc rename*(context: Context, id: jlong, displayName: string): jboolean
  proc getRecommendedMaxBytesOverMobile*(context: Context): Long {.`static`.}
  proc isActiveNetworkExpensive*(context: Context): jboolean {.`static`.}
  proc getActiveNetworkWarningBytes*(context: Context): jlong {.`static`.}
  proc addCompletedDownload*(title: string, description: string, isMediaScannerScannable: jboolean, mimeType: string, path: string, length: jlong, showNotification: jboolean): jlong
  proc addCompletedDownload*(title: string, description: string, isMediaScannerScannable: jboolean, mimeType: string, path: string, length: jlong, showNotification: jboolean, uri: Uri, referer: Uri): jlong
  proc addCompletedDownload*(title: string, description: string, isMediaScannerScannable: jboolean, mimeType: string, path: string, length: jlong, showNotification: jboolean, allowWrite: jboolean): jlong
  proc addCompletedDownload*(title: string, description: string, isMediaScannerScannable: jboolean, mimeType: string, path: string, length: jlong, showNotification: jboolean, allowWrite: jboolean, uri: Uri, referer: Uri): jlong
  proc getDownloadUri*(id: jlong): Uri
  COLUMN_ID*: string {.`static`.}
  COLUMN_TITLE*: string {.`static`.}
  COLUMN_DESCRIPTION*: string {.`static`.}
  COLUMN_URI*: string {.`static`.}
  COLUMN_MEDIA_TYPE*: string {.`static`.}
  COLUMN_TOTAL_SIZE_BYTES*: string {.`static`.}
  COLUMN_LOCAL_URI*: string {.`static`.}
  COLUMN_LOCAL_FILENAME*: string {.`static`.}
  COLUMN_STATUS*: string {.`static`.}
  COLUMN_FILE_NAME_HINT*: string {.`static`.}
  COLUMN_REASON*: string {.`static`.}
  COLUMN_BYTES_DOWNLOADED_SO_FAR*: string {.`static`.}
  COLUMN_LAST_MODIFIED_TIMESTAMP*: string {.`static`.}
  COLUMN_MEDIAPROVIDER_URI*: string {.`static`.}
  COLUMN_DESTINATION*: string {.`static`.}
  COLUMN_MEDIASTORE_URI*: string {.`static`.}
  COLUMN_ALLOW_WRITE*: string {.`static`.}
  STATUS_PENDING*: jint {.`static`.}
  STATUS_RUNNING*: jint {.`static`.}
  STATUS_PAUSED*: jint {.`static`.}
  STATUS_SUCCESSFUL*: jint {.`static`.}
  STATUS_FAILED*: jint {.`static`.}
  ERROR_UNKNOWN*: jint {.`static`.}
  ERROR_FILE_ERROR*: jint {.`static`.}
  ERROR_UNHANDLED_HTTP_CODE*: jint {.`static`.}
  ERROR_HTTP_DATA_ERROR*: jint {.`static`.}
  ERROR_TOO_MANY_REDIRECTS*: jint {.`static`.}
  ERROR_INSUFFICIENT_SPACE*: jint {.`static`.}
  ERROR_DEVICE_NOT_FOUND*: jint {.`static`.}
  ERROR_CANNOT_RESUME*: jint {.`static`.}
  ERROR_FILE_ALREADY_EXISTS*: jint {.`static`.}
  ERROR_BLOCKED*: jint {.`static`.}
  PAUSED_WAITING_TO_RETRY*: jint {.`static`.}
  PAUSED_WAITING_FOR_NETWORK*: jint {.`static`.}
  PAUSED_QUEUED_FOR_WIFI*: jint {.`static`.}
  PAUSED_UNKNOWN*: jint {.`static`.}
  ACTION_DOWNLOAD_COMPLETE*: string {.`static`.}
  ACTION_NOTIFICATION_CLICKED*: string {.`static`.}
  ACTION_VIEW_DOWNLOADS*: string {.`static`.}
  INTENT_EXTRAS_SORT_BY_SIZE*: string {.`static`.}
  EXTRA_DOWNLOAD_ID*: string {.`static`.}
  EXTRA_NOTIFICATION_CLICK_DOWNLOAD_IDS*: string {.`static`.}
  ACTION_DOWNLOAD_COMPLETED*: string {.`static`.}
  UNDERLYING_COLUMNS*: string {.`static`.}

jclass android.app.DownloadManager.Request* of JVMObject:
  proc setDestinationUri*(uri: Uri): Request
  proc setDestinationInExternalFilesDir*(context: Context, dirType: string, subPath: string): Request
  proc setDestinationInExternalPublicDir*(dirType: string, subPath: string): Request
  proc allowScanningByMediaScanner*()
  proc addRequestHeader*(header: string, value: string): Request
  proc setTitle*(title: CharSequence): Request
  proc setDescription*(description: CharSequence): Request
  proc setMimeType*(mimeType: string): Request
  proc setShowRunningNotification*(show: jboolean): Request
  proc setNotificationVisibility*(visibility: jint): Request
  proc setAllowedNetworkTypes*(flags: jint): Request
  proc setAllowedOverRoaming*(allowed: jboolean): Request
  proc setAllowedOverMetered*(allow: jboolean): Request
  proc setRequiresCharging*(requiresCharging: jboolean): Request
  proc setRequiresDeviceIdle*(requiresDeviceIdle: jboolean): Request
  proc setVisibleInDownloadsUi*(isVisible: jboolean): Request

jclass android.app.DownloadManager.Query* of JVMObject:
  proc setFilterById*(ids: jlong): Query
  proc setFilterByString*(filter: string): Query
  proc setFilterByStatus*(flags: jint): Query
  proc setOnlyIncludeVisibleInDownloadsUi*(value: jboolean): Query
  proc orderBy*(column: string, direction: jint): Query

jclass android.app.Request* of JVMObject:
  proc setDestinationUri*(uri: Uri): Request
  proc setDestinationInExternalFilesDir*(context: Context, dirType: string, subPath: string): Request
  proc setDestinationInExternalPublicDir*(dirType: string, subPath: string): Request
  proc allowScanningByMediaScanner*()
  proc addRequestHeader*(header: string, value: string): Request
  proc setTitle*(title: CharSequence): Request
  proc setDescription*(description: CharSequence): Request
  proc setMimeType*(mimeType: string): Request
  proc setShowRunningNotification*(show: jboolean): Request
  proc setNotificationVisibility*(visibility: jint): Request
  proc setAllowedNetworkTypes*(flags: jint): Request
  proc setAllowedOverRoaming*(allowed: jboolean): Request
  proc setAllowedOverMetered*(allow: jboolean): Request
  proc setRequiresCharging*(requiresCharging: jboolean): Request
  proc setRequiresDeviceIdle*(requiresDeviceIdle: jboolean): Request
  proc setVisibleInDownloadsUi*(isVisible: jboolean): Request
  NETWORK_MOBILE*: jint {.`static`.}
  NETWORK_WIFI*: jint {.`static`.}
  NETWORK_BLUETOOTH*: jint {.`static`.}
  VISIBILITY_VISIBLE*: jint {.`static`.}
  VISIBILITY_VISIBLE_NOTIFY_COMPLETED*: jint {.`static`.}
  VISIBILITY_HIDDEN*: jint {.`static`.}
  VISIBILITY_VISIBLE_NOTIFY_ONLY_COMPLETION*: jint {.`static`.}

jclass android.app.Query* of JVMObject:
  proc setFilterById*(ids: jlong): Query
  proc setFilterByString*(filter: string): Query
  proc setFilterByStatus*(flags: jint): Query
  proc setOnlyIncludeVisibleInDownloadsUi*(value: jboolean): Query
  proc orderBy*(column: string, direction: jint): Query
  ORDER_ASCENDING*: jint {.`static`.}
  ORDER_DESCENDING*: jint {.`static`.}

