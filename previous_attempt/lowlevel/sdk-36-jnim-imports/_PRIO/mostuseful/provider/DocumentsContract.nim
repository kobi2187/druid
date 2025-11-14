import jnim

jclass android.provider.DocumentsContract* of JVMObject:
  proc buildRootsUri*(authority: string): Uri {.`static`.}
  proc buildRootUri*(authority: string, rootId: string): Uri {.`static`.}
  proc buildRecentDocumentsUri*(authority: string, rootId: string): Uri {.`static`.}
  proc buildTreeDocumentUri*(authority: string, documentId: string): Uri {.`static`.}
  proc buildDocumentUri*(authority: string, documentId: string): Uri {.`static`.}
  proc buildDocumentUriAsUser*(authority: string, documentId: string, user: UserHandle): Uri {.`static`.}
  proc buildBaseDocumentUri*(authority: string): Uri {.`static`.}
  proc buildDocumentUriUsingTree*(treeUri: Uri, documentId: string): Uri {.`static`.}
  proc buildDocumentUriMaybeUsingTree*(baseUri: Uri, documentId: string): Uri {.`static`.}
  proc buildChildDocumentsUri*(authority: string, parentDocumentId: string): Uri {.`static`.}
  proc buildChildDocumentsUriUsingTree*(treeUri: Uri, parentDocumentId: string): Uri {.`static`.}
  proc buildSearchDocumentsUri*(authority: string, rootId: string, query: string): Uri {.`static`.}
  proc matchSearchQueryArguments*(queryArgs: Bundle, displayName: string, mimeType: string, lastModified: jlong, size: jlong): jboolean {.`static`.}
  proc getHandledQueryArguments*(queryArgs: Bundle): seq[string] {.`static`.}
  proc isDocumentUri*(context: Context, uri: Uri): jboolean {.`static`.}
  proc isRootsUri*(context: Context, uri: Uri): jboolean {.`static`.}
  proc isRootUri*(context: Context, uri: Uri): jboolean {.`static`.}
  proc isContentUri*(uri: Uri): jboolean {.`static`.}
  proc isTreeUri*(uri: Uri): jboolean {.`static`.}
  proc getRootId*(rootUri: Uri): string {.`static`.}
  proc getDocumentId*(documentUri: Uri): string {.`static`.}
  proc getTreeDocumentId*(documentUri: Uri): string {.`static`.}
  proc getSearchDocumentsQuery*(searchDocumentsUri: Uri): string {.`static`.}
  proc getSearchDocumentsQuery*(bundle: Bundle): string {.`static`.}
  proc setManageMode*(uri: Uri): Uri {.`static`.}
  proc isManageMode*(uri: Uri): jboolean {.`static`.}
  proc getDocumentThumbnail*(content: ContentResolver, documentUri: Uri, size: Point, signal: CancellationSignal): Bitmap {.`static`.}
  proc createDocument*(content: ContentResolver, parentDocumentUri: Uri, mimeType: string, displayName: string): Uri {.`static`.}
  proc isChildDocument*(content: ContentResolver, parentDocumentUri: Uri, childDocumentUri: Uri): jboolean {.`static`.}
  proc renameDocument*(content: ContentResolver, documentUri: Uri, displayName: string): Uri {.`static`.}
  proc deleteDocument*(content: ContentResolver, documentUri: Uri): jboolean {.`static`.}
  proc copyDocument*(content: ContentResolver, sourceDocumentUri: Uri, targetParentDocumentUri: Uri): Uri {.`static`.}
  proc moveDocument*(content: ContentResolver, sourceDocumentUri: Uri, sourceParentDocumentUri: Uri, targetParentDocumentUri: Uri): Uri {.`static`.}
  proc removeDocument*(content: ContentResolver, documentUri: Uri, parentDocumentUri: Uri): jboolean {.`static`.}
  proc ejectRoot*(content: ContentResolver, rootUri: Uri) {.`static`.}
  proc getDocumentMetadata*(content: ContentResolver, documentUri: Uri): Bundle {.`static`.}
  proc findDocumentPath*(content: ContentResolver, treeUri: Uri): Path {.`static`.}
  proc createWebLinkIntent*(content: ContentResolver, uri: Uri, options: Bundle): IntentSender {.`static`.}
  proc openImageThumbnail*(file: File): AssetFileDescriptor {.`static`.}
  PROVIDER_INTERFACE*: string {.`static`.}
  EXTRA_PACKAGE_NAME*: string {.`static`.}
  EXTRA_SHOW_ADVANCED*: string {.`static`.}
  EXTRA_TARGET_URI*: string {.`static`.}
  QUERY_ARG_DISPLAY_NAME*: string {.`static`.}
  QUERY_ARG_MIME_TYPES*: string {.`static`.}
  QUERY_ARG_FILE_SIZE_OVER*: string {.`static`.}
  QUERY_ARG_LAST_MODIFIED_AFTER*: string {.`static`.}
  QUERY_ARG_EXCLUDE_MEDIA*: string {.`static`.}
  EXTRA_INITIAL_URI*: string {.`static`.}
  EXTRA_EXCLUDE_SELF*: string {.`static`.}
  EXTRA_ORIENTATION*: string {.`static`.}
  EXTRA_PROMPT*: string {.`static`.}
  ACTION_DOCUMENT_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_DOCUMENT*: string {.`static`.}
  ACTION_DOCUMENT_ROOT_SETTINGS*: string {.`static`.}
  EXTERNAL_STORAGE_PROVIDER_AUTHORITY*: string {.`static`.}
  DOWNLOADS_PROVIDER_AUTHORITY*: string {.`static`.}
  EXTERNAL_STORAGE_PRIMARY_EMULATED_ROOT_ID*: string {.`static`.}
  PACKAGE_DOCUMENTS_UI*: string {.`static`.}
  METADATA_TYPES*: string {.`static`.}
  METADATA_EXIF*: string {.`static`.}
  METADATA_TREE_COUNT*: string {.`static`.}
  METADATA_TREE_SIZE*: string {.`static`.}
  EXTRA_LOADING*: string {.`static`.}
  EXTRA_INFO*: string {.`static`.}
  EXTRA_ERROR*: string {.`static`.}
  EXTRA_RESULT*: string {.`static`.}
  METHOD_CREATE_DOCUMENT*: string {.`static`.}
  METHOD_RENAME_DOCUMENT*: string {.`static`.}
  METHOD_DELETE_DOCUMENT*: string {.`static`.}
  METHOD_COPY_DOCUMENT*: string {.`static`.}
  METHOD_MOVE_DOCUMENT*: string {.`static`.}
  METHOD_IS_CHILD_DOCUMENT*: string {.`static`.}
  METHOD_REMOVE_DOCUMENT*: string {.`static`.}
  METHOD_EJECT_ROOT*: string {.`static`.}
  METHOD_FIND_DOCUMENT_PATH*: string {.`static`.}
  METHOD_CREATE_WEB_LINK_INTENT*: string {.`static`.}
  METHOD_GET_DOCUMENT_METADATA*: string {.`static`.}
  EXTRA_PARENT_URI*: string {.`static`.}
  EXTRA_URI*: string {.`static`.}
  EXTRA_URI_PERMISSIONS*: string {.`static`.}
  EXTRA_OPTIONS*: string {.`static`.}

jclass android.provider.DocumentsContract.Path* of JVMObject:
  proc getRootId*(): string
  proc getPath*(): List[string]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.provider.Document* of JVMObject:
  COLUMN_DOCUMENT_ID*: string {.`static`.}
  COLUMN_MIME_TYPE*: string {.`static`.}
  COLUMN_DISPLAY_NAME*: string {.`static`.}
  COLUMN_SUMMARY*: string {.`static`.}
  COLUMN_LAST_MODIFIED*: string {.`static`.}
  COLUMN_ICON*: string {.`static`.}
  COLUMN_FLAGS*: string {.`static`.}
  COLUMN_SIZE*: string {.`static`.}
  MIME_TYPE_DIR*: string {.`static`.}
  FLAG_SUPPORTS_THUMBNAIL*: jint {.`static`.}
  FLAG_SUPPORTS_WRITE*: jint {.`static`.}
  FLAG_SUPPORTS_DELETE*: jint {.`static`.}
  FLAG_DIR_SUPPORTS_CREATE*: jint {.`static`.}
  FLAG_DIR_PREFERS_GRID*: jint {.`static`.}
  FLAG_DIR_PREFERS_LAST_MODIFIED*: jint {.`static`.}
  FLAG_SUPPORTS_RENAME*: jint {.`static`.}
  FLAG_SUPPORTS_COPY*: jint {.`static`.}
  FLAG_SUPPORTS_MOVE*: jint {.`static`.}
  FLAG_VIRTUAL_DOCUMENT*: jint {.`static`.}
  FLAG_SUPPORTS_REMOVE*: jint {.`static`.}
  FLAG_SUPPORTS_SETTINGS*: jint {.`static`.}
  FLAG_WEB_LINKABLE*: jint {.`static`.}
  FLAG_PARTIAL*: jint {.`static`.}
  FLAG_SUPPORTS_METADATA*: jint {.`static`.}
  FLAG_DIR_BLOCKS_OPEN_DOCUMENT_TREE*: jint {.`static`.}

jclass android.provider.Root* of JVMObject:
  COLUMN_ROOT_ID*: string {.`static`.}
  COLUMN_FLAGS*: string {.`static`.}
  COLUMN_ICON*: string {.`static`.}
  COLUMN_TITLE*: string {.`static`.}
  COLUMN_SUMMARY*: string {.`static`.}
  COLUMN_DOCUMENT_ID*: string {.`static`.}
  COLUMN_AVAILABLE_BYTES*: string {.`static`.}
  COLUMN_CAPACITY_BYTES*: string {.`static`.}
  COLUMN_MIME_TYPES*: string {.`static`.}
  COLUMN_QUERY_ARGS*: string {.`static`.}
  MIME_TYPE_ITEM*: string {.`static`.}
  FLAG_SUPPORTS_CREATE*: jint {.`static`.}
  FLAG_LOCAL_ONLY*: jint {.`static`.}
  FLAG_SUPPORTS_RECENTS*: jint {.`static`.}
  FLAG_SUPPORTS_SEARCH*: jint {.`static`.}
  FLAG_SUPPORTS_IS_CHILD*: jint {.`static`.}
  FLAG_SUPPORTS_EJECT*: jint {.`static`.}
  FLAG_EMPTY*: jint {.`static`.}
  FLAG_ADVANCED*: jint {.`static`.}
  FLAG_HAS_SETTINGS*: jint {.`static`.}
  FLAG_REMOVABLE_SD*: jint {.`static`.}
  FLAG_REMOVABLE_USB*: jint {.`static`.}

jclass android.provider.Path* of JVMObject:
  proc getRootId*(): string
  proc getPath*(): List[string]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Creator[Path] {.`static`.}

