import jnim

jclass android.content.ContentInterface* of JVMObject:
  proc query*(uri: Uri, projection: seq[string], queryArgs: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc getType*(uri: Uri): string
  proc getStreamTypes*(uri: Uri, mimeTypeFilter: string): seq[string]
  proc canonicalize*(uri: Uri): Uri
  proc uncanonicalize*(uri: Uri): Uri
  proc refresh*(uri: Uri, extras: Bundle, cancellationSignal: CancellationSignal): jboolean
  proc checkUriPermission*(uri: Uri, uid: jint, modeFlags: jint): jint
  proc insert*(uri: Uri, initialValues: ContentValues, extras: Bundle): Uri
  proc bulkInsert*(uri: Uri, initialValues: seq[ContentValues]): jint
  proc delete*(uri: Uri, extras: Bundle): jint
  proc update*(uri: Uri, values: ContentValues, extras: Bundle): jint
  proc openFile*(uri: Uri, mode: string, signal: CancellationSignal): ParcelFileDescriptor
  proc openAssetFile*(uri: Uri, mode: string, signal: CancellationSignal): AssetFileDescriptor
  proc openTypedAssetFile*(uri: Uri, mimeTypeFilter: string, opts: Bundle, signal: CancellationSignal): AssetFileDescriptor
  proc applyBatch*(authority: string, operations: ArrayList[ContentProviderOperation]): seq[ContentProviderResult]
  proc call*(authority: string, method: string, arg: string, extras: Bundle): Bundle

