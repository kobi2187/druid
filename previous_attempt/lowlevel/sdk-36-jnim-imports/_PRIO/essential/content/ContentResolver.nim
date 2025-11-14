import jnim

jclass android.content.ContentResolver* of JVMObject:
  proc syncErrorToString*(error: jint): string {.`static`.}
  proc syncErrorStringToInt*(error: string): jint {.`static`.}
  proc wrap*(wrapped: ContentInterface): ContentResolver {.`static`.}
  proc wrap*(wrapped: ContentProvider): ContentResolver {.`static`.}
  proc wrap*(wrapped: ContentProviderClient): ContentResolver {.`static`.}
  proc releaseProvider*(icp: IContentProvider): jboolean
  proc releaseUnstableProvider*(icp: IContentProvider): jboolean
  proc unstableProviderDied*(icp: IContentProvider)
  proc appNotRespondingViaProvider*(icp: IContentProvider)
  proc getType*(url: Uri): string
  proc getStreamTypes*(url: Uri, mimeTypeFilter: string): seq[string]
  proc query*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string): Cursor
  proc query*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string, cancellationSignal: CancellationSignal): Cursor
  proc query*(uri: Uri, projection: seq[string], queryArgs: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc canonicalizeOrElse*(uri: Uri): Uri
  proc canonicalize*(url: Uri): Uri
  proc uncanonicalize*(url: Uri): Uri
  proc refresh*(url: Uri, extras: Bundle, cancellationSignal: CancellationSignal): jboolean
  proc checkUriPermission*(uri: Uri, uid: jint, modeFlags: jint): jint
  proc openInputStream*(uri: Uri): InputStream
  proc openOutputStream*(uri: Uri): OutputStream
  proc openOutputStream*(uri: Uri, mode: string): OutputStream
  proc openFile*(uri: Uri, mode: string, signal: CancellationSignal): ParcelFileDescriptor
  proc openFileDescriptor*(uri: Uri, mode: string): ParcelFileDescriptor
  proc openFileDescriptor*(uri: Uri, mode: string, cancellationSignal: CancellationSignal): ParcelFileDescriptor
  proc openAssetFile*(uri: Uri, mode: string, signal: CancellationSignal): AssetFileDescriptor
  proc openAssetFileDescriptor*(uri: Uri, mode: string): AssetFileDescriptor
  proc openAssetFileDescriptor*(uri: Uri, mode: string, cancellationSignal: CancellationSignal): AssetFileDescriptor
  proc openTypedAssetFile*(uri: Uri, mimeTypeFilter: string, opts: Bundle, signal: CancellationSignal): AssetFileDescriptor
  proc openTypedAssetFileDescriptor*(uri: Uri, mimeType: string, opts: Bundle): AssetFileDescriptor
  proc openTypedAssetFileDescriptor*(uri: Uri, mimeType: string, opts: Bundle, cancellationSignal: CancellationSignal): AssetFileDescriptor
  proc getResourceId*(uri: Uri): OpenResourceIdResult
  proc insert*(url: Uri, values: ContentValues): Uri
  proc insert*(url: Uri, values: ContentValues, extras: Bundle): Uri
  proc applyBatch*(authority: string, operations: ArrayList[ContentProviderOperation]): seq[ContentProviderResult]
  proc bulkInsert*(url: Uri, values: seq[ContentValues]): jint
  proc delete*(url: Uri, where: string, selectionArgs: seq[string]): jint
  proc delete*(url: Uri, extras: Bundle): jint
  proc update*(uri: Uri, values: ContentValues, where: string, selectionArgs: seq[string]): jint
  proc update*(uri: Uri, values: ContentValues, extras: Bundle): jint
  proc call*(uri: Uri, method: string, arg: string, extras: Bundle): Bundle
  proc call*(authority: string, method: string, arg: string, extras: Bundle): Bundle
  proc acquireProvider*(uri: Uri): IContentProvider
  proc acquireExistingProvider*(uri: Uri): IContentProvider
  proc acquireProvider*(name: string): IContentProvider
  proc acquireUnstableProvider*(uri: Uri): IContentProvider
  proc acquireUnstableProvider*(name: string): IContentProvider
  proc acquireContentProviderClient*(uri: Uri): ContentProviderClient
  proc acquireContentProviderClient*(name: string): ContentProviderClient
  proc acquireUnstableContentProviderClient*(uri: Uri): ContentProviderClient
  proc acquireUnstableContentProviderClient*(name: string): ContentProviderClient
  proc registerContentObserver*(uri: Uri, notifyForDescendants: jboolean, observer: ContentObserver)
  proc registerContentObserverAsUser*(uri: Uri, notifyForDescendants: jboolean, observer: ContentObserver, userHandle: UserHandle)
  proc registerContentObserver*(uri: Uri, notifyForDescendants: jboolean, observer: ContentObserver, userHandle: jint)
  proc unregisterContentObserver*(observer: ContentObserver)
  proc notifyChange*(uri: Uri, observer: ContentObserver)
  proc notifyChange*(uri: Uri, observer: ContentObserver, syncToNetwork: jboolean)
  proc notifyChange*(uri: Uri, observer: ContentObserver, flags: jint)
  proc notifyChange*(uris: Iterable[Uri], observer: ContentObserver, flags: jint)
  proc notifyChange*(uris: Collection[Uri], observer: ContentObserver, flags: jint)
  proc notifyChange*(uri: Uri, observer: ContentObserver, syncToNetwork: jboolean, userHandle: jint)
  proc notifyChange*(uri: Uri, observer: ContentObserver, flags: jint, userHandle: jint)
  proc notifyChange*(uris: seq[Uri], observer: ContentObserver, flags: jint, userHandle: jint)
  proc takePersistableUriPermission*(uri: Uri, modeFlags: jint)
  proc takePersistableUriPermission*(toPackage: string, uri: Uri, modeFlags: jint)
  proc releasePersistableUriPermission*(uri: Uri, modeFlags: jint)
  proc getPersistedUriPermissions*(): List[UriPermission]
  proc getOutgoingPersistedUriPermissions*(): List[UriPermission]
  proc getOutgoingUriPermissions*(): List[UriPermission]
  proc startSync*(uri: Uri, extras: Bundle)
  proc requestSync*(account: Account, authority: string, extras: Bundle) {.`static`.}
  proc requestSyncAsUser*(account: Account, authority: string, userId: jint, extras: Bundle) {.`static`.}
  proc requestSync*(request: SyncRequest) {.`static`.}
  proc validateSyncExtrasBundle*(extras: Bundle) {.`static`.}
  proc cancelSync*(uri: Uri)
  proc cancelSync*(account: Account, authority: string) {.`static`.}
  proc cancelSyncAsUser*(account: Account, authority: string, userId: jint) {.`static`.}
  proc getSyncAdapterTypes*(): seq[SyncAdapterType] {.`static`.}
  proc getSyncAdapterTypesAsUser*(userId: jint): seq[SyncAdapterType] {.`static`.}
  proc getSyncAdapterPackagesForAuthorityAsUser*(authority: string, userId: jint): seq[string] {.`static`.}
  proc getSyncAdapterPackageAsUser*(accountType: string, authority: string, userId: jint): string {.`static`.}
  proc getSyncAutomatically*(account: Account, authority: string): jboolean {.`static`.}
  proc getSyncAutomaticallyAsUser*(account: Account, authority: string, userId: jint): jboolean {.`static`.}
  proc setSyncAutomatically*(account: Account, authority: string, sync: jboolean) {.`static`.}
  proc setSyncAutomaticallyAsUser*(account: Account, authority: string, sync: jboolean, userId: jint) {.`static`.}
  proc hasInvalidScheduleAsEjExtras*(extras: Bundle): jboolean {.`static`.}
  proc addPeriodicSync*(account: Account, authority: string, extras: Bundle, pollFrequency: jlong) {.`static`.}
  proc invalidPeriodicExtras*(extras: Bundle): jboolean {.`static`.}
  proc removePeriodicSync*(account: Account, authority: string, extras: Bundle) {.`static`.}
  proc cancelSync*(request: SyncRequest) {.`static`.}
  proc getPeriodicSyncs*(account: Account, authority: string): List[PeriodicSync] {.`static`.}
  proc getIsSyncable*(account: Account, authority: string): jint {.`static`.}
  proc getIsSyncableAsUser*(account: Account, authority: string, userId: jint): jint {.`static`.}
  proc setIsSyncable*(account: Account, authority: string, syncable: jint) {.`static`.}
  proc setIsSyncableAsUser*(account: Account, authority: string, syncable: jint, userId: jint) {.`static`.}
  proc getMasterSyncAutomatically*(): jboolean {.`static`.}
  proc getMasterSyncAutomaticallyAsUser*(userId: jint): jboolean {.`static`.}
  proc setMasterSyncAutomatically*(sync: jboolean) {.`static`.}
  proc setMasterSyncAutomaticallyAsUser*(sync: jboolean, userId: jint) {.`static`.}
  proc isSyncActive*(account: Account, authority: string): jboolean {.`static`.}
  proc getCurrentSync*(): SyncInfo {.`static`.}
  proc getCurrentSyncs*(): List[SyncInfo] {.`static`.}
  proc getCurrentSyncsAsUser*(userId: jint): List[SyncInfo] {.`static`.}
  proc getSyncStatus*(account: Account, authority: string): SyncStatusInfo {.`static`.}
  proc getSyncStatusAsUser*(account: Account, authority: string, userId: jint): SyncStatusInfo {.`static`.}
  proc isSyncPending*(account: Account, authority: string): jboolean {.`static`.}
  proc isSyncPendingAsUser*(account: Account, authority: string, userId: jint): jboolean {.`static`.}
  proc addStatusChangeListener*(mask: jint, callback: SyncStatusObserver): JObject {.`static`.}
  proc removeStatusChangeListener*(handle: JObject) {.`static`.}
  proc putCache*(key: Uri, value: Bundle)
  proc getCache*(key: Uri): Bundle
  proc getTargetSdkVersion*(): jint
  proc getContentService*(): IContentService {.`static`.}
  proc getPackageName*(): string
  proc getAttributionTag*(): string
  proc getAttributionSource*(): AttributionSource
  proc resolveUserId*(uri: Uri): jint
  proc getUserId*(): jint
  proc getTypeDrawable*(mimeType: string): Drawable
  proc getTypeInfo*(mimeType: string): MimeTypeInfo
  proc createSqlQueryBundle*(selection: string, selectionArgs: seq[string]): Bundle {.`static`.}
  proc createSqlQueryBundle*(selection: string, selectionArgs: seq[string], sortOrder: string): Bundle {.`static`.}
  proc includeSqlSelectionArgs*(queryArgs: Bundle, selection: string, selectionArgs: seq[string]): Bundle {.`static`.}
  proc createSqlSortClause*(queryArgs: Bundle): string {.`static`.}
  proc loadThumbnail*(uri: Uri, size: Size, signal: CancellationSignal): Bitmap
  proc loadThumbnail*(content: ContentInterface, uri: Uri, size: Size, signal: CancellationSignal, allocator: jint): Bitmap {.`static`.}
  proc onDbCorruption*(tag: string, message: string, stacktrace: Throwable) {.`static`.}
  proc decodeFromFile*(file: File): Uri {.`static`.}
  proc encodeToFile*(uri: Uri): File {.`static`.}
  proc translateDeprecatedDataPath*(path: string): Uri {.`static`.}
  proc translateDeprecatedDataPath*(uri: Uri): string {.`static`.}
  DEPRECATE_DATA_COLUMNS*: jboolean {.`static`.}
  DEPRECATE_DATA_PREFIX*: string {.`static`.}
  SYNC_EXTRAS_ACCOUNT*: string {.`static`.}
  SYNC_EXTRAS_EXPEDITED*: string {.`static`.}
  SYNC_EXTRAS_REQUIRE_CHARGING*: string {.`static`.}
  SYNC_EXTRAS_SCHEDULE_AS_EXPEDITED_JOB*: string {.`static`.}
  SYNC_EXTRAS_FORCE*: string {.`static`.}
  SYNC_EXTRAS_IGNORE_SETTINGS*: string {.`static`.}
  SYNC_EXTRAS_IGNORE_BACKOFF*: string {.`static`.}
  SYNC_EXTRAS_DO_NOT_RETRY*: string {.`static`.}
  SYNC_EXTRAS_MANUAL*: string {.`static`.}
  SYNC_EXTRAS_UPLOAD*: string {.`static`.}
  SYNC_EXTRAS_OVERRIDE_TOO_MANY_DELETIONS*: string {.`static`.}
  SYNC_EXTRAS_DISCARD_LOCAL_DELETIONS*: string {.`static`.}
  SYNC_EXTRAS_EXPECTED_UPLOAD*: string {.`static`.}
  SYNC_EXTRAS_EXPECTED_DOWNLOAD*: string {.`static`.}
  SYNC_EXTRAS_PRIORITY*: string {.`static`.}
  SYNC_EXTRAS_DISALLOW_METERED*: string {.`static`.}
  SYNC_VIRTUAL_EXTRAS_EXEMPTION_FLAG*: string {.`static`.}
  SYNC_EXTRAS_INITIALIZE*: string {.`static`.}
  ACTION_SYNC_CONN_STATUS_CHANGED*: Intent {.`static`.}
  SCHEME_CONTENT*: string {.`static`.}
  SCHEME_ANDROID_RESOURCE*: string {.`static`.}
  SCHEME_FILE*: string {.`static`.}
  EXTRA_SIZE*: string {.`static`.}
  EXTRA_REFRESH_SUPPORTED*: string {.`static`.}
  QUERY_ARG_SQL_SELECTION*: string {.`static`.}
  QUERY_ARG_SQL_SELECTION_ARGS*: string {.`static`.}
  QUERY_ARG_SQL_SORT_ORDER*: string {.`static`.}
  QUERY_ARG_SQL_GROUP_BY*: string {.`static`.}
  QUERY_ARG_SQL_HAVING*: string {.`static`.}
  QUERY_ARG_SQL_LIMIT*: string {.`static`.}
  QUERY_ARG_SORT_COLUMNS*: string {.`static`.}
  QUERY_ARG_SORT_DIRECTION*: string {.`static`.}
  QUERY_ARG_SORT_COLLATION*: string {.`static`.}
  QUERY_ARG_SORT_LOCALE*: string {.`static`.}
  QUERY_ARG_GROUP_COLUMNS*: string {.`static`.}
  EXTRA_HONORED_ARGS*: string {.`static`.}
  QUERY_SORT_DIRECTION_ASCENDING*: jint {.`static`.}
  QUERY_SORT_DIRECTION_DESCENDING*: jint {.`static`.}
  QUERY_ARG_OFFSET*: string {.`static`.}
  QUERY_ARG_LIMIT*: string {.`static`.}
  EXTRA_TOTAL_COUNT*: string {.`static`.}
  CURSOR_ITEM_BASE_TYPE*: string {.`static`.}
  CURSOR_DIR_BASE_TYPE*: string {.`static`.}
  ANY_CURSOR_ITEM_TYPE*: string {.`static`.}
  MIME_TYPE_DEFAULT*: string {.`static`.}
  SYNC_ERROR_SYNC_ALREADY_IN_PROGRESS*: jint {.`static`.}
  SYNC_ERROR_AUTHENTICATION*: jint {.`static`.}
  SYNC_ERROR_IO*: jint {.`static`.}
  SYNC_ERROR_PARSE*: jint {.`static`.}
  SYNC_ERROR_CONFLICT*: jint {.`static`.}
  SYNC_ERROR_TOO_MANY_DELETIONS*: jint {.`static`.}
  SYNC_ERROR_TOO_MANY_RETRIES*: jint {.`static`.}
  SYNC_ERROR_INTERNAL*: jint {.`static`.}
  SYNC_OBSERVER_TYPE_SETTINGS*: jint {.`static`.}
  SYNC_OBSERVER_TYPE_PENDING*: jint {.`static`.}
  SYNC_OBSERVER_TYPE_ACTIVE*: jint {.`static`.}
  SYNC_OBSERVER_TYPE_STATUS*: jint {.`static`.}
  SYNC_OBSERVER_TYPE_ALL*: jint {.`static`.}
  NOTIFY_SYNC_TO_NETWORK*: jint {.`static`.}
  NOTIFY_SKIP_NOTIFY_FOR_DESCENDANTS*: jint {.`static`.}
  NOTIFY_INSERT*: jint {.`static`.}
  NOTIFY_UPDATE*: jint {.`static`.}
  NOTIFY_DELETE*: jint {.`static`.}
  NOTIFY_NO_DELAY*: jint {.`static`.}
  SYNC_EXEMPTION_NONE*: jint {.`static`.}
  SYNC_EXEMPTION_PROMOTE_BUCKET*: jint {.`static`.}
  SYNC_EXEMPTION_PROMOTE_BUCKET_WITH_TEMP*: jint {.`static`.}
  REMOTE_CALLBACK_RESULT*: string {.`static`.}
  REMOTE_CALLBACK_ERROR*: string {.`static`.}
  CONTENT_PROVIDER_PUBLISH_TIMEOUT_MILLIS*: jint {.`static`.}
  CONTENT_PROVIDER_READY_TIMEOUT_MILLIS*: jint {.`static`.}
  CONTENT_SERVICE_NAME*: string {.`static`.}

jclass android.content.ContentResolver.MimeTypeInfo* of JVMObject:
  proc getIcon*(): Icon
  proc getLabel*(): CharSequence
  proc getContentDescription*(): CharSequence

jclass android.content.OpenResourceIdResult* of JVMObject:
  r*: Resources
  id*: jint

jclass android.content.MimeTypeInfo* of JVMObject:
  proc getIcon*(): Icon
  proc getLabel*(): CharSequence
  proc getContentDescription*(): CharSequence

