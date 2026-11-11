# files.nim - File operations

import android, options, times

type
  StorageAccess* = enum
    ## Storage access types
    Internal,  # App-specific internal storage
    External,  # Primary external storage
    Shared     # Shared storage (documents, pictures, etc)
    
  StorageMedia* = enum
    ## Media collection types
    Documents,
    Images,
    Video,
    Audio,
    Downloads
    
  FileMode* = enum
    ## File access modes
    Read, Write, Append
    
  FileInfo* = object
    ## File metadata
    path*: string
    name*: string
    size*: int64
    isDirectory*: bool
    lastModified*: Time
    mimeType*: Option[string]
    
  FileOpenResult* = object
    ## Result of file open operation
    case success*: bool
    of true:
      fileDescriptor*: int
      mode*: FileMode
    of false:
      error*: string
    
  FileManager* = ref object of Manager
    openFiles: Table[int, tuple[path: string, mode: FileMode, fd: pointer]]
    contentResolver: pointer  # JNI reference

# Constructor
proc newFileManager*(context: Context): FileManager
  ## Creates a new file manager

# Storage paths
proc getAppDir*(m: FileManager): string
  ## Gets app-specific internal storage directory
  ## API 26+: Uses context.getDataDir()
  ## Pre-API 26: Uses context.getFilesDir().getParent()
  
proc getAppFilesDir*(m: FileManager): string
  ## Gets app-specific files directory
  ## All API levels: context.getFilesDir()
  
proc getAppCacheDir*(m: FileManager): string
  ## Gets app-specific cache directory
  ## All API levels: context.getCacheDir()
  
proc getExternalDir*(m: FileManager): Option[string]
  ## Gets primary external storage directory
  ## API 29+: Restricted to app-specific directory
  ## API 26-28: Returns general external storage
  ## Requires READ_EXTERNAL_STORAGE permission

proc getMediaDir*(m: FileManager, media: StorageMedia): Option[string]
  ## Gets media directory
  ## API 29+: Uses MediaStore APIs
  ## API 26-28: Returns direct path
  ## Requires READ_EXTERNAL_STORAGE permission

# File operations
proc fileExists*(m: FileManager, path: string): bool
  ## Checks if file exists
  ## API 29+: Uses FileUtils for shared storage
  ## API 26-28: Direct File access
  
proc getFileInfo*(m: FileManager, path: string): Option[FileInfo]
  ## Gets file information
  ## API 29+: Uses DocumentFile for shared storage
  ## API 26-28: Direct File access
  
proc listFiles*(m: FileManager, directory: string): seq[FileInfo]
  ## Lists files in directory
  ## API 29+: Uses DocumentFile for shared storage
  ## API 26-28: Direct File access
  ## Requires READ_EXTERNAL_STORAGE for shared/external
  
proc createDirectory*(m: FileManager, path: string): bool
  ## Creates directory
  ## API 29+: Uses DocumentFile for shared storage
  ## API 26-28: Direct File access
  ## Requires WRITE_EXTERNAL_STORAGE for shared/external
  
proc deleteFile*(m: FileManager, path: string): bool
  ## Deletes file
  ## API 29+: Uses DocumentFile for shared storage
  ## API 26-28: Direct File access
  ## Requires WRITE_EXTERNAL_STORAGE for shared/external
  
proc openFile*(m: FileManager, path: string, mode: FileMode): FileOpenResult
  ## Opens file
  ## API 29+: Uses ContentResolver for shared storage
  ## API 26-28: Direct File access
  ## Requires appropriate permissions
  
proc readBytes*(m: FileManager, fileDescriptor: int, count: int): Option[seq[byte]]
  ## Reads bytes from open file
  
proc writeBytes*(m: FileManager, fileDescriptor: int, data: seq[byte]): int
  ## Writes bytes to open file
  ## Returns number of bytes written
  
proc closeFile*(m: FileManager, fileDescriptor: int): bool
  ## Closes open file

# Content sharing
proc shareFile*(m: FileManager, 
              filePath: string, 
              mimeType: string,
              title: string = "Share File"): bool
  ## Shares file with other apps
  ## API 26+: Uses FileProvider for sharing