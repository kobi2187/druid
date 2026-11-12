import jnim

jclass android.provider.MediaStore* of JVMObject:
  proc getPickImagesMaxLimit*(): jint {.`static`.}
  proc setIncludePending*(uri: Uri): Uri {.`static`.}
  proc setIncludePending*(uriBuilder: Uri.Builder): Uri.Builder {.`static`.}
  proc getIncludePending*(uri: Uri): jboolean {.`static`.}
  proc setRequireOriginal*(uri: Uri): Uri {.`static`.}
  proc getRequireOriginal*(uri: Uri): jboolean {.`static`.}
  proc getOriginalMediaFormatFileDescriptor*(context: Context, fileDescriptor: ParcelFileDescriptor): ParcelFileDescriptor {.`static`.}
  proc rewriteToLegacy*(uri: Uri): Uri {.`static`.}
  proc startLegacyMigration*(resolver: ContentResolver, volumeName: string) {.`static`.}
  proc finishLegacyMigration*(resolver: ContentResolver, volumeName: string) {.`static`.}
  proc createWriteRequest*(resolver: ContentResolver, uris: Collection[Uri]): PendingIntent {.`static`.}
  proc createTrashRequest*(resolver: ContentResolver, uris: Collection[Uri], value: jboolean): PendingIntent {.`static`.}
  proc createFavoriteRequest*(resolver: ContentResolver, uris: Collection[Uri], value: jboolean): PendingIntent {.`static`.}
  proc markIsFavoriteStatus*(resolver: ContentResolver, uris: Collection[Uri], areFavorites: jboolean) {.`static`.}
  proc createDeleteRequest*(resolver: ContentResolver, uris: Collection[Uri]): PendingIntent {.`static`.}
  proc getVolumeName*(path: File): string {.`static`.}
  proc getExternalVolumeNames*(context: Context): Set[string] {.`static`.}
  proc openFileDescriptor*(resolver: ContentResolver, uri: Uri, mode: string, cancellationSignal: CancellationSignal): ParcelFileDescriptor {.`static`.}
  proc openAssetFileDescriptor*(resolver: ContentResolver, uri: Uri, mode: string, cancellationSignal: CancellationSignal): AssetFileDescriptor {.`static`.}
  proc openTypedAssetFileDescriptor*(resolver: ContentResolver, uri: Uri, mimeType: string, opts: Bundle, cancellationSignal: CancellationSignal): AssetFileDescriptor {.`static`.}
  proc getRecentExternalVolumeNames*(context: Context): Set[string] {.`static`.}
  proc getVolumeName*(uri: Uri): string {.`static`.}
  proc isKnownVolume*(volumeName: string): jboolean {.`static`.}
  proc checkArgumentVolumeName*(volumeName: string): string {.`static`.}
  proc getMediaScannerUri*(): Uri {.`static`.}
  proc getVersion*(context: Context): string {.`static`.}
  proc getVersion*(context: Context, volumeName: string): string {.`static`.}
  proc getGeneration*(context: Context, volumeName: string): jlong {.`static`.}
  proc getGeneration*(resolver: ContentResolver, volumeName: string): jlong {.`static`.}
  proc getDocumentUri*(context: Context, mediaUri: Uri): Uri {.`static`.}
  proc getMediaUri*(context: Context, documentUri: Uri): Uri {.`static`.}
  proc isCurrentSystemGallery*(resolver: ContentResolver, uid: jint, packageName: string): jboolean {.`static`.}
  proc getRedactedUri*(resolver: ContentResolver, uri: Uri): Uri {.`static`.}
  proc getRedactedUri*(resolver: ContentResolver, uris: List[Uri]): List[Uri] {.`static`.}
  proc resolvePlaylistMembers*(resolver: ContentResolver, playlistUri: Uri) {.`static`.}
  proc runIdleMaintenance*(resolver: ContentResolver) {.`static`.}
  proc setStableUrisFlag*(resolver: ContentResolver, volumeName: string, isEnabled: jboolean) {.`static`.}
  proc runIdleMaintenanceForStableUris*(resolver: ContentResolver) {.`static`.}
  proc readBackup*(resolver: ContentResolver, volumeName: string, filePath: string): string {.`static`.}
  proc getOwnerPackageName*(resolver: ContentResolver, ownerId: jint): string {.`static`.}
  proc deleteBackedUpFilePaths*(resolver: ContentResolver, volumeName: string) {.`static`.}
  proc getBackupFiles*(resolver: ContentResolver): seq[string] {.`static`.}
  proc getRecoveryData*(resolver: ContentResolver): seq[string] {.`static`.}
  proc removeRecoveryData*(resolver: ContentResolver) {.`static`.}
  proc waitForIdle*(resolver: ContentResolver) {.`static`.}
  proc scanFile*(resolver: ContentResolver, file: File): Uri {.`static`.}
  proc scanVolume*(resolver: ContentResolver, volumeName: string) {.`static`.}
  proc canManageMedia*(context: Context): jboolean {.`static`.}
  proc isCurrentCloudMediaProviderAuthority*(resolver: ContentResolver, authority: string): jboolean {.`static`.}
  proc isSupportedCloudMediaProviderAuthority*(resolver: ContentResolver, authority: string): jboolean {.`static`.}
  proc notifyCloudMediaChangedEvent*(resolver: ContentResolver, authority: string, currentMediaCollectionId: string) {.`static`.}
  proc getCurrentCloudProvider*(resolver: ContentResolver): string {.`static`.}
  proc grantMediaReadForPackage*(context: Context, packageUid: jint, uris: List[Uri]) {.`static`.}
  proc revokeAllMediaReadForPackages*(context: Context, packageUid: jint) {.`static`.}
  proc revokeMediaReadForPackages*(context: Context, packageUid: jint, uris: List[Uri]) {.`static`.}
  proc bulkUpdateOemMetadataInNextScan*(context: Context) {.`static`.}
  AUTHORITY*: string {.`static`.}
  AUTHORITY_URI*: Uri {.`static`.}
  AUTHORITY_LEGACY*: string {.`static`.}
  AUTHORITY_LEGACY_URI*: Uri {.`static`.}
  VOLUME_INTERNAL*: string {.`static`.}
  VOLUME_EXTERNAL*: string {.`static`.}
  VOLUME_EXTERNAL_PRIMARY*: string {.`static`.}
  VOLUME_DEMO*: string {.`static`.}
  RESOLVE_PLAYLIST_MEMBERS_CALL*: string {.`static`.}
  RUN_IDLE_MAINTENANCE_CALL*: string {.`static`.}
  WAIT_FOR_IDLE_CALL*: string {.`static`.}
  SCAN_FILE_CALL*: string {.`static`.}
  SCAN_VOLUME_CALL*: string {.`static`.}
  CREATE_WRITE_REQUEST_CALL*: string {.`static`.}
  CREATE_TRASH_REQUEST_CALL*: string {.`static`.}
  CREATE_FAVORITE_REQUEST_CALL*: string {.`static`.}
  MARK_MEDIA_AS_FAVORITE*: string {.`static`.}
  CREATE_DELETE_REQUEST_CALL*: string {.`static`.}
  GET_VERSION_CALL*: string {.`static`.}
  GET_GENERATION_CALL*: string {.`static`.}
  START_LEGACY_MIGRATION_CALL*: string {.`static`.}
  FINISH_LEGACY_MIGRATION_CALL*: string {.`static`.}
  EXTERNAL_STORAGE_PROVIDER_AUTHORITY*: string {.`static`.}
  GET_DOCUMENT_URI_CALL*: string {.`static`.}
  GET_MEDIA_URI_CALL*: string {.`static`.}
  ENSURE_PROVIDERS_CALL*: string {.`static`.}
  GET_REDACTED_MEDIA_URI_CALL*: string {.`static`.}
  GET_REDACTED_MEDIA_URI_LIST_CALL*: string {.`static`.}
  EXTRA_URI_LIST*: string {.`static`.}
  QUERY_ARG_REDACTED_URI*: string {.`static`.}
  EXTRA_URI*: string {.`static`.}
  EXTRA_URI_PERMISSIONS*: string {.`static`.}
  EXTRA_CLIP_DATA*: string {.`static`.}
  EXTRA_CONTENT_VALUES*: string {.`static`.}
  EXTRA_RESULT*: string {.`static`.}
  EXTRA_FILE_DESCRIPTOR*: string {.`static`.}
  EXTRA_LOCAL_PROVIDER*: string {.`static`.}
  EXTRA_IS_STABLE_URIS_ENABLED*: string {.`static`.}
  IS_SYSTEM_GALLERY_CALL*: string {.`static`.}
  EXTRA_IS_SYSTEM_GALLERY_UID*: string {.`static`.}
  EXTRA_IS_SYSTEM_GALLERY_RESPONSE*: string {.`static`.}
  IS_CURRENT_CLOUD_PROVIDER_CALL*: string {.`static`.}
  IS_SUPPORTED_CLOUD_PROVIDER_CALL*: string {.`static`.}
  NOTIFY_CLOUD_MEDIA_CHANGED_EVENT_CALL*: string {.`static`.}
  SYNC_PROVIDERS_CALL*: string {.`static`.}
  GET_CLOUD_PROVIDER_CALL*: string {.`static`.}
  GET_CLOUD_PROVIDER_RESULT*: string {.`static`.}
  GET_CLOUD_PROVIDER_LABEL_CALL*: string {.`static`.}
  SET_CLOUD_PROVIDER_RESULT*: string {.`static`.}
  SET_CLOUD_PROVIDER_CALL*: string {.`static`.}
  EXTRA_CLOUD_PROVIDER*: string {.`static`.}
  EXTRA_CLOUD_PROVIDER_RESULT*: string {.`static`.}
  GET_CLOUD_PROVIDER_DETAILS*: string {.`static`.}
  GET_CLOUD_PROVIDER_DETAILS_RESULT*: string {.`static`.}
  CREATE_SURFACE_CONTROLLER*: string {.`static`.}
  GRANT_MEDIA_READ_FOR_PACKAGE_CALL*: string {.`static`.}
  REVOKE_READ_GRANT_FOR_PACKAGE_CALL*: string {.`static`.}
  REVOKED_ALL_READ_GRANTS_FOR_PACKAGE_CALL*: string {.`static`.}
  BULK_UPDATE_OEM_METADATA_CALL*: string {.`static`.}
  OPEN_FILE_CALL*: string {.`static`.}
  EXTRA_OPEN_FILE_REQUEST*: string {.`static`.}
  OPEN_ASSET_FILE_CALL*: string {.`static`.}
  EXTRA_OPEN_ASSET_FILE_REQUEST*: string {.`static`.}
  CREATE_CANCELLATION_SIGNAL_CALL*: string {.`static`.}
  CREATE_CANCELLATION_SIGNAL_RESULT*: string {.`static`.}
  USES_FUSE_PASSTHROUGH*: string {.`static`.}
  USES_FUSE_PASSTHROUGH_RESULT*: string {.`static`.}
  PICKER_MEDIA_INIT_CALL*: string {.`static`.}
  PICKER_INTERNAL_SEARCH_MEDIA_INIT_CALL*: string {.`static`.}
  PICKER_MEDIA_SETS_INIT_CALL*: string {.`static`.}
  PICKER_MEDIA_IN_MEDIA_SET_INIT_CALL*: string {.`static`.}
  PICKER_GET_SEARCH_PROVIDERS_CALL*: string {.`static`.}
  PICKER_TRANSCODE_CALL*: string {.`static`.}
  PICKER_TRANSCODE_RESULT*: string {.`static`.}
  EXTRA_LOCAL_ONLY*: string {.`static`.}
  EXTRA_ALBUM_ID*: string {.`static`.}
  EXTRA_ALBUM_AUTHORITY*: string {.`static`.}
  EXTRA_CALLING_PACKAGE_UID*: string {.`static`.}
  SET_STABLE_URIS_FLAG*: string {.`static`.}
  RUN_IDLE_MAINTENANCE_FOR_STABLE_URIS*: string {.`static`.}
  READ_BACKUP*: string {.`static`.}
  GET_OWNER_PACKAGE_NAME*: string {.`static`.}
  GET_BACKUP_FILES*: string {.`static`.}
  GET_RECOVERY_DATA*: string {.`static`.}
  REMOVE_RECOVERY_DATA*: string {.`static`.}
  DELETE_BACKED_UP_FILE_PATHS*: string {.`static`.}
  QUERY_ARG_MIME_TYPE*: string {.`static`.}
  QUERY_ARG_SIZE_BYTES*: string {.`static`.}
  QUERY_ARG_ALBUM_ID*: string {.`static`.}
  QUERY_ARG_ALBUM_AUTHORITY*: string {.`static`.}
  PARAM_DELETE_DATA*: string {.`static`.}
  PARAM_INCLUDE_PENDING*: string {.`static`.}
  PARAM_PROGRESS*: string {.`static`.}
  PARAM_REQUIRE_ORIGINAL*: string {.`static`.}
  PARAM_LIMIT*: string {.`static`.}
  MY_USER_ID*: jint {.`static`.}
  MY_UID*: jint {.`static`.}
  PER_USER_RANGE*: jint {.`static`.}
  INTENT_ACTION_MUSIC_PLAYER*: string {.`static`.}
  INTENT_ACTION_MEDIA_SEARCH*: string {.`static`.}
  INTENT_ACTION_MEDIA_PLAY_FROM_SEARCH*: string {.`static`.}
  INTENT_ACTION_TEXT_OPEN_FROM_SEARCH*: string {.`static`.}
  INTENT_ACTION_VIDEO_PLAY_FROM_SEARCH*: string {.`static`.}
  EXTRA_MEDIA_ARTIST*: string {.`static`.}
  EXTRA_MEDIA_ALBUM*: string {.`static`.}
  EXTRA_MEDIA_TITLE*: string {.`static`.}
  EXTRA_MEDIA_GENRE*: string {.`static`.}
  EXTRA_MEDIA_PLAYLIST*: string {.`static`.}
  EXTRA_MEDIA_RADIO_CHANNEL*: string {.`static`.}
  EXTRA_MEDIA_FOCUS*: string {.`static`.}
  EXTRA_SCREEN_ORIENTATION*: string {.`static`.}
  EXTRA_FULL_SCREEN*: string {.`static`.}
  EXTRA_SHOW_ACTION_ICONS*: string {.`static`.}
  EXTRA_FINISH_ON_COMPLETION*: string {.`static`.}
  INTENT_ACTION_STILL_IMAGE_CAMERA*: string {.`static`.}
  META_DATA_STILL_IMAGE_CAMERA_PREWARM_SERVICE*: string {.`static`.}
  META_DATA_REVIEW_GALLERY_PREWARM_SERVICE*: string {.`static`.}
  INTENT_ACTION_STILL_IMAGE_CAMERA_SECURE*: string {.`static`.}
  INTENT_ACTION_VIDEO_CAMERA*: string {.`static`.}
  ACTION_IMAGE_CAPTURE*: string {.`static`.}
  ACTION_IMAGE_CAPTURE_SECURE*: string {.`static`.}
  ACTION_MOTION_PHOTO_CAPTURE*: string {.`static`.}
  ACTION_MOTION_PHOTO_CAPTURE_SECURE*: string {.`static`.}
  ACTION_VIDEO_CAPTURE*: string {.`static`.}
  ACTION_REVIEW*: string {.`static`.}
  ACTION_REVIEW_SECURE*: string {.`static`.}
  EXTRA_BRIGHTNESS*: string {.`static`.}
  EXTRA_VIDEO_QUALITY*: string {.`static`.}
  EXTRA_SIZE_LIMIT*: string {.`static`.}
  EXTRA_DURATION_LIMIT*: string {.`static`.}
  EXTRA_OUTPUT*: string {.`static`.}
  ACTION_PICK_IMAGES*: string {.`static`.}
  ACTION_USER_SELECT_IMAGES_FOR_APP*: string {.`static`.}
  ACTION_PICK_IMAGES_SETTINGS*: string {.`static`.}
  EXTRA_PICK_IMAGES_IN_ORDER*: string {.`static`.}
  EXTRA_PICK_IMAGES_MAX*: string {.`static`.}
  EXTRA_PICK_IMAGES_ACCENT_COLOR*: string {.`static`.}
  EXTRA_PICK_IMAGES_LAUNCH_TAB*: string {.`static`.}
  PICK_IMAGES_TAB_ALBUMS*: jint {.`static`.}
  PICK_IMAGES_TAB_IMAGES*: jint {.`static`.}
  EXTRA_ACCEPT_ORIGINAL_MEDIA_FORMAT*: string {.`static`.}
  EXTRA_MEDIA_CAPABILITIES*: string {.`static`.}
  EXTRA_MEDIA_CAPABILITIES_UID*: string {.`static`.}
  EXTRA_PICKER_PRE_SELECTION_URIS*: string {.`static`.}
  EXTRA_MODE*: string {.`static`.}
  UNKNOWN_STRING*: string {.`static`.}
  QUERY_ARG_RELATED_URI*: string {.`static`.}
  QUERY_ARG_ALLOW_MOVEMENT*: string {.`static`.}
  QUERY_ARG_DEFER_SCAN*: string {.`static`.}
  QUERY_ARG_INCLUDE_RECENTLY_UNMOUNTED_VOLUMES*: string {.`static`.}
  QUERY_ARG_MATCH_PENDING*: string {.`static`.}
  QUERY_ARG_MATCH_TRASHED*: string {.`static`.}
  QUERY_ARG_MATCH_FAVORITE*: string {.`static`.}
  QUERY_ARG_LATEST_SELECTION_ONLY*: string {.`static`.}
  QUERY_ARG_MEDIA_STANDARD_SORT_ORDER*: string {.`static`.}
  ACCESS_MEDIA_OWNER_PACKAGE_NAME_PERMISSION*: string {.`static`.}
  ACCESS_OEM_METADATA_PERMISSION*: string {.`static`.}
  UPDATE_OEM_METADATA_PERMISSION*: string {.`static`.}
  MATCH_DEFAULT*: jint {.`static`.}
  MATCH_INCLUDE*: jint {.`static`.}
  MATCH_EXCLUDE*: jint {.`static`.}
  MATCH_ONLY*: jint {.`static`.}
  MEDIA_SCANNER_VOLUME*: string {.`static`.}
  MEDIA_IGNORE_FILENAME*: string {.`static`.}

jclass android.provider.MediaStore.Files* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUri*(volumeName: string, rowId: jlong): Uri {.`static`.}
  proc getMtpObjectsUri*(volumeName: string): Uri {.`static`.}
  proc getMtpObjectsUri*(volumeName: string, fileId: jlong): Uri {.`static`.}
  proc getMtpReferencesUri*(volumeName: string, fileId: jlong): Uri {.`static`.}
  proc getDirectoryUri*(volumeName: string): Uri {.`static`.}
  proc getContentUriForPath*(path: string): Uri {.`static`.}

jclass android.provider.MediaStore.ThumbnailConstants* of JVMObject:
  proc getKindSize*(kind: jint): Size {.`static`.}

jclass android.provider.MediaStore.Downloads* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUri*(volumeName: string, id: jlong): Uri {.`static`.}
  proc getContentUriForPath*(path: string): Uri {.`static`.}

jclass android.provider.MediaStore.Audio* of JVMObject:
  proc keyFor*(name: string): string {.`static`.}

jclass android.provider.MediaStore.Video* of JVMObject:
  proc query*(cr: ContentResolver, uri: Uri, projection: seq[string]): Cursor {.`static`.}

jclass android.provider.MediaColumns* of BaseColumns:
  DATA*: string {.`static`.}
  SIZE*: string {.`static`.}
  DISPLAY_NAME*: string {.`static`.}
  DATE_ADDED*: string {.`static`.}
  DATE_MODIFIED*: string {.`static`.}
  DATE_TAKEN*: string {.`static`.}
  INFERRED_DATE*: string {.`static`.}
  MIME_TYPE*: string {.`static`.}
  IS_DRM*: string {.`static`.}
  IS_PENDING*: string {.`static`.}
  IS_TRASHED*: string {.`static`.}
  DATE_EXPIRES*: string {.`static`.}
  WIDTH*: string {.`static`.}
  HEIGHT*: string {.`static`.}
  RESOLUTION*: string {.`static`.}
  OWNER_PACKAGE_NAME*: string {.`static`.}
  VOLUME_NAME*: string {.`static`.}
  RELATIVE_PATH*: string {.`static`.}
  BUCKET_ID*: string {.`static`.}
  BUCKET_DISPLAY_NAME*: string {.`static`.}
  GROUP_ID*: string {.`static`.}
  DOCUMENT_ID*: string {.`static`.}
  INSTANCE_ID*: string {.`static`.}
  ORIGINAL_DOCUMENT_ID*: string {.`static`.}
  ORIENTATION*: string {.`static`.}
  IS_FAVORITE*: string {.`static`.}
  IS_DOWNLOAD*: string {.`static`.}
  GENERATION_ADDED*: string {.`static`.}
  GENERATION_MODIFIED*: string {.`static`.}
  GENERATION_MODIFIED_UNCHANGED*: jint {.`static`.}
  XMP*: string {.`static`.}
  CD_TRACK_NUMBER*: string {.`static`.}
  ALBUM*: string {.`static`.}
  ARTIST*: string {.`static`.}
  AUTHOR*: string {.`static`.}
  COMPOSER*: string {.`static`.}
  GENRE*: string {.`static`.}
  TITLE*: string {.`static`.}
  YEAR*: string {.`static`.}
  DURATION*: string {.`static`.}
  NUM_TRACKS*: string {.`static`.}
  WRITER*: string {.`static`.}
  ALBUM_ARTIST*: string {.`static`.}
  DISC_NUMBER*: string {.`static`.}
  COMPILATION*: string {.`static`.}
  BITRATE*: string {.`static`.}
  CAPTURE_FRAMERATE*: string {.`static`.}
  OEM_METADATA*: string {.`static`.}

jclass android.provider.PickerMediaColumns* of JVMObject:
  DATA*: string {.`static`.}
  SIZE*: string {.`static`.}
  DISPLAY_NAME*: string {.`static`.}
  DATE_TAKEN*: string {.`static`.}
  MIME_TYPE*: string {.`static`.}
  DURATION_MILLIS*: string {.`static`.}
  WIDTH*: string {.`static`.}
  HEIGHT*: string {.`static`.}
  ORIENTATION*: string {.`static`.}

jclass android.provider.Files* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUri*(volumeName: string, rowId: jlong): Uri {.`static`.}
  proc getMtpObjectsUri*(volumeName: string): Uri {.`static`.}
  proc getMtpObjectsUri*(volumeName: string, fileId: jlong): Uri {.`static`.}
  proc getMtpReferencesUri*(volumeName: string, fileId: jlong): Uri {.`static`.}
  proc getDirectoryUri*(volumeName: string): Uri {.`static`.}
  proc getContentUriForPath*(path: string): Uri {.`static`.}
  TABLE*: string {.`static`.}
  EXTERNAL_CONTENT_URI*: Uri {.`static`.}

jclass android.provider.FileColumns* of MediaColumns:
  STORAGE_ID*: string {.`static`.}
  FORMAT*: string {.`static`.}
  PARENT*: string {.`static`.}
  MIME_TYPE*: string {.`static`.}
  TITLE*: string {.`static`.}
  MEDIA_TYPE*: string {.`static`.}
  MEDIA_TYPE_NONE*: jint {.`static`.}
  MEDIA_TYPE_IMAGE*: jint {.`static`.}
  MEDIA_TYPE_AUDIO*: jint {.`static`.}
  MEDIA_TYPE_VIDEO*: jint {.`static`.}
  MEDIA_TYPE_PLAYLIST*: jint {.`static`.}
  MEDIA_TYPE_SUBTITLE*: jint {.`static`.}
  MEDIA_TYPE_DOCUMENT*: jint {.`static`.}
  MEDIA_TYPE_COUNT*: jint {.`static`.}
  _MODIFIER*: string {.`static`.}
  _MODIFIER_FUSE*: jint {.`static`.}
  _MODIFIER_CR*: jint {.`static`.}
  _MODIFIER_MEDIA_SCAN*: jint {.`static`.}
  _MODIFIER_CR_PENDING_METADATA*: jint {.`static`.}
  _MODIFIER_SCHEMA_UPDATE*: jint {.`static`.}
  _TRANSCODE_STATUS*: string {.`static`.}
  TRANSCODE_EMPTY*: jint {.`static`.}
  TRANSCODE_COMPLETE*: jint {.`static`.}
  _VIDEO_CODEC_TYPE*: string {.`static`.}
  REDACTED_URI_ID*: string {.`static`.}
  _USER_ID*: string {.`static`.}
  _SPECIAL_FORMAT*: string {.`static`.}
  _SPECIAL_FORMAT_NONE*: jint {.`static`.}
  _SPECIAL_FORMAT_GIF*: jint {.`static`.}
  _SPECIAL_FORMAT_MOTION_PHOTO*: jint {.`static`.}
  _SPECIAL_FORMAT_ANIMATED_WEBP*: jint {.`static`.}

jclass android.provider.ThumbnailConstants* of JVMObject:
  proc getKindSize*(kind: jint): Size {.`static`.}
  MINI_KIND*: jint {.`static`.}
  FULL_SCREEN_KIND*: jint {.`static`.}
  MICRO_KIND*: jint {.`static`.}
  MINI_SIZE*: Size {.`static`.}
  FULL_SCREEN_SIZE*: Size {.`static`.}
  MICRO_SIZE*: Size {.`static`.}

jclass android.provider.DownloadColumns* of MediaColumns:

jclass android.provider.Downloads* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUri*(volumeName: string, id: jlong): Uri {.`static`.}
  proc getContentUriForPath*(path: string): Uri {.`static`.}
  INTERNAL_CONTENT_URI*: Uri {.`static`.}
  EXTERNAL_CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}

jclass android.provider.Images.Media* of JVMObject:
  proc query*(cr: ContentResolver, uri: Uri, projection: seq[string]): Cursor {.`static`.}
  proc query*(cr: ContentResolver, uri: Uri, projection: seq[string], where: string, orderBy: string): Cursor {.`static`.}
  proc query*(cr: ContentResolver, uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], orderBy: string): Cursor {.`static`.}
  proc getBitmap*(cr: ContentResolver, url: Uri): Bitmap {.`static`.}
  proc insertImage*(cr: ContentResolver, imagePath: string, name: string, description: string): string {.`static`.}
  proc insertImage*(cr: ContentResolver, source: Bitmap, title: string, description: string): string {.`static`.}
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUri*(volumeName: string, id: jlong): Uri {.`static`.}

jclass android.provider.Images.Thumbnails* of JVMObject:
  proc query*(cr: ContentResolver, uri: Uri, projection: seq[string]): Cursor {.`static`.}
  proc queryMiniThumbnails*(cr: ContentResolver, uri: Uri, kind: jint, projection: seq[string]): Cursor {.`static`.}
  proc queryMiniThumbnail*(cr: ContentResolver, origId: jlong, kind: jint, projection: seq[string]): Cursor {.`static`.}
  proc cancelThumbnailRequest*(cr: ContentResolver, origId: jlong) {.`static`.}
  proc getThumbnail*(cr: ContentResolver, imageId: jlong, kind: jint, options: BitmapFactory.Options): Bitmap {.`static`.}
  proc cancelThumbnailRequest*(cr: ContentResolver, origId: jlong, groupId: jlong) {.`static`.}
  proc getThumbnail*(cr: ContentResolver, imageId: jlong, groupId: jlong, kind: jint, options: BitmapFactory.Options): Bitmap {.`static`.}
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getKindSize*(kind: jint): Size {.`static`.}

jclass android.provider.ImageColumns* of MediaColumns:
  PICASA_ID*: string {.`static`.}
  IS_PRIVATE*: string {.`static`.}
  LATITUDE*: string {.`static`.}
  LONGITUDE*: string {.`static`.}
  DATE_TAKEN*: string {.`static`.}
  ORIENTATION*: string {.`static`.}
  MINI_THUMB_MAGIC*: string {.`static`.}
  BUCKET_ID*: string {.`static`.}
  BUCKET_DISPLAY_NAME*: string {.`static`.}
  GROUP_ID*: string {.`static`.}
  DESCRIPTION*: string {.`static`.}
  EXPOSURE_TIME*: string {.`static`.}
  F_NUMBER*: string {.`static`.}
  ISO*: string {.`static`.}
  SCENE_CAPTURE_TYPE*: string {.`static`.}

jclass android.provider.Media* of JVMObject:
  proc query*(cr: ContentResolver, uri: Uri, projection: seq[string]): Cursor {.`static`.}
  proc query*(cr: ContentResolver, uri: Uri, projection: seq[string], where: string, orderBy: string): Cursor {.`static`.}
  proc query*(cr: ContentResolver, uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], orderBy: string): Cursor {.`static`.}
  proc getBitmap*(cr: ContentResolver, url: Uri): Bitmap {.`static`.}
  proc insertImage*(cr: ContentResolver, imagePath: string, name: string, description: string): string {.`static`.}
  proc insertImage*(cr: ContentResolver, source: Bitmap, title: string, description: string): string {.`static`.}
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUri*(volumeName: string, id: jlong): Uri {.`static`.}
  INTERNAL_CONTENT_URI*: Uri {.`static`.}
  EXTERNAL_CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Thumbnails* of JVMObject:
  proc query*(cr: ContentResolver, uri: Uri, projection: seq[string]): Cursor {.`static`.}
  proc queryMiniThumbnails*(cr: ContentResolver, uri: Uri, kind: jint, projection: seq[string]): Cursor {.`static`.}
  proc queryMiniThumbnail*(cr: ContentResolver, origId: jlong, kind: jint, projection: seq[string]): Cursor {.`static`.}
  proc cancelThumbnailRequest*(cr: ContentResolver, origId: jlong) {.`static`.}
  proc getThumbnail*(cr: ContentResolver, imageId: jlong, kind: jint, options: BitmapFactory.Options): Bitmap {.`static`.}
  proc cancelThumbnailRequest*(cr: ContentResolver, origId: jlong, groupId: jlong) {.`static`.}
  proc getThumbnail*(cr: ContentResolver, imageId: jlong, groupId: jlong, kind: jint, options: BitmapFactory.Options): Bitmap {.`static`.}
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getKindSize*(kind: jint): Size {.`static`.}
  INTERNAL_CONTENT_URI*: Uri {.`static`.}
  EXTERNAL_CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  DATA*: string {.`static`.}
  IMAGE_ID*: string {.`static`.}
  KIND*: string {.`static`.}
  MINI_KIND*: jint {.`static`.}
  FULL_SCREEN_KIND*: jint {.`static`.}
  MICRO_KIND*: jint {.`static`.}
  THUMB_DATA*: string {.`static`.}
  WIDTH*: string {.`static`.}
  HEIGHT*: string {.`static`.}

jclass android.provider.Audio* of JVMObject:
  proc keyFor*(name: string): string {.`static`.}

jclass android.provider.Audio.Media* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUri*(volumeName: string, id: jlong): Uri {.`static`.}
  proc getContentUriForPath*(path: string): Uri {.`static`.}

jclass android.provider.Audio.Genres* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUriForAudioId*(volumeName: string, audioId: jint): Uri {.`static`.}

jclass android.provider.Audio.Playlists* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}

jclass android.provider.Audio.Artists* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}

jclass android.provider.Audio.Albums* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}

jclass android.provider.AudioColumns* of MediaColumns:
  TITLE_KEY*: string {.`static`.}
  DURATION*: string {.`static`.}
  BOOKMARK*: string {.`static`.}
  ARTIST_ID*: string {.`static`.}
  ARTIST*: string {.`static`.}
  ALBUM_ARTIST*: string {.`static`.}
  ARTIST_KEY*: string {.`static`.}
  COMPOSER*: string {.`static`.}
  ALBUM_ID*: string {.`static`.}
  ALBUM*: string {.`static`.}
  ALBUM_KEY*: string {.`static`.}
  TRACK*: string {.`static`.}
  YEAR*: string {.`static`.}
  IS_MUSIC*: string {.`static`.}
  IS_PODCAST*: string {.`static`.}
  IS_RINGTONE*: string {.`static`.}
  IS_ALARM*: string {.`static`.}
  IS_NOTIFICATION*: string {.`static`.}
  IS_AUDIOBOOK*: string {.`static`.}
  IS_RECORDING*: string {.`static`.}
  GENRE_ID*: string {.`static`.}
  GENRE*: string {.`static`.}
  GENRE_KEY*: string {.`static`.}
  TITLE_RESOURCE_URI*: string {.`static`.}
  BITS_PER_SAMPLE*: string {.`static`.}
  SAMPLERATE*: string {.`static`.}

jclass android.provider.Media* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUri*(volumeName: string, id: jlong): Uri {.`static`.}
  proc getContentUriForPath*(path: string): Uri {.`static`.}
  INTERNAL_CONTENT_URI*: Uri {.`static`.}
  EXTERNAL_CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  ENTRY_CONTENT_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  RECORD_SOUND_ACTION*: string {.`static`.}
  EXTRA_MAX_BYTES*: string {.`static`.}

jclass android.provider.GenresColumns* of JVMObject:
  NAME*: string {.`static`.}

jclass android.provider.Genres* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUriForAudioId*(volumeName: string, audioId: jint): Uri {.`static`.}
  INTERNAL_CONTENT_URI*: Uri {.`static`.}
  EXTERNAL_CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  ENTRY_CONTENT_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Genres.Members* of JVMObject:
  proc getContentUri*(volumeName: string, genreId: jlong): Uri {.`static`.}

jclass android.provider.Members* of JVMObject:
  proc getContentUri*(volumeName: string, genreId: jlong): Uri {.`static`.}
  CONTENT_DIRECTORY*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  AUDIO_ID*: string {.`static`.}
  GENRE_ID*: string {.`static`.}

jclass android.provider.PlaylistsColumns* of MediaColumns:
  NAME*: string {.`static`.}
  DATA*: string {.`static`.}
  DATE_ADDED*: string {.`static`.}
  DATE_MODIFIED*: string {.`static`.}

jclass android.provider.Playlists* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  INTERNAL_CONTENT_URI*: Uri {.`static`.}
  EXTERNAL_CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  ENTRY_CONTENT_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Playlists.Members* of JVMObject:
  proc getContentUri*(volumeName: string, playlistId: jlong): Uri {.`static`.}
  proc moveItem*(res: ContentResolver, playlistId: jlong, from: jint, to: jint): jboolean {.`static`.}

jclass android.provider.Members* of JVMObject:
  proc getContentUri*(volumeName: string, playlistId: jlong): Uri {.`static`.}
  proc moveItem*(res: ContentResolver, playlistId: jlong, from: jint, to: jint): jboolean {.`static`.}
  _ID*: string {.`static`.}
  CONTENT_DIRECTORY*: string {.`static`.}
  AUDIO_ID*: string {.`static`.}
  PLAYLIST_ID*: string {.`static`.}
  PLAY_ORDER*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.ArtistColumns* of JVMObject:
  ARTIST*: string {.`static`.}
  ARTIST_KEY*: string {.`static`.}
  NUMBER_OF_ALBUMS*: string {.`static`.}
  NUMBER_OF_TRACKS*: string {.`static`.}

jclass android.provider.Artists* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  INTERNAL_CONTENT_URI*: Uri {.`static`.}
  EXTERNAL_CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  ENTRY_CONTENT_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Artists.Albums* of JVMObject:
  proc getContentUri*(volumeName: string, artistId: jlong): Uri {.`static`.}

jclass android.provider.Albums* of JVMObject:
  proc getContentUri*(volumeName: string, artistId: jlong): Uri {.`static`.}

jclass android.provider.AlbumColumns* of JVMObject:
  ALBUM_ID*: string {.`static`.}
  ALBUM*: string {.`static`.}
  ARTIST_ID*: string {.`static`.}
  ARTIST*: string {.`static`.}
  ARTIST_KEY*: string {.`static`.}
  NUMBER_OF_SONGS*: string {.`static`.}
  NUMBER_OF_SONGS_FOR_ARTIST*: string {.`static`.}
  FIRST_YEAR*: string {.`static`.}
  LAST_YEAR*: string {.`static`.}
  ALBUM_KEY*: string {.`static`.}
  ALBUM_ART*: string {.`static`.}

jclass android.provider.Albums* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  INTERNAL_CONTENT_URI*: Uri {.`static`.}
  EXTERNAL_CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  ENTRY_CONTENT_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Radio* of JVMObject:
  ENTRY_CONTENT_TYPE*: string {.`static`.}

jclass android.provider.Thumbnails* of JVMObject:
  DATA*: string {.`static`.}
  ALBUM_ID*: string {.`static`.}

jclass android.provider.Video* of JVMObject:
  proc query*(cr: ContentResolver, uri: Uri, projection: seq[string]): Cursor {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Video.Media* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUri*(volumeName: string, id: jlong): Uri {.`static`.}

jclass android.provider.Video.Thumbnails* of JVMObject:
  proc cancelThumbnailRequest*(cr: ContentResolver, origId: jlong) {.`static`.}
  proc getThumbnail*(cr: ContentResolver, videoId: jlong, kind: jint, options: BitmapFactory.Options): Bitmap {.`static`.}
  proc cancelThumbnailRequest*(cr: ContentResolver, videoId: jlong, groupId: jlong) {.`static`.}
  proc getThumbnail*(cr: ContentResolver, videoId: jlong, groupId: jlong, kind: jint, options: BitmapFactory.Options): Bitmap {.`static`.}
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getKindSize*(kind: jint): Size {.`static`.}

jclass android.provider.VideoColumns* of MediaColumns:
  DURATION*: string {.`static`.}
  ARTIST*: string {.`static`.}
  ALBUM*: string {.`static`.}
  RESOLUTION*: string {.`static`.}
  DESCRIPTION*: string {.`static`.}
  IS_PRIVATE*: string {.`static`.}
  TAGS*: string {.`static`.}
  CATEGORY*: string {.`static`.}
  LANGUAGE*: string {.`static`.}
  LATITUDE*: string {.`static`.}
  LONGITUDE*: string {.`static`.}
  DATE_TAKEN*: string {.`static`.}
  MINI_THUMB_MAGIC*: string {.`static`.}
  BUCKET_ID*: string {.`static`.}
  BUCKET_DISPLAY_NAME*: string {.`static`.}
  GROUP_ID*: string {.`static`.}
  BOOKMARK*: string {.`static`.}
  COLOR_STANDARD*: string {.`static`.}
  COLOR_TRANSFER*: string {.`static`.}
  COLOR_RANGE*: string {.`static`.}

jclass android.provider.Media* of JVMObject:
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getContentUri*(volumeName: string, id: jlong): Uri {.`static`.}
  INTERNAL_CONTENT_URI*: Uri {.`static`.}
  EXTERNAL_CONTENT_URI*: Uri {.`static`.}
  CONTENT_TYPE*: string {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}

jclass android.provider.Thumbnails* of JVMObject:
  proc cancelThumbnailRequest*(cr: ContentResolver, origId: jlong) {.`static`.}
  proc getThumbnail*(cr: ContentResolver, videoId: jlong, kind: jint, options: BitmapFactory.Options): Bitmap {.`static`.}
  proc cancelThumbnailRequest*(cr: ContentResolver, videoId: jlong, groupId: jlong) {.`static`.}
  proc getThumbnail*(cr: ContentResolver, videoId: jlong, groupId: jlong, kind: jint, options: BitmapFactory.Options): Bitmap {.`static`.}
  proc getContentUri*(volumeName: string): Uri {.`static`.}
  proc getKindSize*(kind: jint): Size {.`static`.}
  INTERNAL_CONTENT_URI*: Uri {.`static`.}
  EXTERNAL_CONTENT_URI*: Uri {.`static`.}
  DEFAULT_SORT_ORDER*: string {.`static`.}
  DATA*: string {.`static`.}
  VIDEO_ID*: string {.`static`.}
  KIND*: string {.`static`.}
  MINI_KIND*: jint {.`static`.}
  FULL_SCREEN_KIND*: jint {.`static`.}
  MICRO_KIND*: jint {.`static`.}
  WIDTH*: string {.`static`.}
  HEIGHT*: string {.`static`.}

