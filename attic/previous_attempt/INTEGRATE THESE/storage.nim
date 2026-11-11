## android/storage.nim - Unified Storage API

import std/[options, tables, json, asyncdispatch, streams]
import core

type
  StorageManager* = ref object
    ## High-level storage manager

  StorageLocation* = enum
    slInternal = "Internal storage"
    slExternal = "External storage" 
    slCache = "Cache directory"
    slFiles = "App files directory"
    slDocuments = "Documents"
    slPictures = "Pictures"
    slMovies = "Movies"
    slMusic = "Music"
    slDownloads = "Downloads"

  FileInfo* = object
    path*: string
    name*: string
    size*: int64
    isDirectory*: bool
    isHidden*: bool
    canRead*: bool
    canWrite*: bool
    lastModified*: int64
    mimeType*: string

  StorageInfo* = object
    totalSpace*: int64
    freeSpace*: int64
    availableSpace*: int64
    location*: StorageLocation
    path*: string
    isRemovable*: bool
    isEmulated*: bool

  Preferences* = ref object
    ## Shared preferences storage

  PreferencesMode* = enum
    pmPrivate = "Private to app"
    pmWorldReadable = "World readable (deprecated)"
    pmWorldWritable = "World writable (deprecated)"

# Storage Manager
proc newStorageManager*(): StorageManager =
  ## Create storage manager
  trackFeature(afStorage)

proc close*(manager: StorageManager) =
  ## Close storage manager
  discard

proc getStorageInfo*(manager: StorageManager, location: StorageLocation): StorageInfo =
  ## Get storage information for location
  discard

proc getAllStorageInfo*(manager: StorageManager): seq[StorageInfo] =
  ## Get all available storage locations
  discard

proc getTotalSpace*(manager: StorageManager, location = slInternal): int64 =
  ## Get total storage space in bytes
  discard

proc getFreeSpace*(manager: StorageManager, location = slInternal): int64 =
  ## Get free storage space in bytes
  discard

proc getAvailableSpace*(manager: StorageManager, location = slInternal): int64 =
  ## Get available storage space in bytes
  discard

# Directory Operations
proc getAppDirectory*(manager: StorageManager): string =
  ## Get app's private directory
  discard

proc getCacheDirectory*(manager: StorageManager): string =
  ## Get app's cache directory
  discard

proc getFilesDirectory*(manager: StorageManager): string =
  ## Get app's files directory
  discard

proc getExternalDirectory*(manager: StorageManager, dirType = slDocuments): string =
  ## Get external storage directory
  discard

proc getDownloadsDirectory*(manager: StorageManager): string =
  ## Get downloads directory
  discard

proc getPicturesDirectory*(manager: StorageManager): string =
  ## Get pictures directory
  discard

proc getMoviesDirectory*(manager: StorageManager): string =
  ## Get movies directory
  discard

proc getMusicDirectory*(manager: StorageManager): string =
  ## Get music directory
  discard

proc getDocumentsDirectory*(manager: StorageManager): string =
  ## Get documents directory
  discard

proc createDirectory*(manager: StorageManager, path: string): bool =
  ## Create directory and all parent directories
  discard

proc deleteDirectory*(manager: StorageManager, path: string, recursive = false): bool =
  ## Delete directory
  discard

proc directoryExists*(manager: StorageManager, path: string): bool =
  ## Check if directory exists
  discard

proc listDirectory*(manager: StorageManager, path: string): seq[FileInfo] =
  ## List files and directories in path
  discard

proc listFiles*(manager: StorageManager, path: string, pattern = "*"): seq[FileInfo] =
  ## List files matching pattern
  discard

# File Operations
proc fileExists*(manager: StorageManager, path: string): bool =
  ## Check if file exists
  discard

proc getFileInfo*(manager: StorageManager, path: string): FileInfo =
  ## Get file information
  discard

proc getFileSize*(manager: StorageManager, path: string): int64 =
  ## Get file size in bytes
  discard

proc deleteFile*(manager: StorageManager, path: string): bool =
  ## Delete file
  discard

proc copyFile*(manager: StorageManager, srcPath, destPath: string): bool =
  ## Copy file from source to destination
  discard

proc moveFile*(manager: StorageManager, srcPath, destPath: string): bool =
  ## Move/rename file
  discard

proc renameFile*(manager: StorageManager, path, newName: string): bool =
  ## Rename file
  discard

# File Reading/Writing
proc readFile*(manager: StorageManager, path: string): seq[byte] =
  ## Read entire file as bytes
  discard

proc readTextFile*(manager: StorageManager, path: string): string =
  ## Read entire file as text
  discard

proc readJsonFile*(manager: StorageManager, path: string): JsonNode =
  ## Read JSON file
  discard

proc writeFile*(manager: StorageManager, path: string, data: seq[byte]): bool =
  ## Write bytes to file
  discard

proc writeTextFile*(manager: StorageManager, path: string, text: string): bool =
  ## Write text to file
  discard

proc writeJsonFile*(manager: StorageManager, path: string, json: JsonNode): bool =
  ## Write JSON to file
  discard

proc appendFile*(manager: StorageManager, path: string, data: seq[byte]): bool =
  ## Append bytes to file
  discard

proc appendTextFile*(manager: StorageManager, path: string, text: string): bool =
  ## Append text to file
  discard

# Async File Operations
proc readFileAsync*(manager: StorageManager, path: string): Future[seq[byte]] =
  ## Read file asynchronously
  discard

proc readTextFileAsync*(manager: StorageManager, path: string): Future[string] =
  ## Read text file asynchronously
  discard

proc writeFileAsync*(manager: StorageManager, path: string, data: seq[byte]): Future[bool] =
  ## Write file asynchronously
  discard

proc writeTextFileAsync*(manager: StorageManager, path: string, text: string): Future[bool] =
  ## Write text file asynchronously
  discard

# Stream Operations
proc openFileStream*(manager: StorageManager, path: string, mode: FileMode): FileStream =
  ## Open file stream
  discard

proc openInputStream*(manager: StorageManager, path: string): InputStream =
  ## Open input stream
  discard

proc openOutputStream*(manager: StorageManager, path: string, append = false): OutputStream =
  ## Open output stream
  discard

# Shared Preferences
proc getPreferences*(manager: StorageManager, name = "default", mode = pmPrivate): Preferences =
  ## Get shared preferences
  discard

proc getString*(prefs: Preferences, key: string, default = ""): string =
  ## Get string preference
  discard

proc getInt*(prefs: Preferences, key: string, default = 0): int32 =
  ## Get integer preference
  discard

proc getFloat*(prefs: Preferences, key: string, default = 0.0): float32 =
  ## Get float preference
  discard

proc getBool*(prefs: Preferences, key: string, default = false): bool =
  ## Get boolean preference
  discard

proc getStringSet*(prefs: Preferences, key: string, default: set[string] = {}): set[string] =
  ## Get string set preference
  discard

proc setString*(prefs: Preferences, key, value: string) =
  ## Set string preference
  discard

proc setInt*(prefs: Preferences, key: string, value: int32) =
  ## Set integer preference
  discard

proc setFloat*(prefs: Preferences, key: string, value: float32) =
  ## Set float preference
  discard

proc setBool*(prefs: Preferences, key: string, value: bool) =
  ## Set boolean preference
  discard

proc setStringSet*(prefs: Preferences, key: string, value: set[string]) =
  ## Set string set preference
  discard

proc remove*(prefs: Preferences, key: string) =
  ## Remove preference
  discard

proc clear*(prefs: Preferences) =
  ## Clear all preferences
  discard

proc contains*(prefs: Preferences, key: string): bool =
  ## Check if preference exists
  discard

proc getAll*(prefs: Preferences): Table[string, string] =
  ## Get all preferences as table
  discard

proc apply*(prefs: Preferences) =
  ## Apply preferences asynchronously
  discard

proc commit*(prefs: Preferences): bool =
  ## Commit preferences synchronously
  discard

# Media Storage Integration
proc addToMediaStore*(manager: StorageManager, filePath: string, mimeType = "") =
  ## Add file to Android media store
  discard

proc removeFromMediaStore*(manager: StorageManager, filePath: string) =
  ## Remove file from media store
  discard

proc scanMediaFile*(manager: StorageManager, filePath: string) =
  ## Trigger media scanner for file
  discard

proc getMediaFiles*(manager: StorageManager, mediaType: string): seq[FileInfo] =
  ## Get media files of specified type
  discard

# Scoped Storage (Android 10+)
proc requestStoragePermission*(manager: StorageManager) =
  ## Request storage permissions
  discard

proc hasStoragePermission*(manager: StorageManager): bool =
  ## Check if storage permissions are granted
  discard

proc requestManageExternalStorage*(manager: StorageManager) =
  ## Request MANAGE_EXTERNAL_STORAGE permission (Android 11+)
  discard

proc canManageExternalStorage*(manager: StorageManager): bool =
  ## Check if app can manage external storage
  discard

proc createMediaFile*(manager: StorageManager, 
                     displayName: string, 
                     mimeType: string,
                     relativePath = ""): string =
  ## Create file in media store (scoped storage)
  discard

proc openMediaFile*(manager: StorageManager, uri: string): FileStream =
  ## Open file from media store URI
  discard

# Content Provider Integration
proc openContentUri*(manager: StorageManager, uri: string): InputStream =
  ## Open content URI for reading
  discard

proc queryContentProvider*(manager: StorageManager, uri: string, 
                          projection: seq[string] = @[]): seq[Table[string, string]] =
  ## Query content provider
  discard

# File Utilities
proc getMimeType*(manager: StorageManager, path: string): string =
  ## Get MIME type of file
  discard

proc getFileExtension*(manager: StorageManager, path: string): string =
  ## Get file extension
  discard

proc isImageFile*(manager: StorageManager, path: string): bool =
  ## Check if file is an image
  discard

proc isVideoFile*(manager: StorageManager, path: string): bool =
  ## Check if file is a video
  discard

proc isAudioFile*(manager: StorageManager, path: string): bool =
  ## Check if file is an audio file
  discard

proc isTextFile*(manager: StorageManager, path: string): bool =
  ## Check if file is a text file
  discard

proc formatFileSize*(bytes: int64): string =
  ## Format file size as human readable string
  discard

proc getRelativePath*(basePath, fullPath: string): string =
  ## Get relative path from base path
  discard

proc joinPath*(parts: varargs[string]): string =
  ## Join path components
  discard

proc getParentDirectory*(path: string): string =
  ## Get parent directory of path
  discard

proc getFileName*(path: string): string =
  ## Get filename from path
  discard

proc getFileNameWithoutExtension*(path: string): string =
  ## Get filename without extension
  discard

# Convenience Functions
proc saveText*(filename, text: string, location = slFiles): bool =
  ## Quick save text to file
  trackFeature(afStorage)

proc loadText*(filename: string, location = slFiles): string =
  ## Quick load text from file
  trackFeature(afStorage)

proc saveJson*(filename: string, json: JsonNode, location = slFiles): bool =
  ## Quick save JSON to file
  trackFeature(afStorage)

proc loadJson*(filename: string, location = slFiles): JsonNode =
  ## Quick load JSON from file
  trackFeature(afStorage)

proc saveBytes*(filename: string, data: seq[byte], location = slFiles): bool =
  ## Quick save bytes to file
  trackFeature(afStorage)

proc loadBytes*(filename: string, location = slFiles): seq[byte] =
  ## Quick load bytes from file
  trackFeature(afStorage)

# Settings/Preferences Shortcuts
proc saveSetting*(key, value: string) =
  ## Quick save app setting
  trackFeature(afStorage)

proc loadSetting*(key: string, default = ""): string =
  ## Quick load app setting
  trackFeature(afStorage)

proc saveIntSetting*(key: string, value: int32) =
  ## Quick save integer setting
  trackFeature(afStorage)

proc loadIntSetting*(key: string, default = 0): int32 =
  ## Quick load integer setting
  trackFeature(afStorage)

proc saveBoolSetting*(key: string, value: bool) =
  ## Quick save boolean setting
  trackFeature(afStorage)

proc loadBoolSetting*(key: string, default = false): bool =
  ## Quick load boolean setting
  trackFeature(afStorage)

proc deleteSetting*(key: string) =
  ## Quick delete setting
  trackFeature(afStorage)

proc clearAllSettings*() =
  ## Quick clear all app settings
  trackFeature(afStorage)