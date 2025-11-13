# PermissionManager

## Purpose

Handles Android runtime permissions (API 23+) with a clean, Future-based API. Abstracts the complexity of permission requests, rationales, and compatibility across API levels.

## API Design

```nim
type
  PermissionManager* = object
    activity: Option[jobject]
    pendingRequests: Table[int, Future[bool]]
    nextRequestCode: int

  PermissionStatus* = enum
    Granted,         # Permission granted
    Denied,          # Permission denied
    PermanentlyDenied # User selected "Don't ask again"

# Main APIs
proc hasPermission*(permission: AndroidPermission): bool
proc requestPermission*(permission: AndroidPermission): Future[bool]
proc requestPermissions*(permissions: seq[AndroidPermission]): Future[seq[bool]]
proc getPermissionStatus*(permission: AndroidPermission): PermissionStatus
proc shouldShowRationale*(permission: AndroidPermission): bool
proc openAppSettings*()
```

## Implementation

### 1. Permission Checking

```nim
proc hasPermission*(pm: PermissionManager,
                    permission: AndroidPermission): bool =
  ## Check if permission is granted
  ## Works on all API levels (pre-23 always returns true)

  let apiLevel = detectApiLevel()
  if apiLevel < 23:
    # Pre-Marshmallow: permissions granted at install time
    return true

  let ctx = getApplicationContext()

  # Call Context.checkSelfPermission()
  let contextClass = findClass("android/content/Context")
  let checkMethod = getMethodID(contextClass, "checkSelfPermission",
    "(Ljava/lang/String;)I")

  let permString = toJString(permission.toAndroidString())
  let result = callIntMethod(ctx, checkMethod, makeJValues(permString))
  env.DeleteLocalRef(permString)

  # PackageManager.PERMISSION_GRANTED = 0
  return result == 0

proc toAndroidString*(p: AndroidPermission): string =
  ## Convert AndroidPermission enum to Android permission string
  case p:
  of CAMERA:
    return "android.permission.CAMERA"
  of ACCESS_FINE_LOCATION:
    return "android.permission.ACCESS_FINE_LOCATION"
  of ACCESS_COARSE_LOCATION:
    return "android.permission.ACCESS_COARSE_LOCATION"
  of RECORD_AUDIO:
    return "android.permission.RECORD_AUDIO"
  of WRITE_EXTERNAL_STORAGE:
    return "android.permission.WRITE_EXTERNAL_STORAGE"
  of READ_EXTERNAL_STORAGE:
    return "android.permission.READ_EXTERNAL_STORAGE"
  # ... all other permissions
```

### 2. Permission Requesting

```nim
proc requestPermission*(pm: var PermissionManager,
                        permission: AndroidPermission): Future[bool] =
  ## Request permission asynchronously
  ## Returns Future that completes when user responds

  let apiLevel = detectApiLevel()
  if apiLevel < 23:
    # Pre-Marshmallow: already granted
    var fut = newFuture[bool]()
    fut.complete(true)
    return fut

  # Check if already granted
  if pm.hasPermission(permission):
    var fut = newFuture[bool]()
    fut.complete(true)
    return fut

  # Need Activity to request permission
  let activityOpt = getActivityContext()
  if activityOpt.isNone:
    var fut = newFuture[bool]()
    fut.fail(newException(RuntimeError,
      "No Activity available for permission request"))
    return fut

  let activity = activityOpt.get

  # Generate request code
  let requestCode = pm.nextRequestCode
  inc pm.nextRequestCode

  # Create future for result
  var fut = newFuture[bool]()
  pm.pendingRequests[requestCode] = fut

  # Call Activity.requestPermissions()
  let activityClass = findClass("android/app/Activity")
  let requestMethod = getMethodID(activityClass, "requestPermissions",
    "([Ljava/lang/String;I)V")

  let permArray = createStringArray(@[permission.toAndroidString()])
  callVoidMethod(activity, requestMethod,
    makeJValues(permArray, requestCode))
  env.DeleteLocalRef(permArray)

  return fut

# Callback from Java (Activity.onRequestPermissionsResult)
proc onRequestPermissionsResult*(requestCode: int,
                                  permissions: seq[string],
                                  grantResults: seq[int]) {.exportc, dynlib.} =
  ## Called from Java when user responds to permission request
  var pm = runtime().permissionManager.get

  if requestCode notin pm.pendingRequests:
    warn("Druid", "Unknown permission request code: " & $requestCode)
    return

  let fut = pm.pendingRequests[requestCode]
  pm.pendingRequests.del(requestCode)

  # Check if granted (PERMISSION_GRANTED = 0)
  let granted = grantResults.len > 0 and grantResults[0] == 0

  fut.complete(granted)
```

### 3. Multiple Permissions

```nim
proc requestPermissions*(pm: var PermissionManager,
                          permissions: seq[AndroidPermission]): Future[seq[bool]] =
  ## Request multiple permissions at once
  ## Returns Future with results for each permission

  let apiLevel = detectApiLevel()
  if apiLevel < 23:
    # All granted pre-Marshmallow
    var fut = newFuture[seq[bool]]()
    fut.complete(permissions.mapIt(true))
    return fut

  # Check which are already granted
  var alreadyGranted = newSeq[bool](permissions.len)
  var needRequest = newSeq[AndroidPermission]()

  for i, perm in permissions:
    if pm.hasPermission(perm):
      alreadyGranted[i] = true
    else:
      needRequest.add(perm)

  if needRequest.len == 0:
    # All already granted
    var fut = newFuture[seq[bool]]()
    fut.complete(alreadyGranted)
    return fut

  # Request remaining permissions
  let activityOpt = getActivityContext()
  if activityOpt.isNone:
    var fut = newFuture[seq[bool]]()
    fut.fail(newException(RuntimeError, "No Activity available"))
    return fut

  let activity = activityOpt.get
  let requestCode = pm.nextRequestCode
  inc pm.nextRequestCode

  var fut = newFuture[seq[bool]]()
  pm.pendingMultiRequests[requestCode] = (fut, permissions, alreadyGranted)

  # Call Activity.requestPermissions()
  let permStrings = needRequest.mapIt(it.toAndroidString())
  let permArray = createStringArray(permStrings)
  let activityClass = findClass("android/app/Activity")
  let requestMethod = getMethodID(activityClass, "requestPermissions",
    "([Ljava/lang/String;I)V")

  callVoidMethod(activity, requestMethod,
    makeJValues(permArray, requestCode))
  env.DeleteLocalRef(permArray)

  return fut
```

### 4. Permission Rationale

```nim
proc shouldShowRationale*(pm: PermissionManager,
                          permission: AndroidPermission): bool =
  ## Check if should show rationale for permission
  ## True if user denied once (but not "don't ask again")

  let apiLevel = detectApiLevel()
  if apiLevel < 23:
    return false

  let activityOpt = getActivityContext()
  if activityOpt.isNone:
    return false

  let activity = activityOpt.get
  let activityClass = findClass("android/app/Activity")
  let rationaleMethod = getMethodID(activityClass,
    "shouldShowRequestPermissionRationale",
    "(Ljava/lang/String;)Z")

  let permString = toJString(permission.toAndroidString())
  let result = callBooleanMethod(activity, rationaleMethod,
    makeJValues(permString))
  env.DeleteLocalRef(permString)

  return result

proc getPermissionStatus*(pm: PermissionManager,
                          permission: AndroidPermission): PermissionStatus =
  ## Get detailed permission status

  if pm.hasPermission(permission):
    return Granted

  if pm.shouldShowRationale(permission):
    return Denied  # User denied once, can request again

  # User denied and selected "don't ask again", or never requested
  # Distinguish by checking if we've ever requested it
  if permission in pm.requestedPermissions:
    return PermanentlyDenied
  else:
    return Denied

# Track requested permissions
var requestedPermissions: HashSet[AndroidPermission]

proc markRequested(permission: AndroidPermission) =
  requestedPermissions.incl(permission)
```

### 5. App Settings

```nim
proc openAppSettings*(pm: PermissionManager) =
  ## Open app settings where user can manually grant permissions

  let activity = getActivityContext()
  if activity.isNone:
    raise newException(RuntimeError, "No Activity available")

  # Create intent: ACTION_APPLICATION_DETAILS_SETTINGS
  let intentClass = findClass("android/content/Intent")
  let initMethod = getMethodID(intentClass, "<init>",
    "(Ljava/lang/String;)V")

  let action = toJString("android.settings.APPLICATION_DETAILS_SETTINGS")
  let intent = newObject(intentClass, initMethod, makeJValues(action))
  env.DeleteLocalRef(action)

  # Set data: package:com.example.app
  let packageName = packages().getPackageName()
  let uriString = toJString("package:" & packageName)
  let uriClass = findClass("android/net/Uri")
  let parseMethod = getMethodID(uriClass, "parse",
    "(Ljava/lang/String;)Landroid/net/Uri;", isStatic = true)
  let uri = callStaticObjectMethod(uriClass, parseMethod,
    makeJValues(uriString))
  env.DeleteLocalRef(uriString)

  let setDataMethod = getMethodID(intentClass, "setData",
    "(Landroid/net/Uri;)Landroid/content/Intent;")
  discard callObjectMethod(intent, setDataMethod, makeJValues(uri))

  # Start activity
  let activityClass = findClass("android/app/Activity")
  let startActivityMethod = getMethodID(activityClass, "startActivity",
    "(Landroid/content/Intent;)V")
  callVoidMethod(activity.get, startActivityMethod, makeJValues(intent))

  env.DeleteLocalRef(intent)
  env.DeleteLocalRef(uri)
```

## Java Integration

### Java Helper Class

```kotlin
// DruidPermissionHelper.kt
package com.druid.runtime

import android.app.Activity
import android.os.Bundle

class DruidPermissionHelper {
    companion object {
        @JvmStatic
        external fun onRequestPermissionsResult(
            requestCode: Int,
            permissions: Array<String>,
            grantResults: IntArray
        )
    }
}

// In Activity:
class MainActivity : Activity() {
    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        DruidPermissionHelper.onRequestPermissionsResult(
            requestCode, permissions, grantResults
        )
    }
}
```

## Usage Examples

### Example 1: Simple Permission Request

```nim
import druid
import asyncdispatch

proc takePicture() {.async.} =
  # Request camera permission
  let granted = await permissions().requestPermission(CAMERA)

  if granted:
    # Permission granted, use camera
    camera().takePhoto()
  else:
    echo "Camera permission denied"

waitFor takePicture()
```

### Example 2: With Rationale

```nim
proc requestCameraWithRationale() {.async.} =
  let perms = permissions()

  if perms.hasPermission(CAMERA):
    # Already have permission
    camera().takePhoto()
    return

  # Check if should show rationale
  if perms.shouldShowRationale(CAMERA):
    # Show explanation dialog
    showDialog("Camera Permission",
      "We need camera access to take photos for your profile.")

  # Request permission
  let granted = await perms.requestPermission(CAMERA)

  if granted:
    camera().takePhoto()
  else:
    # Check if permanently denied
    let status = perms.getPermissionStatus(CAMERA)
    if status == PermanentlyDenied:
      showDialog("Permission Required",
        "Please enable camera permission in settings.",
        onOk = proc() = perms.openAppSettings())
```

### Example 3: Multiple Permissions

```nim
proc setupApp() {.async.} =
  # Request multiple permissions
  let needed = @[CAMERA, ACCESS_FINE_LOCATION, RECORD_AUDIO]
  let results = await permissions().requestPermissions(needed)

  for i, perm in needed:
    if results[i]:
      echo perm, " granted"
    else:
      echo perm, " denied"

  # Proceed with granted permissions
  if results[0]:  # Camera
    echo "Camera available"
  if results[1]:  # Location
    echo "Location available"
```

## Testing

### Unit Tests

```nim
suite "PermissionManager":
  test "hasPermission returns true for granted":
    let pm = PermissionManager.init()
    # Mock granted permission
    mockGrantPermission(CAMERA)
    check pm.hasPermission(CAMERA) == true

  test "requestPermission returns future":
    let pm = PermissionManager.init()
    let fut = pm.requestPermission(CAMERA)
    check not fut.finished

    # Simulate user granting
    simulateUserResponse(requestCode = 0, granted = true)
    check fut.finished
    check fut.read() == true
```

### Integration Tests

```kotlin
@RunWith(AndroidJUnit4::class)
class PermissionManagerTest {
    @Test
    fun testPermissionRequest() {
        val activity = ActivityScenario.launch(TestActivity::class.java)

        activity.onActivity { act ->
            // Request from Nim
            val granted = requestPermissionBlocking(CAMERA)
            assertTrue(granted)
        }
    }
}
```

## Performance

- Permission checks: < 1ms (cached JNI call)
- Request initiation: < 5ms (async, doesn't block)
- Future completion: immediate when user responds

## Common Issues

### Issue 1: No Activity Available
```nim
# Solution: Wait for activity or use alternative flow
if getActivityContext().isNone:
  # Option 1: Queue for later
  queuePermissionRequest(CAMERA)

  # Option 2: Fail gracefully
  showError("Cannot request permissions at this time")
```

### Issue 2: Permanently Denied
```nim
# Solution: Guide user to settings
let status = permissions().getPermissionStatus(CAMERA)
if status == PermanentlyDenied:
  permissions().openAppSettings()
```

## Next Steps

1. Implement PermissionManager in managers/essential/PermissionManager.nim
2. Create Java helper class
3. Write unit tests
4. Test on API 21, 23, 30, 34
5. Create example app with permission flow
6. Document best practices for UX

## References

- [Android Permissions](https://developer.android.com/guide/topics/permissions/overview)
- [Request Runtime Permissions](https://developer.android.com/training/permissions/requesting)
- [Permission Best Practices](https://developer.android.com/training/permissions/usage-notes)
