import jnim

jclass android.content.ContentProvider* of JVMObject:
  proc isAuthorityRedirectedForCloneProfile*(authority: string): jboolean {.`static`.}
  proc coerceToLocalContentProvider*(abstractInterface: IContentProvider): ContentProvider {.`static`.}
  proc getContext*(): Context
  proc requireContext*(): Context
  proc getCallingPackage*(): string
  proc getCallingAttributionSource*(): AttributionSource
  proc getCallingAttributionTag*(): string
  proc getCallingFeatureId*(): string
  proc getCallingPackageUnchecked*(): string
  proc onCallingPackageChanged*()
  proc clearCallingIdentity*(): CallingIdentity
  proc restoreCallingIdentity*(identity: CallingIdentity)
  proc getReadPermission*(): string
  proc getWritePermission*(): string
  proc getPathPermissions*(): seq[PathPermission]
  proc setAppOps*(readOp: jint, writeOp: jint)
  proc getAppOpsManager*(): AppOpsManager
  proc setTransportLoggingEnabled*(enabled: jboolean)
  proc onCreate*(): jboolean
  proc onConfigurationChanged*(newConfig: Configuration)
  proc onLowMemory*()
  proc onTrimMemory*(level: jint)
  proc query*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string): Cursor
  proc query*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string, cancellationSignal: CancellationSignal): Cursor
  proc query*(uri: Uri, projection: seq[string], queryArgs: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc getType*(uri: Uri): string
  proc getTypeAnonymous*(uri: Uri): string
  proc canonicalize*(url: Uri): Uri
  proc uncanonicalize*(url: Uri): Uri
  proc refresh*(uri: Uri, extras: Bundle, cancellationSignal: CancellationSignal): jboolean
  proc checkUriPermission*(uri: Uri, uid: jint, modeFlags: jint): jint
  proc rejectInsert*(uri: Uri, values: ContentValues): Uri
  proc insert*(uri: Uri, values: ContentValues): Uri
  proc insert*(uri: Uri, values: ContentValues, extras: Bundle): Uri
  proc bulkInsert*(uri: Uri, values: seq[ContentValues]): jint
  proc delete*(uri: Uri, selection: string, selectionArgs: seq[string]): jint
  proc delete*(uri: Uri, extras: Bundle): jint
  proc update*(uri: Uri, values: ContentValues, selection: string, selectionArgs: seq[string]): jint
  proc update*(uri: Uri, values: ContentValues, extras: Bundle): jint
  proc openFile*(uri: Uri, mode: string): ParcelFileDescriptor
  proc openFile*(uri: Uri, mode: string, signal: CancellationSignal): ParcelFileDescriptor
  proc openAssetFile*(uri: Uri, mode: string): AssetFileDescriptor
  proc openAssetFile*(uri: Uri, mode: string, signal: CancellationSignal): AssetFileDescriptor
  proc getStreamTypes*(uri: Uri, mimeTypeFilter: string): seq[string]
  proc openTypedAssetFile*(uri: Uri, mimeTypeFilter: string, opts: Bundle): AssetFileDescriptor
  proc openTypedAssetFile*(uri: Uri, mimeTypeFilter: string, opts: Bundle, signal: CancellationSignal): AssetFileDescriptor
  proc openPipeHelper*(uri: Uri, mimeType: string, opts: Bundle, args: T, func: PipeDataWriter[T]): ParcelFileDescriptor
  proc getIContentProvider*(): IContentProvider
  proc attachInfoForTesting*(context: Context, info: ProviderInfo)
  proc attachInfo*(context: Context, info: ProviderInfo)
  proc applyBatch*(authority: string, operations: ArrayList[ContentProviderOperation]): seq[ContentProviderResult]
  proc applyBatch*(operations: ArrayList[ContentProviderOperation]): seq[ContentProviderResult]
  proc call*(authority: string, method: string, arg: string, extras: Bundle): Bundle
  proc call*(method: string, arg: string, extras: Bundle): Bundle
  proc shutdown*()
  proc dump*(fd: FileDescriptor, writer: PrintWriter, args: seq[string])
  proc validateIncomingUri*(uri: Uri): Uri
  proc getUserIdFromAuthority*(auth: string, defaultUserId: jint): jint {.`static`.}
  proc getUserIdFromAuthority*(auth: string): jint {.`static`.}
  proc getUserIdFromUri*(uri: Uri, defaultUserId: jint): jint {.`static`.}
  proc getUserIdFromUri*(uri: Uri): jint {.`static`.}
  proc getUserHandleFromUri*(uri: Uri): UserHandle {.`static`.}
  proc getAuthorityWithoutUserId*(auth: string): string {.`static`.}
  proc getUriWithoutUserId*(uri: Uri): Uri {.`static`.}
  proc uriHasUserId*(uri: Uri): jboolean {.`static`.}
  proc createContentUriForUser*(contentUri: Uri, userHandle: UserHandle): Uri {.`static`.}
  proc maybeAddUserId*(uri: Uri, userId: jint): Uri {.`static`.}

jclass android.content.ContentProvider.PipeDataWriter* of JVMObject:
  proc writeDataToPipe*(output: ParcelFileDescriptor, uri: Uri, mimeType: string, opts: Bundle, args: T)

jclass android.content.CallingIdentity* of JVMObject:
  binderToken*: jlong
  callingAttributionSource*: AttributionSource

jclass android.content.PipeDataWriter* of JVMObject:
  proc writeDataToPipe*(output: ParcelFileDescriptor, uri: Uri, mimeType: string, opts: Bundle, args: T)

