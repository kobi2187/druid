## SDK Storage Manager - File system and storage management
##
## Uses Android SDK Environment and StatFs APIs (Java)
##
## Provides:
## - Internal and external storage paths
## - Storage space queries (available/total)
## - External storage state checking
## - Cache and files directories
## - Storage permission helpers

import ../../../core
import ../../../art  # For API level detection
import jnim
import options
import os

jnimport:
  import android.content.Context
  import android.os.Environment
  import android.os.StatFs
  import java.io.File

type
  StorageLocation* = enum
    ## Storage location types
    slInternal = 0      ## Internal app storage (always available)
    slExternal = 1      ## External storage (SD card, emulated storage)
    slCache = 2         ## Cache directory (can be cleared by system)

  ExternalStorageState* = enum
    ## External storage mount state
    esUnknown = 0
    esMounted = 1           ## Mounted and writable
    esMountedReadOnly = 2   ## Mounted but read-only
    esUnmounted = 3         ## Not mounted
    esRemoved = 4           ## Media removed (SD card ejected)
    esBadRemoval = 5        ## Removed without unmounting
    esChecking = 6          ## Checking filesystem
    esNonFs = 7             ## Not a filesystem

  StorageInfo* = object
    ## Storage space information
    location*: StorageLocation
    totalBytes*: int64
    availableBytes*: int64
    freeBytes*: int64
    usedBytes*: int64
    usedPercent*: float

  SdkStorageManager* = ref object
    context: JObject
    apiLevel: int
    # Cached paths
    internalPath: Option[string]
    externalPath: Option[string]
    cachePath: Option[string]

proc init*(_: typedesc[SdkStorageManager]): SdkStorageManager =
  ## Initialize SdkStorageManager
  result = SdkStorageManager()
  result.context = getContext()
  result.apiLevel = detectApiLevel()

proc getInternalStoragePath*(sm: SdkStorageManager): string =
  ## Get path to internal app storage directory
  ##
  ## This is private to your app and always available.
  ## Files here are deleted when app is uninstalled.
  ##
  ## Returns:
  ##   Path to internal storage (e.g., "/data/data/com.example.app/files")
  ##
  ## Example:
  ##   let dataPath = storage().getInternalStoragePath()
  ##   writeFile(dataPath / "config.json", jsonData)

  if sm.internalPath.isSome:
    return sm.internalPath.get()

  let filesDir = sm.context.call("getFilesDir")
  let path = filesDir.call("getAbsolutePath").toStringRaw()
  sm.internalPath = some(path)
  return path

proc getExternalStoragePath*(sm: SdkStorageManager): string =
  ## Get path to external storage directory
  ##
  ## On modern Android, this is typically emulated storage, not a physical SD card.
  ## Requires READ_EXTERNAL_STORAGE/WRITE_EXTERNAL_STORAGE permissions on API < 29.
  ## On API 29+, scoped storage applies.
  ##
  ## Returns:
  ##   Path to external storage root (e.g., "/storage/emulated/0")
  ##
  ## Example:
  ##   if storage().isExternalStorageWritable():
  ##     let path = storage().getExternalStoragePath()
  ##     writeFile(path / "Download/myfile.txt", data)

  if sm.externalPath.isSome:
    return sm.externalPath.get()

  let extDir = Environment.call("getExternalStorageDirectory")
  let path = extDir.call("getAbsolutePath").toStringRaw()
  sm.externalPath = some(path)
  return path

proc getExternalFilesDir*(sm: SdkStorageManager, dirType: string = ""): string =
  ## Get app-specific external files directory
  ##
  ## This is app-specific external storage. No permissions needed on API 19+.
  ## Files here are deleted when app is uninstalled.
  ##
  ## Args:
  ##   dirType: Directory type (e.g., "Pictures", "Documents", "Download", or "" for root)
  ##
  ## Returns:
  ##   Path to external files directory
  ##
  ## Example:
  ##   let picturesDir = storage().getExternalFilesDir("Pictures")
  ##   savePhoto(picturesDir / "photo.jpg")

  let typeArg = if dirType == "":
    JObject(nil)
  else:
    dirType.toJString.JObject

  let extFilesDir = sm.context.call("getExternalFilesDir", typeArg)
  if extFilesDir.isNil:
    return ""  # External storage not available

  return extFilesDir.call("getAbsolutePath").toStringRaw()

proc getCachePath*(sm: SdkStorageManager): string =
  ## Get path to app cache directory
  ##
  ## Cache can be cleared by the system when device is low on storage.
  ## Use for temporary files only.
  ##
  ## Returns:
  ##   Path to cache directory (e.g., "/data/data/com.example.app/cache")
  ##
  ## Example:
  ##   let tempFile = storage().getCachePath() / "temp_image.jpg"
  ##   downloadImage(url, tempFile)

  if sm.cachePath.isSome:
    return sm.cachePath.get()

  let cacheDir = sm.context.call("getCacheDir")
  let path = cacheDir.call("getAbsolutePath").toStringRaw()
  sm.cachePath = some(path)
  return path

proc getExternalCachePath*(sm: SdkStorageManager): string =
  ## Get path to external cache directory
  ##
  ## Like cache, but on external storage. Larger capacity but can be unavailable.
  ##
  ## Returns:
  ##   Path to external cache, or empty string if unavailable
  ##
  ## Example:
  ##   let cachePath = storage().getExternalCachePath()
  ##   if cachePath != "":
  ##     downloadLargeFile(cachePath / "video_cache.mp4")

  let extCacheDir = sm.context.call("getExternalCacheDir")
  if extCacheDir.isNil:
    return ""

  return extCacheDir.call("getAbsolutePath").toStringRaw()

proc getExternalStorageState*(sm: SdkStorageManager): ExternalStorageState =
  ## Get current state of external storage
  ##
  ## Returns:
  ##   Current mount state of external storage
  ##
  ## Example:
  ##   case storage().getExternalStorageState():
  ##   of esMounted:
  ##     echo "External storage ready"
  ##   of esMountedReadOnly:
  ##     echo "External storage read-only"
  ##   else:
  ##     echo "External storage unavailable"

  let state = Environment.call("getExternalStorageState").toStringRaw()

  case state
  of "mounted":
    return esMounted
  of "mounted_ro":
    return esMountedReadOnly
  of "unmounted":
    return esUnmounted
  of "removed":
    return esRemoved
  of "bad_removal":
    return esBadRemoval
  of "checking":
    return esChecking
  of "nofs":
    return esNonFs
  else:
    return esUnknown

proc isExternalStorageWritable*(sm: SdkStorageManager): bool =
  ## Check if external storage is mounted and writable
  ##
  ## Returns:
  ##   true if external storage can be written to
  ##
  ## Example:
  ##   if storage().isExternalStorageWritable():
  ##     saveToExternalStorage()
  ##   else:
  ##     saveToInternalStorage()

  return sm.getExternalStorageState() == esMounted

proc isExternalStorageReadable*(sm: SdkStorageManager): bool =
  ## Check if external storage is readable
  ##
  ## Returns:
  ##   true if external storage can be read from

  let state = sm.getExternalStorageState()
  return state == esMounted or state == esMountedReadOnly

proc getStorageInfo*(sm: SdkStorageManager, location: StorageLocation): StorageInfo =
  ## Get detailed storage space information
  ##
  ## Args:
  ##   location: Which storage location to query
  ##
  ## Returns:
  ##   StorageInfo with space details
  ##
  ## Example:
  ##   let info = storage().getStorageInfo(slInternal)
  ##   echo "Available: ", info.availableBytes div (1024*1024), " MB"
  ##   echo "Used: ", info.usedPercent, "%"

  result.location = location

  # Get path for location
  let path = case location:
    of slInternal:
      sm.getInternalStoragePath()
    of slExternal:
      sm.getExternalStoragePath()
    of slCache:
      sm.getCachePath()

  if path == "":
    return  # Location unavailable

  # Create StatFs for path
  let statFs = StatFs.new(path.toJString)

  # Get block size and counts
  if sm.apiLevel >= 18:
    # Modern API (API 18+)
    let blockSize = statFs.call("getBlockSizeLong").longVal
    let totalBlocks = statFs.call("getBlockCountLong").longVal
    let availableBlocks = statFs.call("getAvailableBlocksLong").longVal
    let freeBlocks = statFs.call("getFreeBlocksLong").longVal

    result.totalBytes = totalBlocks * blockSize
    result.availableBytes = availableBlocks * blockSize
    result.freeBytes = freeBlocks * blockSize
  else:
    # Legacy API
    let blockSize = statFs.call("getBlockSize").intVal.int64
    let totalBlocks = statFs.call("getBlockCount").intVal.int64
    let availableBlocks = statFs.call("getAvailableBlocks").intVal.int64
    let freeBlocks = statFs.call("getFreeBlocks").intVal.int64

    result.totalBytes = totalBlocks * blockSize
    result.availableBytes = availableBlocks * blockSize
    result.freeBytes = freeBlocks * blockSize

  result.usedBytes = result.totalBytes - result.freeBytes

  if result.totalBytes > 0:
    result.usedPercent = (result.usedBytes.float / result.totalBytes.float) * 100.0
  else:
    result.usedPercent = 0.0

proc getAvailableSpace*(sm: SdkStorageManager, location: StorageLocation): int64 =
  ## Get available space in bytes for location
  ##
  ## Args:
  ##   location: Storage location to query
  ##
  ## Returns:
  ##   Available bytes (can be used by apps)
  ##
  ## Example:
  ##   let available = storage().getAvailableSpace(slInternal)
  ##   if available < 10 * 1024 * 1024:  # Less than 10 MB
  ##     showLowStorageWarning()

  return sm.getStorageInfo(location).availableBytes

proc getTotalSpace*(sm: SdkStorageManager, location: StorageLocation): int64 =
  ## Get total space in bytes for location
  ##
  ## Args:
  ##   location: Storage location to query
  ##
  ## Returns:
  ##   Total bytes for storage location
  ##
  ## Example:
  ##   let total = storage().getTotalSpace(slInternal)
  ##   echo "Total storage: ", total div (1024*1024*1024), " GB"

  return sm.getStorageInfo(location).totalBytes

proc hasEnoughSpace*(sm: SdkStorageManager, location: StorageLocation, requiredBytes: int64): bool =
  ## Check if there's enough available space
  ##
  ## Args:
  ##   location: Storage location to check
  ##   requiredBytes: Minimum space needed
  ##
  ## Returns:
  ##   true if enough space is available
  ##
  ## Example:
  ##   let fileSize = 50 * 1024 * 1024  # 50 MB
  ##   if storage().hasEnoughSpace(slInternal, fileSize):
  ##     downloadFile()
  ##   else:
  ##     showInsufficientStorageError()

  return sm.getAvailableSpace(location) >= requiredBytes

proc clearCache*(sm: SdkStorageManager) =
  ## Clear app's cache directory
  ##
  ## Deletes all files in the cache directory.
  ##
  ## Example:
  ##   storage().clearCache()

  let cachePath = sm.getCachePath()
  if cachePath != "":
    let cacheDir = File.new(cachePath.toJString)
    let files = cacheDir.call("listFiles")
    if not files.isNil:
      # Delete each file in cache
      let length = files.call("length").intVal
      for i in 0..<length:
        let file = files.call("get", i.jint)
        discard file.call("delete")

# Lazy accessor for AndroidRuntime
proc sdkStorageManager*(runtime: AndroidRuntime): SdkStorageManager =
  ## Get or create SdkStorageManager instance
  if runtime.sdkStorageManager.isNone:
    runtime.sdkStorageManager = some(SdkStorageManager.init())
  return runtime.sdkStorageManager.get()

# Convenience global accessor
proc storage*(): SdkStorageManager =
  ## Global accessor for SdkStorageManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   # Get paths
  ##   let dataDir = storage().getInternalStoragePath()
  ##   let cacheDir = storage().getCachePath()
  ##
  ##   # Check space
  ##   let info = storage().getStorageInfo(slInternal)
  ##   echo "Free space: ", info.availableBytes div (1024*1024), " MB"
  ##
  ##   # Save file
  ##   if storage().isExternalStorageWritable():
  ##     let extFiles = storage().getExternalFilesDir("Documents")
  ##     writeFile(extFiles / "data.txt", content)
  return runtime().sdkStorageManager()
