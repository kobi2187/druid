import jnim

jclass android.provider.CloudMediaProvider* of ContentProvider:
  proc attachInfo*(context: Context, info: ProviderInfo)
  proc onGetAsyncContentProvider*(): Bundle
  proc onGetCapabilities*(): CloudMediaProviderContract.Capabilities
  proc onGetMediaCollectionInfo*(extras: Bundle): Bundle
  proc onQueryMedia*(extras: Bundle): Cursor
  proc onQueryDeletedMedia*(extras: Bundle): Cursor
  proc onQueryAlbums*(extras: Bundle): Cursor
  proc onQueryMediaCategories*(parentCategoryId: string, extras: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc onQueryMediaSets*(mediaCategoryId: string, extras: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc onQuerySearchSuggestions*(prefixText: string, extras: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc onQueryMediaInMediaSet*(mediaSetId: string, extras: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc onSearchMedia*(suggestedMediaSetId: string, fallbackSearchText: string, extras: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc onSearchMedia*(searchText: string, extras: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc onOpenPreview*(mediaId: string, size: Point, extras: Bundle, signal: CancellationSignal): AssetFileDescriptor
  proc onOpenMedia*(mediaId: string, extras: Bundle, signal: CancellationSignal): ParcelFileDescriptor
  proc onCreateCloudMediaSurfaceController*(config: Bundle, callback: CloudMediaSurfaceStateChangedCallback): CloudMediaSurfaceController
  proc call*(method: string, arg: string, extras: Bundle): Bundle
  proc openFile*(uri: Uri, mode: string): ParcelFileDescriptor
  proc openFile*(uri: Uri, mode: string, signal: CancellationSignal): ParcelFileDescriptor
  proc openTypedAssetFile*(uri: Uri, mimeTypeFilter: string, opts: Bundle): AssetFileDescriptor
  proc openTypedAssetFile*(uri: Uri, mimeTypeFilter: string, opts: Bundle, signal: CancellationSignal): AssetFileDescriptor
  proc query*(uri: Uri, projection: seq[string], queryArgs: Bundle, cancellationSignal: CancellationSignal): Cursor
  proc getType*(uri: Uri): string
  proc canonicalize*(uri: Uri): Uri
  proc query*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string): Cursor
  proc query*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string, cancellationSignal: CancellationSignal): Cursor
  proc insert*(uri: Uri, values: ContentValues): Uri
  proc delete*(uri: Uri, selection: string, selectionArgs: seq[string]): jint
  proc update*(uri: Uri, values: ContentValues, selection: string, selectionArgs: seq[string]): jint

jclass android.provider.CloudMediaProvider.CloudMediaSurfaceController* of JVMObject:
  proc onPlayerCreate*()
  proc onPlayerRelease*()
  proc onSurfaceCreated*(surfaceId: jint, surface: Surface, mediaId: string)
  proc onSurfaceChanged*(surfaceId: jint, format: jint, width: jint, height: jint)
  proc onSurfaceDestroyed*(surfaceId: jint)
  proc onMediaPlay*(surfaceId: jint)
  proc onMediaPause*(surfaceId: jint)
  proc onMediaSeekTo*(surfaceId: jint, timestampMillis: jlong)
  proc onConfigChange*(config: Bundle)
  proc onDestroy*()

jclass android.provider.CloudMediaProvider.CloudMediaSurfaceStateChangedCallback* of JVMObject:
  proc setPlaybackState*(surfaceId: jint, playbackState: jint, playbackStateInfo: Bundle)
  proc getIBinder*(): IBinder

jclass android.provider.CloudMediaProvider.CloudMediaSurfaceControllerWrapper* of JVMObject:
  proc onPlayerCreate*()
  proc onPlayerRelease*()
  proc onSurfaceCreated*(surfaceId: jint, surface: Surface, mediaId: string)
  proc onSurfaceChanged*(surfaceId: jint, format: jint, width: jint, height: jint)
  proc onSurfaceDestroyed*(surfaceId: jint)
  proc onMediaPlay*(surfaceId: jint)
  proc onMediaPause*(surfaceId: jint)
  proc onMediaSeekTo*(surfaceId: jint, timestampMillis: jlong)
  proc onConfigChange*(config: Bundle)
  proc onDestroy*()

jclass android.provider.CloudMediaSurfaceController* of JVMObject:
  proc onPlayerCreate*()
  proc onPlayerRelease*()
  proc onSurfaceCreated*(surfaceId: jint, surface: Surface, mediaId: string)
  proc onSurfaceChanged*(surfaceId: jint, format: jint, width: jint, height: jint)
  proc onSurfaceDestroyed*(surfaceId: jint)
  proc onMediaPlay*(surfaceId: jint)
  proc onMediaPause*(surfaceId: jint)
  proc onMediaSeekTo*(surfaceId: jint, timestampMillis: jlong)
  proc onConfigChange*(config: Bundle)
  proc onDestroy*()

jclass android.provider.CloudMediaSurfaceStateChangedCallback* of JVMObject:
  proc setPlaybackState*(surfaceId: jint, playbackState: jint, playbackStateInfo: Bundle)
  proc getIBinder*(): IBinder
  PLAYBACK_STATE_BUFFERING*: jint {.`static`.}
  PLAYBACK_STATE_READY*: jint {.`static`.}
  PLAYBACK_STATE_STARTED*: jint {.`static`.}
  PLAYBACK_STATE_PAUSED*: jint {.`static`.}
  PLAYBACK_STATE_COMPLETED*: jint {.`static`.}
  PLAYBACK_STATE_ERROR_RETRIABLE_FAILURE*: jint {.`static`.}
  PLAYBACK_STATE_ERROR_PERMANENT_FAILURE*: jint {.`static`.}
  PLAYBACK_STATE_MEDIA_SIZE_CHANGED*: jint {.`static`.}

jclass android.provider.CloudMediaSurfaceControllerWrapper* of Stub:
  proc onPlayerCreate*()
  proc onPlayerRelease*()
  proc onSurfaceCreated*(surfaceId: jint, surface: Surface, mediaId: string)
  proc onSurfaceChanged*(surfaceId: jint, format: jint, width: jint, height: jint)
  proc onSurfaceDestroyed*(surfaceId: jint)
  proc onMediaPlay*(surfaceId: jint)
  proc onMediaPause*(surfaceId: jint)
  proc onMediaSeekTo*(surfaceId: jint, timestampMillis: jlong)
  proc onConfigChange*(config: Bundle)
  proc onDestroy*()

