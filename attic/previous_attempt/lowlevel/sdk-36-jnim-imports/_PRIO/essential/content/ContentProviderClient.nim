import jnim

jclass android.content.ContentProviderClient* of JVMObject:
  proc setDetectNotResponding*(timeoutMillis: jlong)
  proc query*(url: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string): Cursor
  proc query*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string, cancellationSignal: CancellationSignal): Cursor
  proc query*(uri: Uri, projection: seq[string], queryArgs: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc getType*(url: Uri): string
  proc getStreamTypes*(url: Uri, mimeTypeFilter: string): seq[string]
  proc canonicalize*(url: Uri): Uri
  proc uncanonicalize*(url: Uri): Uri
  proc refresh*(url: Uri, extras: Bundle, cancellationSignal: CancellationSignal): jboolean
  proc checkUriPermission*(uri: Uri, uid: jint, modeFlags: jint): jint
  proc insert*(url: Uri, initialValues: ContentValues): Uri
  proc insert*(url: Uri, initialValues: ContentValues, extras: Bundle): Uri
  proc bulkInsert*(url: Uri, initialValues: seq[ContentValues]): jint
  proc delete*(url: Uri, selection: string, selectionArgs: seq[string]): jint
  proc delete*(url: Uri, extras: Bundle): jint
  proc update*(url: Uri, values: ContentValues, selection: string, selectionArgs: seq[string]): jint
  proc update*(url: Uri, values: ContentValues, extras: Bundle): jint
  proc openFile*(url: Uri, mode: string): ParcelFileDescriptor
  proc openFile*(url: Uri, mode: string, signal: CancellationSignal): ParcelFileDescriptor
  proc openAssetFile*(url: Uri, mode: string): AssetFileDescriptor
  proc openAssetFile*(url: Uri, mode: string, signal: CancellationSignal): AssetFileDescriptor
  proc openTypedAssetFileDescriptor*(uri: Uri, mimeType: string, opts: Bundle): AssetFileDescriptor
  proc openTypedAssetFileDescriptor*(uri: Uri, mimeType: string, opts: Bundle, signal: CancellationSignal): AssetFileDescriptor
  proc openTypedAssetFile*(uri: Uri, mimeTypeFilter: string, opts: Bundle, signal: CancellationSignal): AssetFileDescriptor
  proc applyBatch*(operations: ArrayList[ContentProviderOperation]): seq[ContentProviderResult]
  proc applyBatch*(authority: string, operations: ArrayList[ContentProviderOperation]): seq[ContentProviderResult]
  proc call*(method: string, arg: string, extras: Bundle): Bundle
  proc call*(authority: string, method: string, arg: string, extras: Bundle): Bundle
  proc close*()
  proc release*(): jboolean
  proc getLocalContentProvider*(): ContentProvider
  proc closeQuietly*(client: ContentProviderClient) {.`static`.}
  proc releaseQuietly*(client: ContentProviderClient) {.`static`.}

