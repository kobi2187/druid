import jnim

jclass android.provider.DocumentsProvider* of ContentProvider:
  proc attachInfo*(context: Context, info: ProviderInfo)
  proc attachInfoForTesting*(context: Context, info: ProviderInfo)
  proc isChildDocument*(parentDocumentId: string, documentId: string): jboolean
  proc createDocument*(parentDocumentId: string, mimeType: string, displayName: string): string
  proc renameDocument*(documentId: string, displayName: string): string
  proc deleteDocument*(documentId: string)
  proc copyDocument*(sourceDocumentId: string, targetParentDocumentId: string): string
  proc moveDocument*(sourceDocumentId: string, sourceParentDocumentId: string, targetParentDocumentId: string): string
  proc removeDocument*(documentId: string, parentDocumentId: string)
  proc findDocumentPath*(parentDocumentId: string, childDocumentId: string): Path
  proc createWebLinkIntent*(documentId: string, options: Bundle): IntentSender
  proc queryRoots*(projection: seq[string]): Cursor
  proc queryRecentDocuments*(rootId: string, projection: seq[string]): Cursor
  proc queryRecentDocuments*(rootId: string, projection: seq[string], queryArgs: Bundle, signal: CancellationSignal): Cursor
  proc queryDocument*(documentId: string, projection: seq[string]): Cursor
  proc queryChildDocuments*(parentDocumentId: string, projection: seq[string], sortOrder: string): Cursor
  proc queryChildDocuments*(parentDocumentId: string, projection: seq[string], queryArgs: Bundle): Cursor
  proc queryChildDocumentsForManage*(parentDocumentId: string, projection: seq[string], sortOrder: string): Cursor
  proc querySearchDocuments*(rootId: string, query: string, projection: seq[string]): Cursor
  proc querySearchDocuments*(rootId: string, projection: seq[string], queryArgs: Bundle): Cursor
  proc ejectRoot*(rootId: string)
  proc getDocumentMetadata*(documentId: string): Bundle
  proc getDocumentType*(documentId: string): string
  proc openDocument*(documentId: string, mode: string, signal: CancellationSignal): ParcelFileDescriptor
  proc openDocumentThumbnail*(documentId: string, sizeHint: Point, signal: CancellationSignal): AssetFileDescriptor
  proc openTypedDocument*(documentId: string, mimeTypeFilter: string, opts: Bundle, signal: CancellationSignal): AssetFileDescriptor
  proc query*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string): Cursor
  proc query*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string, cancellationSignal: CancellationSignal): Cursor
  proc query*(uri: Uri, projection: seq[string], queryArgs: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc getType*(uri: Uri): string
  proc getTypeAnonymous*(uri: Uri): string
  proc canonicalize*(uri: Uri): Uri
  proc insert*(uri: Uri, values: ContentValues): Uri
  proc delete*(uri: Uri, selection: string, selectionArgs: seq[string]): jint
  proc update*(uri: Uri, values: ContentValues, selection: string, selectionArgs: seq[string]): jint
  proc call*(method: string, arg: string, extras: Bundle): Bundle
  proc revokeDocumentPermission*(documentId: string)
  proc openFile*(uri: Uri, mode: string): ParcelFileDescriptor
  proc openFile*(uri: Uri, mode: string, signal: CancellationSignal): ParcelFileDescriptor
  proc openAssetFile*(uri: Uri, mode: string): AssetFileDescriptor
  proc openAssetFile*(uri: Uri, mode: string, signal: CancellationSignal): AssetFileDescriptor
  proc openTypedAssetFile*(uri: Uri, mimeTypeFilter: string, opts: Bundle): AssetFileDescriptor
  proc openTypedAssetFile*(uri: Uri, mimeTypeFilter: string, opts: Bundle, signal: CancellationSignal): AssetFileDescriptor
  proc getDocumentStreamTypes*(documentId: string, mimeTypeFilter: string): seq[string]
  proc getStreamTypes*(uri: Uri, mimeTypeFilter: string): seq[string]

