import jnim

jclass android.os.Environment* of JVMObject:
  proc initForCurrentUser*() {.`static`.}
  proc getRootDirectory*(): File {.`static`.}
  proc getStorageDirectory*(): File {.`static`.}
  proc getOemDirectory*(): File {.`static`.}
  proc getOdmDirectory*(): File {.`static`.}
  proc getVendorDirectory*(): File {.`static`.}
  proc getProductDirectory*(): File {.`static`.}
  proc getProductServicesDirectory*(): File {.`static`.}
  proc getSystemExtDirectory*(): File {.`static`.}
  proc getApexDirectory*(): File {.`static`.}
  proc getUserSystemDirectory*(userId: jint): File {.`static`.}
  proc getUserConfigDirectory*(userId: jint): File {.`static`.}
  proc getDataDirectory*(): File {.`static`.}
  proc getDataDirectoryPath*(): string {.`static`.}
  proc getDataDirectory*(volumeUuid: string): File {.`static`.}
  proc getDataDirectoryPath*(volumeUuid: string): string {.`static`.}
  proc getExpandDirectory*(): File {.`static`.}
  proc getDataSystemDirectory*(): File {.`static`.}
  proc getDataSystemDeviceProtectedDirectory*(): File {.`static`.}
  proc getDataSystemDeDirectory*(): File {.`static`.}
  proc getDataSystemCeDirectory*(): File {.`static`.}
  proc getDataSystemCeDirectory*(userId: jint): File {.`static`.}
  proc getDataSystemDeDirectory*(userId: jint): File {.`static`.}
  proc getDataMiscDirectory*(): File {.`static`.}
  proc getDataMiscCeDirectory*(): File {.`static`.}
  proc getDataMiscCeDirectory*(userId: jint): File {.`static`.}
  proc getDataMiscCeSharedSdkSandboxDirectory*(volumeUuid: string, userId: jint, packageName: string): File {.`static`.}
  proc getDataMiscDeDirectory*(userId: jint): File {.`static`.}
  proc getDataMiscDeSharedSdkSandboxDirectory*(volumeUuid: string, userId: jint, packageName: string): File {.`static`.}
  proc getDataVendorCeDirectory*(userId: jint): File {.`static`.}
  proc getDataVendorDeDirectory*(userId: jint): File {.`static`.}
  proc getDataRefProfilesDePackageDirectory*(packageName: string): File {.`static`.}
  proc getDataProfilesDePackageDirectory*(userId: jint, packageName: string): File {.`static`.}
  proc getDataAppDirectory*(volumeUuid: string): File {.`static`.}
  proc getDataStagingDirectory*(volumeUuid: string): File {.`static`.}
  proc getDataUserCeDirectory*(volumeUuid: string): File {.`static`.}
  proc getDataUserCeDirectory*(volumeUuid: string, userId: jint): File {.`static`.}
  proc getDataUserCePackageDirectory*(volumeUuid: string, userId: jint, packageName: string): File {.`static`.}
  proc getDataCePackageDirectoryForUser*(storageUuid: UUID, user: UserHandle, packageName: string): File {.`static`.}
  proc getDataUserDeDirectory*(volumeUuid: string): File {.`static`.}
  proc getDataUserDeDirectory*(volumeUuid: string, userId: jint): File {.`static`.}
  proc getDataUserDePackageDirectory*(volumeUuid: string, userId: jint, packageName: string): File {.`static`.}
  proc getDataDePackageDirectoryForUser*(storageUuid: UUID, user: UserHandle, packageName: string): File {.`static`.}
  proc getDataPreloadsDirectory*(): File {.`static`.}
  proc getDataPreloadsDemoDirectory*(): File {.`static`.}
  proc getDataPreloadsAppsDirectory*(): File {.`static`.}
  proc getDataPreloadsMediaDirectory*(): File {.`static`.}
  proc getDataPreloadsFileCacheDirectory*(packageName: string): File {.`static`.}
  proc getDataPreloadsFileCacheDirectory*(): File {.`static`.}
  proc getPackageCacheDirectory*(): File {.`static`.}
  proc getInternalMediaDirectories*(): Collection[File] {.`static`.}
  proc getExternalStorageDirectory*(): File {.`static`.}
  proc getLegacyExternalStorageDirectory*(): File {.`static`.}
  proc getLegacyExternalStorageObbDirectory*(): File {.`static`.}
  proc isStandardDirectory*(dir: string): jboolean {.`static`.}
  proc classifyExternalStorageDirectory*(dir: File): jint {.`static`.}
  proc getExternalStoragePublicDirectory*(type: string): File {.`static`.}
  proc buildExternalStorageAndroidDataDirs*(): seq[File] {.`static`.}
  proc buildExternalStorageAndroidObbDirs*(): seq[File] {.`static`.}
  proc buildExternalStorageAppDataDirs*(packageName: string): seq[File] {.`static`.}
  proc buildExternalStorageAppMediaDirs*(packageName: string): seq[File] {.`static`.}
  proc buildExternalStorageAppObbDirs*(packageName: string): seq[File] {.`static`.}
  proc buildExternalStorageAppFilesDirs*(packageName: string): seq[File] {.`static`.}
  proc buildExternalStorageAppCacheDirs*(packageName: string): seq[File] {.`static`.}
  proc buildExternalStoragePublicDirs*(dirType: string): seq[File] {.`static`.}
  proc getDownloadCacheDirectory*(): File {.`static`.}
  proc getMetadataDirectory*(): File {.`static`.}
  proc getExternalStorageState*(): string {.`static`.}
  proc getStorageState*(path: File): string {.`static`.}
  proc getExternalStorageState*(path: File): string {.`static`.}
  proc isExternalStorageRemovable*(): jboolean {.`static`.}
  proc isExternalStorageRemovable*(path: File): jboolean {.`static`.}
  proc isExternalStorageEmulated*(): jboolean {.`static`.}
  proc isExternalStorageEmulated*(path: File): jboolean {.`static`.}
  proc isExternalStorageLegacy*(): jboolean {.`static`.}
  proc isExternalStorageLegacy*(path: File): jboolean {.`static`.}
  proc isExternalStorageManager*(): jboolean {.`static`.}
  proc isExternalStorageManager*(path: File): jboolean {.`static`.}
  proc setUserRequired*(userRequired: jboolean) {.`static`.}
  proc buildPaths*(base: seq[File], segments: string): seq[File] {.`static`.}
  proc buildPath*(base: File, segments: string): File {.`static`.}
  proc maybeTranslateEmulatedPathToInternal*(path: File): File {.`static`.}
  DIR_ANDROID*: string {.`static`.}
  DIR_USER_CE*: string {.`static`.}
  DIR_USER_DE*: string {.`static`.}
  DIRECTORY_ANDROID*: string {.`static`.}
  DIRECTORY_MUSIC*: string {.`static`.}
  DIRECTORY_PODCASTS*: string {.`static`.}
  DIRECTORY_RINGTONES*: string {.`static`.}
  DIRECTORY_ALARMS*: string {.`static`.}
  DIRECTORY_NOTIFICATIONS*: string {.`static`.}
  DIRECTORY_PICTURES*: string {.`static`.}
  DIRECTORY_MOVIES*: string {.`static`.}
  DIRECTORY_DOWNLOADS*: string {.`static`.}
  DIRECTORY_DCIM*: string {.`static`.}
  DIRECTORY_DOCUMENTS*: string {.`static`.}
  DIRECTORY_SCREENSHOTS*: string {.`static`.}
  DIRECTORY_AUDIOBOOKS*: string {.`static`.}
  DIRECTORY_RECORDINGS*: string {.`static`.}
  STANDARD_DIRECTORIES*: string {.`static`.}
  HAS_MUSIC*: jint {.`static`.}
  HAS_PODCASTS*: jint {.`static`.}
  HAS_RINGTONES*: jint {.`static`.}
  HAS_ALARMS*: jint {.`static`.}
  HAS_NOTIFICATIONS*: jint {.`static`.}
  HAS_PICTURES*: jint {.`static`.}
  HAS_MOVIES*: jint {.`static`.}
  HAS_DOWNLOADS*: jint {.`static`.}
  HAS_DCIM*: jint {.`static`.}
  HAS_DOCUMENTS*: jint {.`static`.}
  HAS_AUDIOBOOKS*: jint {.`static`.}
  HAS_RECORDINGS*: jint {.`static`.}
  HAS_ANDROID*: jint {.`static`.}
  HAS_OTHER*: jint {.`static`.}
  MEDIA_UNKNOWN*: string {.`static`.}
  MEDIA_REMOVED*: string {.`static`.}
  MEDIA_UNMOUNTED*: string {.`static`.}
  MEDIA_CHECKING*: string {.`static`.}
  MEDIA_NOFS*: string {.`static`.}
  MEDIA_MOUNTED*: string {.`static`.}
  MEDIA_MOUNTED_READ_ONLY*: string {.`static`.}
  MEDIA_SHARED*: string {.`static`.}
  MEDIA_BAD_REMOVAL*: string {.`static`.}
  MEDIA_UNMOUNTABLE*: string {.`static`.}
  MEDIA_EJECTING*: string {.`static`.}

jclass android.os.Environment.UserEnvironment* of JVMObject:
  proc getExternalDirs*(): seq[File]
  proc getExternalStorageDirectory*(): File
  proc getExternalStoragePublicDirectory*(type: string): File
  proc buildExternalStoragePublicDirs*(type: string): seq[File]
  proc buildExternalStorageAndroidDataDirs*(): seq[File]
  proc buildExternalStorageAndroidObbDirs*(): seq[File]
  proc buildExternalStorageAppDataDirs*(packageName: string): seq[File]
  proc buildExternalStorageAppMediaDirs*(packageName: string): seq[File]
  proc buildExternalStorageAppObbDirs*(packageName: string): seq[File]
  proc buildExternalStorageAppFilesDirs*(packageName: string): seq[File]
  proc buildExternalStorageAppCacheDirs*(packageName: string): seq[File]

jclass android.os.UserEnvironment* of JVMObject:
  proc getExternalDirs*(): seq[File]
  proc getExternalStorageDirectory*(): File
  proc getExternalStoragePublicDirectory*(type: string): File
  proc buildExternalStoragePublicDirs*(type: string): seq[File]
  proc buildExternalStorageAndroidDataDirs*(): seq[File]
  proc buildExternalStorageAndroidObbDirs*(): seq[File]
  proc buildExternalStorageAppDataDirs*(packageName: string): seq[File]
  proc buildExternalStorageAppMediaDirs*(packageName: string): seq[File]
  proc buildExternalStorageAppObbDirs*(packageName: string): seq[File]
  proc buildExternalStorageAppFilesDirs*(packageName: string): seq[File]
  proc buildExternalStorageAppCacheDirs*(packageName: string): seq[File]

