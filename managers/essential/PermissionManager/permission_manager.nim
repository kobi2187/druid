## SDK Permission Manager - Runtime permission requests (API 23+)
##
## Uses Android SDK permission APIs (Java)
##
## Provides desktop-like permission handling:
## - Async permission requests with Future
## - High-level APIs (requestCameraAccess, requestLocationAccess)
## - Automatic rationale handling
## - Batch permission requests
## - Graceful degradation on older APIs

import ../../../core
import ../../../common  # For AndroidPermission
import ../../../art     # For API level detection
import jnim
import asyncdispatch
import tables
import options

# jnimport:
#   import android.content.Context
#   import android.app.Activity
#   import android.content.pm.PackageManager as JPM
# 
type
  PermissionResult* = object
    ## Result of a permission request
    granted*: seq[AndroidPermission]  ## Permissions that were granted
    denied*: seq[AndroidPermission]   ## Permissions that were denied

  SdkPermissionManager* = ref object
    context: jobject
    apiLevel: int
    # Pending permission requests (keyed by request code)
    pendingRequests: Table[int, Future[bool]]
    pendingMultiRequests: Table[int, tuple[fut: Future[PermissionResult], perms: seq[AndroidPermission]]]
    nextRequestCode: int

proc init*(_: typedesc[SdkPermissionManager]): SdkPermissionManager =
  ## Initialize SdkPermissionManager
  result = SdkPermissionManager()
  result.context = getContext()
  result.apiLevel = detectApiLevel()
  result.pendingRequests = initTable[int, Future[bool]]()
  result.pendingMultiRequests = initTable[int, tuple[fut: Future[PermissionResult], perms: seq[AndroidPermission]]]()
  result.nextRequestCode = 1000

proc hasPermission*(pm: SdkPermissionManager, permission: AndroidPermission): bool =
  ## Check if permission is currently granted
  ##
  ## Returns:
  ##   true if granted, false otherwise
  ##
  ## Example:
  ##   if permissions().hasPermission(CAMERA):
  ##     echo "Camera available"

  # Pre-API 23: permissions granted at install time
  if pm.apiLevel < 23:
    return true

  let permString = ($permission).toJString
  let result = pm.context.call("checkSelfPermission", permString).intVal

  # PackageManager.PERMISSION_GRANTED = 0
  return result == 0

proc requestPermission*(pm: SdkPermissionManager, permission: AndroidPermission): Future[bool] {.async.} =
  ## Request a single permission
  ##
  ## Args:
  ##   permission: The permission to request
  ##
  ## Returns:
  ##   Future[bool] - true if granted, false if denied
  ##
  ## Example:
  ##   let granted = await permissions().requestPermission(CAMERA)
  ##   if granted:
  ##     camera().takePhoto()

  # Pre-API 23: already granted
  if pm.apiLevel < 23:
    return true

  # Already granted?
  if pm.hasPermission(permission):
    return true

  # Need Activity to show permission dialog
  let activityOpt = getActivity()
  if activityOpt.isNone:
    raise newException(ValueError,
      "No Activity available for permission request. Call setCurrentActivity() first.")

  let activity = activityOpt.get()

  # Generate request code
  let requestCode = pm.nextRequestCode
  inc pm.nextRequestCode

  # Create future
  var fut = newFuture[bool]("requestPermission")
  pm.pendingRequests[requestCode] = fut

  # Request permission
  let permArray = newJArray[JString](1)
  permArray[0] = ($permission).toJString

  activity.call("requestPermissions", permArray, requestCode.jint)

  # Wait for result (will be completed by onRequestPermissionsResult callback)
  return await fut

# High-level permission APIs (desktop-like)

proc requestCameraAccess*(pm: SdkPermissionManager): Future[bool] {.async.} =
  ## Request camera permission with desktop-like simplicity
  ##
  ## Example:
  ##   let success = await permissions().requestCameraAccess()
  ##   if success:
  ##     let photo = await camera().takePicture()
  return await pm.requestPermission(CAMERA)

proc requestLocationAccess*(pm: SdkPermissionManager, precise: bool = true): Future[bool] {.async.} =
  ## Request location permission
  ##
  ## Args:
  ##   precise: If true, requests fine location. If false, requests coarse location.
  ##
  ## Example:
  ##   let granted = await permissions().requestLocationAccess()
  ##   if granted:
  ##     showLocationFeatures()
  ##   else:
  ##     showAlternativeFeatures()

  let permission = if precise: ACCESS_FINE_LOCATION else: ACCESS_COARSE_LOCATION
  return await pm.requestPermission(permission)

proc requestMicrophoneAccess*(pm: SdkPermissionManager): Future[bool] {.async.} =
  ## Request microphone permission
  ##
  ## Example:
  ##   if await permissions().requestMicrophoneAccess():
  ##     audio().startRecording()
  return await pm.requestPermission(RECORD_AUDIO)

proc requestStorageAccess*(pm: SdkPermissionManager, write: bool = true): Future[bool] {.async.} =
  ## Request storage permission
  ##
  ## Args:
  ##   write: If true, requests write access. If false, only read access.
  ##
  ## Note: On API 29+, scoped storage is used and these permissions
  ## are not required for app-specific directories.

  let permission = if write: WRITE_EXTERNAL_STORAGE else: READ_EXTERNAL_STORAGE

  # API 29+ uses scoped storage, these permissions less critical
  if pm.apiLevel >= 29:
    # For app-specific directories, permission not needed
    # Return true to indicate "access available"
    return true

  return await pm.requestPermission(permission)

proc requestMultiplePermissions*(pm: SdkPermissionManager,
                                  permissions: seq[AndroidPermission],
                                  showRationale: bool = false): Future[PermissionResult] {.async.} =
  ## Request multiple permissions at once
  ##
  ## Args:
  ##   permissions: List of permissions to request
  ##   showRationale: If true, shows rationale for denied permissions (TODO)
  ##
  ## Returns:
  ##   PermissionResult with granted and denied lists
  ##
  ## Example:
  ##   let result = await permissions().requestMultiplePermissions(
  ##     @[CAMERA, RECORD_AUDIO, WRITE_EXTERNAL_STORAGE]
  ##   )
  ##   echo "Granted: ", result.granted
  ##   echo "Denied: ", result.denied

  var result = PermissionResult(
    granted: @[],
    denied: @[]
  )

  # Pre-API 23: all granted
  if pm.apiLevel < 23:
    result.granted = permissions
    return result

  # Check which are already granted
  var needRequest: seq[AndroidPermission] = @[]
  for perm in permissions:
    if pm.hasPermission(perm):
      result.granted.add(perm)
    else:
      needRequest.add(perm)

  # All already granted?
  if needRequest.len == 0:
    return result

  # Need Activity
  let activityOpt = getActivity()
  if activityOpt.isNone:
    # Can't request without Activity, mark all as denied
    result.denied = needRequest
    return result

  let activity = activityOpt.get()

  # Generate request code
  let requestCode = pm.nextRequestCode
  inc pm.nextRequestCode

  # Create future
  var fut = newFuture[PermissionResult]("requestMultiplePermissions")
  pm.pendingMultiRequests[requestCode] = (fut, needRequest)

  # Build permission array
  let permArray = newJArray[JString](needRequest.len)
  for i, perm in needRequest:
    permArray[i] = ($perm).toJString

  # TODO: Show rationale if requested
  # if showRationale:
  #   for perm in needRequest:
  #     if shouldShowRationale(perm):
  #       showRationaleDialog(perm)

  # Request permissions
  activity.call("requestPermissions", permArray, requestCode.jint)

  # Wait for result
  let batchResult = await fut

  # Merge with already-granted permissions
  result.granted.add(batchResult.granted)
  result.denied.add(batchResult.denied)

  return result

# Callback from Java (Activity.onRequestPermissionsResult)
proc onRequestPermissionsResult*(requestCode: int,
                                  permissions: seq[string],
                                  grantResults: seq[int]) {.exportc, dynlib.} =
  ## Called from Java when user responds to permission request
  ##
  ## Java integration:
  ##   override fun onRequestPermissionsResult(
  ##     requestCode: Int,
  ##     permissions: Array<String>,
  ##     grantResults: IntArray
  ##   ) {
  ##     super.onRequestPermissionsResult(requestCode, permissions, grantResults)
  ##     onRequestPermissionsResult(requestCode, permissions, grantResults)
  ##   }

  let pm = permissions()

  # Check if single permission request
  if requestCode in pm.pendingRequests:
    let fut = pm.pendingRequests[requestCode]
    pm.pendingRequests.del(requestCode)

    # PERMISSION_GRANTED = 0
    let granted = grantResults.len > 0 and grantResults[0] == 0
    fut.complete(granted)

  # Check if multiple permission request
  elif requestCode in pm.pendingMultiRequests:
    let (fut, requestedPerms) = pm.pendingMultiRequests[requestCode]
    pm.pendingMultiRequests.del(requestCode)

    var result = PermissionResult(
      granted: @[],
      denied: @[]
    )

    # Match results with requested permissions
    for i in 0..<min(requestedPerms.len, grantResults.len):
      if grantResults[i] == 0:  # PERMISSION_GRANTED
        result.granted.add(requestedPerms[i])
      else:
        result.denied.add(requestedPerms[i])

    fut.complete(result)

# TODO: Implement rationale support
# proc shouldShowRationale*(pm: SdkPermissionManager, permission: AndroidPermission): bool =
#   ## Check if should show permission rationale
#   ## Returns true if user denied once but didn't select "don't ask again"

# Lazy accessor for AndroidRuntime
proc sdkPermissionManager*(runtime: AndroidRuntime): SdkPermissionManager =
  ## Get or create SdkPermissionManager instance
  if runtime.sdkPermissionManager.isNone:
    runtime.sdkPermissionManager = some(SdkPermissionManager.init())
  return runtime.sdkPermissionManager.get()

# Convenience global accessor
proc permissions*(): SdkPermissionManager =
  ## Global accessor for SdkPermissionManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   let granted = await permissions().requestCameraAccess()
  ##   if granted:
  ##     camera().takePhoto()
  return runtime().sdkPermissionManager()
