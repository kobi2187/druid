import jnim

jclass android.provider.Browser* of JVMObject:
  proc saveBookmark*(c: Context, title: string, url: string) {.`static`.}
  proc sendString*(context: Context, string: string) {.`static`.}
  proc sendString*(c: Context, stringToSend: string, chooserDialogTitle: string) {.`static`.}
  proc getAllBookmarks*(cr: ContentResolver): Cursor {.`static`.}
  proc getAllVisitedUrls*(cr: ContentResolver): Cursor {.`static`.}
  proc updateVisitedHistory*(cr: ContentResolver, url: string, real: jboolean) {.`static`.}
  proc getVisitedHistory*(cr: ContentResolver): seq[string] {.`static`.}
  proc truncateHistory*(cr: ContentResolver) {.`static`.}
  proc canClearHistory*(cr: ContentResolver): jboolean {.`static`.}
  proc clearHistory*(cr: ContentResolver) {.`static`.}
  proc deleteHistoryTimeFrame*(cr: ContentResolver, begin: jlong, end: jlong) {.`static`.}
  proc deleteFromHistory*(cr: ContentResolver, url: string) {.`static`.}
  proc addSearchUrl*(cr: ContentResolver, search: string) {.`static`.}
  proc clearSearches*(cr: ContentResolver) {.`static`.}
  proc requestAllIcons*(cr: ContentResolver, where: string, listener: WebIconDatabase.IconListener) {.`static`.}
  BOOKMARKS_URI*: Uri {.`static`.}
  INITIAL_ZOOM_LEVEL*: string {.`static`.}
  EXTRA_APPLICATION_ID*: string {.`static`.}
  EXTRA_HEADERS*: string {.`static`.}
  HISTORY_PROJECTION*: string {.`static`.}
  HISTORY_PROJECTION_ID_INDEX*: jint {.`static`.}
  HISTORY_PROJECTION_URL_INDEX*: jint {.`static`.}
  HISTORY_PROJECTION_VISITS_INDEX*: jint {.`static`.}
  HISTORY_PROJECTION_DATE_INDEX*: jint {.`static`.}
  HISTORY_PROJECTION_BOOKMARK_INDEX*: jint {.`static`.}
  HISTORY_PROJECTION_TITLE_INDEX*: jint {.`static`.}
  HISTORY_PROJECTION_FAVICON_INDEX*: jint {.`static`.}
  HISTORY_PROJECTION_THUMBNAIL_INDEX*: jint {.`static`.}
  HISTORY_PROJECTION_TOUCH_ICON_INDEX*: jint {.`static`.}
  TRUNCATE_HISTORY_PROJECTION*: string {.`static`.}
  TRUNCATE_HISTORY_PROJECTION_ID_INDEX*: jint {.`static`.}
  TRUNCATE_N_OLDEST*: jint {.`static`.}
  SEARCHES_URI*: Uri {.`static`.}
  SEARCHES_PROJECTION*: string {.`static`.}
  SEARCHES_PROJECTION_SEARCH_INDEX*: jint {.`static`.}
  SEARCHES_PROJECTION_DATE_INDEX*: jint {.`static`.}
  EXTRA_CREATE_NEW_TAB*: string {.`static`.}
  EXTRA_SHARE_SCREENSHOT*: string {.`static`.}
  EXTRA_SHARE_FAVICON*: string {.`static`.}

jclass android.provider.BookmarkColumns* of JVMObject:
  URL*: string {.`static`.}
  VISITS*: string {.`static`.}
  DATE*: string {.`static`.}
  BOOKMARK*: string {.`static`.}
  TITLE*: string {.`static`.}
  CREATED*: string {.`static`.}
  FAVICON*: string {.`static`.}
  THUMBNAIL*: string {.`static`.}
  TOUCH_ICON*: string {.`static`.}
  USER_ENTERED*: string {.`static`.}

jclass android.provider.SearchColumns* of JVMObject:
  URL*: string {.`static`.}
  SEARCH*: string {.`static`.}
  DATE*: string {.`static`.}

