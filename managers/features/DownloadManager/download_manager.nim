## SDK Download Manager - File downloads
##
## Uses Android SDK DownloadManager API (Java)
##
## Provides:
## - Background file downloads
## - Download progress tracking
## - Download queue management
## - Network type restrictions (WiFi only, etc.)
## - Download notifications
##
## Features:
## - Downloads continue even if app is killed
## - Automatic retry on network failures
## - Downloads persist across device reboots
## - Can restrict to WiFi only to save data
##
## TODO: Add callback system for download completion events
## TODO: Add support for custom headers and authentication

import ../../../core
import ../../../art  # For API level detection
import jnim
import options

jnimport:
  import android.content.Context
  import android.app.DownloadManager as JDM
  import android.net.Uri
  import android.database.Cursor

type
  DownloadStatus* = enum
    ## Download status
    dsPending = 1        ## Download is waiting to start
    dsRunning = 2        ## Download is actively running
    dsPaused = 4         ## Download is paused
    dsSuccessful = 8     ## Download completed successfully
    dsFailed = 16        ## Download failed

  NetworkType* = enum
    ## Network types for downloads
    ntAny = 0           ## Download on any network
    ntWifiOnly = 1      ## Download only on WiFi
    ntNotRoaming = 2    ## Download only when not roaming

  DownloadInfo* = object
    ## Information about a download
    id*: int64
    status*: DownloadStatus
    title*: string
    description*: string
    bytesDownloaded*: int64
    bytesTotal*: int64
    localUri*: string   ## Local file path after download

  SdkDownloadManager* = ref object
    context: JObject
    downloadManager: JObject
    apiLevel: int

proc init*(_: typedesc[SdkDownloadManager]): SdkDownloadManager =
  ## Initialize SdkDownloadManager
  result = SdkDownloadManager()
  result.context = getContext()
  result.apiLevel = detectApiLevel()

  # Get DownloadManager system service
  let serviceName = "download".toJString
  result.downloadManager = result.context.getSystemService(serviceName)

proc enqueue*(dm: SdkDownloadManager,
             url: string,
             destinationPath: string = "",
             title: string = "",
             description: string = "",
             networkType: NetworkType = ntAny,
             showNotification: bool = true): int64 =
  ## Queue a file for download
  ##
  ## Args:
  ##   url: URL to download from
  ##   destinationPath: Destination file path (optional, uses Downloads dir if empty)
  ##   title: Download title shown in notification
  ##   description: Download description
  ##   networkType: Network requirements for download
  ##   showNotification: Show download notification
  ##
  ## Returns:
  ##   Download ID for tracking
  ##
  ## Example:
  ##   let downloadId = downloadManager().enqueue(
  ##     "https://example.com/file.zip",
  ##     title = "My File",
  ##     networkType = ntWifiOnly
  ##   )

  # Create download request
  let uri = Uri.call("parse", url.toJString)
  let request = JDM$Request.new(uri)

  # Set title and description
  if title != "":
    request.call("setTitle", title.toJString)
  if description != "":
    request.call("setDescription", description.toJString)

  # Set destination
  if destinationPath != "":
    # Use specific path
    let destUri = Uri.call("parse", ("file://" & destinationPath).toJString)
    request.call("setDestinationUri", destUri)
  else:
    # Use Downloads directory
    let filename = url.split('/')[^1].toJString  # Get last component of URL
    request.call("setDestinationInExternalPublicDir",
      "Download".toJString,
      filename)

  # Set network type restrictions
  case networkType:
  of ntWifiOnly:
    # NETWORK_WIFI = 2
    request.call("setAllowedNetworkTypes", 2.jint)
  of ntNotRoaming:
    request.call("setAllowedOverRoaming", false.jboolean)
  of ntAny:
    discard  # No restrictions

  # Set notification visibility
  if showNotification:
    # VISIBILITY_VISIBLE = 0 (show notification while downloading)
    request.call("setNotificationVisibility", 0.jint)
  else:
    # VISIBILITY_HIDDEN = 2 (hide notification)
    request.call("setNotificationVisibility", 2.jint)

  # Enqueue the download
  let downloadId = dm.downloadManager.call("enqueue", request).longVal
  return downloadId

proc getStatus*(dm: SdkDownloadManager, downloadId: int64): DownloadStatus =
  ## Get status of a download
  ##
  ## Args:
  ##   downloadId: Download ID from enqueue()
  ##
  ## Returns:
  ##   Current download status
  ##
  ## Example:
  ##   case downloadManager().getStatus(downloadId):
  ##   of dsSuccessful:
  ##     echo "Download complete!"
  ##   of dsFailed:
  ##     echo "Download failed"
  ##   of dsRunning:
  ##     echo "Downloading..."
  ##   else:
  ##     echo "Other status"

  # Create query
  let query = JDM$Query.new()
  query.call("setFilterById", downloadId.jlong)

  # Execute query
  let cursor = dm.downloadManager.call("query", query)

  if cursor.isNil:
    return dsFailed

  try:
    if cursor.call("moveToFirst").boolVal:
      # Get status column index
      let statusCol = cursor.call("getColumnIndex",
        "status".toJString).intVal

      if statusCol >= 0:
        let status = cursor.call("getInt", statusCol.jint).intVal
        return DownloadStatus(status)

    return dsFailed
  finally:
    cursor.call("close")

proc getDownloadInfo*(dm: SdkDownloadManager, downloadId: int64): Option[DownloadInfo] =
  ## Get detailed information about a download
  ##
  ## Args:
  ##   downloadId: Download ID from enqueue()
  ##
  ## Returns:
  ##   Download information, or None if not found
  ##
  ## Example:
  ##   let info = downloadManager().getDownloadInfo(downloadId)
  ##   if info.isSome:
  ##     let i = info.get()
  ##     echo "Progress: ", i.bytesDownloaded, " / ", i.bytesTotal
  ##     echo "Status: ", i.status

  # Create query
  let query = JDM$Query.new()
  query.call("setFilterById", downloadId.jlong)

  # Execute query
  let cursor = dm.downloadManager.call("query", query)

  if cursor.isNil:
    return none(DownloadInfo)

  try:
    if not cursor.call("moveToFirst").boolVal:
      return none(DownloadInfo)

    var info = DownloadInfo()
    info.id = downloadId

    # Get column indices
    let statusCol = cursor.call("getColumnIndex", "status".toJString).intVal
    let titleCol = cursor.call("getColumnIndex", "title".toJString).intVal
    let descCol = cursor.call("getColumnIndex", "description".toJString).intVal
    let downloadedCol = cursor.call("getColumnIndex",
      "bytes_so_far".toJString).intVal
    let totalCol = cursor.call("getColumnIndex",
      "total_size".toJString).intVal
    let localUriCol = cursor.call("getColumnIndex",
      "local_uri".toJString).intVal

    # Get values
    if statusCol >= 0:
      info.status = DownloadStatus(cursor.call("getInt", statusCol.jint).intVal)

    if titleCol >= 0:
      let titleObj = cursor.call("getString", titleCol.jint)
      if not titleObj.isNil:
        info.title = titleObj.toStringRaw()

    if descCol >= 0:
      let descObj = cursor.call("getString", descCol.jint)
      if not descObj.isNil:
        info.description = descObj.toStringRaw()

    if downloadedCol >= 0:
      info.bytesDownloaded = cursor.call("getLong", downloadedCol.jint).longVal

    if totalCol >= 0:
      info.bytesTotal = cursor.call("getLong", totalCol.jint).longVal

    if localUriCol >= 0:
      let uriObj = cursor.call("getString", localUriCol.jint)
      if not uriObj.isNil:
        info.localUri = uriObj.toStringRaw()

    return some(info)
  finally:
    cursor.call("close")

proc getProgress*(dm: SdkDownloadManager, downloadId: int64): float =
  ## Get download progress as percentage (0.0 to 100.0)
  ##
  ## Args:
  ##   downloadId: Download ID from enqueue()
  ##
  ## Returns:
  ##   Progress percentage, or -1.0 if unknown
  ##
  ## Example:
  ##   let progress = downloadManager().getProgress(downloadId)
  ##   echo "Downloaded: ", progress.int, "%"

  let info = dm.getDownloadInfo(downloadId)
  if info.isNone:
    return -1.0

  let i = info.get()
  if i.bytesTotal <= 0:
    return -1.0

  return (i.bytesDownloaded.float / i.bytesTotal.float) * 100.0

proc cancel*(dm: SdkDownloadManager, downloadId: int64): bool =
  ## Cancel a download
  ##
  ## Args:
  ##   downloadId: Download ID to cancel
  ##
  ## Returns:
  ##   true if download was cancelled
  ##
  ## Example:
  ##   if downloadManager().cancel(downloadId):
  ##     echo "Download cancelled"

  let removed = dm.downloadManager.call("remove", downloadId.jlong).intVal
  return removed > 0

proc pauseDownload*(dm: SdkDownloadManager, downloadId: int64): bool =
  ## Pause a download (API 24+)
  ##
  ## Args:
  ##   downloadId: Download ID to pause
  ##
  ## Returns:
  ##   true if paused
  ##
  ## Example:
  ##   downloadManager().pauseDownload(downloadId)

  if dm.apiLevel < 24:
    return false  # Not supported before API 24

  # This is not directly supported in DownloadManager
  # Downloads can be paused by the system but not by apps
  # Return false to indicate not supported
  return false

proc getUri*(dm: SdkDownloadManager, downloadId: int64): Option[string] =
  ## Get URI of downloaded file
  ##
  ## Args:
  ##   downloadId: Download ID
  ##
  ## Returns:
  ##   Local file URI, or None if not downloaded yet
  ##
  ## Example:
  ##   let uri = downloadManager().getUri(downloadId)
  ##   if uri.isSome:
  ##     echo "File downloaded to: ", uri.get()

  let uri = dm.downloadManager.call("getUriForDownloadedFile",
    downloadId.jlong)

  if uri.isNil:
    return none(string)

  return some(uri.call("toString").toStringRaw())

# Lazy accessor for AndroidRuntime
proc sdkDownloadManager*(runtime: AndroidRuntime): SdkDownloadManager =
  ## Get or create SdkDownloadManager instance
  if runtime.sdkDownloadManager.isNone:
    runtime.sdkDownloadManager = some(SdkDownloadManager.init())
  return runtime.sdkDownloadManager.get()

# Convenience global accessor
proc downloadManager*(): SdkDownloadManager =
  ## Global accessor for SdkDownloadManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   # Start download
  ##   let id = downloadManager().enqueue(
  ##     "https://example.com/large_file.zip",
  ##     title = "My Download",
  ##     description = "Downloading large file",
  ##     networkType = ntWifiOnly
  ##   )
  ##
  ##   # Check progress
  ##   let progress = downloadManager().getProgress(id)
  ##   echo "Progress: ", progress.int, "%"
  ##
  ##   # Check if complete
  ##   if downloadManager().getStatus(id) == dsSuccessful:
  ##     let uri = downloadManager().getUri(id)
  ##     if uri.isSome:
  ##       echo "Downloaded to: ", uri.get()
  ##
  ##   # Cancel if needed
  ##   if userWantsToCancel:
  ##     downloadManager().cancel(id)
  ##
  ## Note: Downloads continue even if app is killed.
  ## Use DownloadManager.ACTION_DOWNLOAD_COMPLETE broadcast
  ## to be notified when downloads finish (requires BroadcastReceiver).
  return runtime().sdkDownloadManager()

# TODO: Add broadcast receiver for download completion callbacks
# This would require additional infrastructure for handling broadcasts
# proc onDownloadComplete*(dm: SdkDownloadManager,
#                          callback: proc(downloadId: int64)) =
#   ## Register callback for download completion
#   ## Requires BroadcastReceiver infrastructure
