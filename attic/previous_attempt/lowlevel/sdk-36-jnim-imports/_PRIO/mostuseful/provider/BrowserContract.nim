import jnim

jclass android.provider.BrowserContract* of JVMObject:
  AUTHORITY*: string {.`static`.}
  AUTHORITY_URI*: Uri {.`static`.}
  CALLER_IS_SYNCADAPTER*: string {.`static`.}
  PARAM_LIMIT*: string {.`static`.}

jclass android.provider.BrowserContract.Bookmarks* of JVMObject:
  proc buildFolderUri*(folderId: jlong): Uri {.`static`.}

jclass android.provider.BrowserContract.SyncState* of JVMObject:
  proc get*(provider: ContentProviderClient, account: Account): seq[jbyte] {.`static`.}
  proc getWithUri*(provider: ContentProviderClient, account: Account): Pair[Uri, seq[jbyte]] {.`static`.}
  proc set*(provider: ContentProviderClient, account: Account, data: seq[jbyte]) {.`static`.}
  proc newSetOperation*(account: Account, data: seq[jbyte]): ContentProviderOperation {.`static`.}

jclass android.provider.BrowserContract.Settings* of JVMObject:
  proc isSyncEnabled*(context: Context): jboolean {.`static`.}
  proc setSyncEnabled*(context: Context, enabled: jboolean) {.`static`.}

jclass android.provider.ChromeSyncColumns* of JVMObject:
  SERVER_UNIQUE*: string {.`static`.}
  FOLDER_NAME_ROOT*: string {.`static`.}
  FOLDER_NAME_BOOKMARKS*: string {.`static`.}
  FOLDER_NAME_BOOKMARKS_BAR*: string {.`static`.}
  FOLDER_NAME_OTHER_BOOKMARKS*: string {.`static`.}
  CLIENT_UNIQUE*: string {.`static`.}

jclass android.provider.Bookmarks* of JVMObject:
  proc buildFolderUri*(folderId: jlong): Uri {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  BOOKMARK_TYPE_BOOKMARK*: jint {.`static`.}
  BOOKMARK_TYPE_FOLDER*: jint {.`static`.}
  BOOKMARK_TYPE_BOOKMARK_BAR_FOLDER*: jint {.`static`.}
  BOOKMARK_TYPE_OTHER_FOLDER*: jint {.`static`.}
  BOOKMARK_TYPE_MOBILE_FOLDER*: jint {.`static`.}
  TYP*: string {.`static`.}
  CONTENT_URI_DEFAULT_FOLDER*: Uri {.`static`.}
  PARAM_ACCOUNT_NAME*: string {.`static`.}
  PARAM_ACCOUNT_TYPE*: string {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  QUERY_PARAMETER_SHOW_DELETED*: string {.`static`.}
  IS_FOLDER*: string {.`static`.}
  PARENT*: string {.`static`.}
  PARENT_SOURCE_ID*: string {.`static`.}
  POSITION*: string {.`static`.}
  INSERT_AFTER*: string {.`static`.}
  INSERT_AFTER_SOURCE_ID*: string {.`static`.}
  IS_DELETED*: string {.`static`.}

jclass android.provider.Accounts* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  ACCOUNT_NAME*: string {.`static`.}
  ACCOUNT_TYPE*: string {.`static`.}
  ROOT_ID*: string {.`static`.}

jclass android.provider.History* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}

jclass android.provider.Searches* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  _ID*: string {.`static`.}
  SEARCH*: string {.`static`.}
  DATE*: string {.`static`.}

jclass android.provider.SyncState* of JVMObject:
  proc get*(provider: ContentProviderClient, account: Account): seq[jbyte] {.`static`.}
  proc getWithUri*(provider: ContentProviderClient, account: Account): Pair[Uri, seq[jbyte]] {.`static`.}
  proc set*(provider: ContentProviderClient, account: Account, data: seq[jbyte]) {.`static`.}
  proc newSetOperation*(account: Account, data: seq[jbyte]): ContentProviderOperation {.`static`.}
  CONTENT_DIRECTORY*: string {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.Images* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}
  IMAGE_TYPE_FAVICON*: jint {.`static`.}
  IMAGE_TYPE_PRECOMPOSED_TOUCH_ICON*: jint {.`static`.}
  IMAGE_TYPE_TOUCH_ICON*: jint {.`static`.}
  TYP*: string {.`static`.}
  DATA*: string {.`static`.}
  URL*: string {.`static`.}

jclass android.provider.ImageMappings* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  CONTENT_ITEM_TYPE*: string {.`static`.}

jclass android.provider.Combined* of JVMObject:
  CONTENT_URI*: Uri {.`static`.}
  IS_BOOKMARK*: string {.`static`.}

jclass android.provider.Settings* of JVMObject:
  proc isSyncEnabled*(context: Context): jboolean {.`static`.}
  proc setSyncEnabled*(context: Context, enabled: jboolean) {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  KEY*: string {.`static`.}
  VALUE*: string {.`static`.}
  KEY_SYNC_ENABLED*: string {.`static`.}

