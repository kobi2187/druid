## Runtime permissions, desktop-style: ask, then look at the answer when it comes.
##
## ```nim
## let req = permissions().request(apCamera, apRecordAudio)
## # ... later, after pollEvents() (attachDruid does it each frame):
## case permissions().status(req)
## of psGranted: startRecording()
## of psDenied: showWhyWeNeedIt()
## of psPending: discard
## ```
##
## The system dialog is shown by DruidPermissionActivity, so this works from a
## NativeActivity (RUI) as well as from an ordinary one. The permissions must
## also be in the app's AndroidManifest.xml, or Android denies them without asking.
## On the desktop everything is granted.

import std/[options]
import bridge, events

type
  AndroidPermission* = enum
    apCamera = "android.permission.CAMERA"
    apLocationFine = "android.permission.ACCESS_FINE_LOCATION"
    apLocationCoarse = "android.permission.ACCESS_COARSE_LOCATION"
    apLocationBackground = "android.permission.ACCESS_BACKGROUND_LOCATION"
    apStorageRead = "android.permission.READ_EXTERNAL_STORAGE"
    apStorageWrite = "android.permission.WRITE_EXTERNAL_STORAGE"
    apMediaImages = "android.permission.READ_MEDIA_IMAGES"          ## Android 13+
    apMediaVideo = "android.permission.READ_MEDIA_VIDEO"            ## Android 13+
    apMediaAudio = "android.permission.READ_MEDIA_AUDIO"            ## Android 13+
    apRecordAudio = "android.permission.RECORD_AUDIO"
    apReadPhoneState = "android.permission.READ_PHONE_STATE"
    apCallPhone = "android.permission.CALL_PHONE"
    apSendSms = "android.permission.SEND_SMS"
    apReadSms = "android.permission.READ_SMS"
    apReadContacts = "android.permission.READ_CONTACTS"
    apWriteContacts = "android.permission.WRITE_CONTACTS"
    apReadCalendar = "android.permission.READ_CALENDAR"
    apWriteCalendar = "android.permission.WRITE_CALENDAR"
    apBodySensors = "android.permission.BODY_SENSORS"
    apActivityRecognition = "android.permission.ACTIVITY_RECOGNITION"
    apBluetoothConnect = "android.permission.BLUETOOTH_CONNECT"     ## Android 12+
    apBluetoothScan = "android.permission.BLUETOOTH_SCAN"           ## Android 12+
    apBluetoothAdvertise = "android.permission.BLUETOOTH_ADVERTISE" ## Android 12+
    apNearbyWifiDevices = "android.permission.NEARBY_WIFI_DEVICES"  ## Android 13+
    apPostNotifications = "android.permission.POST_NOTIFICATIONS"   ## Android 13+
    # Normal permissions: declared in the manifest, granted at install, never asked.
    apInternet = "android.permission.INTERNET"
    apNetworkState = "android.permission.ACCESS_NETWORK_STATE"
    apWifiState = "android.permission.ACCESS_WIFI_STATE"
    apVibrate = "android.permission.VIBRATE"
    apWakeLock = "android.permission.WAKE_LOCK"

  PermissionGroup* = enum
    ## What an app asks for, in the words a user would use.
    pgCamera, pgLocation, pgMicrophone, pgContacts, pgPhone, pgCalendar,
    pgSensors, pgPhotos, pgNotifications, pgNearbyDevices

  PermissionStatus* = enum
    psPending   ## no answer yet
    psGranted   ## all of the request's permissions were granted
    psDenied    ## at least one was denied

  PermissionRequest* = object
    id*: int

  Permissions* = object

proc permissions*(): Permissions = discard

proc members*(g: PermissionGroup): seq[AndroidPermission] =
  ## The permissions that make up `g`.
  case g
  of pgCamera: @[apCamera]
  of pgLocation: @[apLocationFine, apLocationCoarse]
  of pgMicrophone: @[apRecordAudio]
  of pgContacts: @[apReadContacts, apWriteContacts]
  of pgPhone: @[apReadPhoneState, apCallPhone]
  of pgCalendar: @[apReadCalendar, apWriteCalendar]
  of pgSensors: @[apBodySensors, apActivityRecognition]
  of pgPhotos: @[apMediaImages, apMediaVideo]
  of pgNotifications: @[apPostNotifications]
  of pgNearbyDevices: @[apBluetoothScan, apBluetoothConnect]

proc check*(_: Permissions, permission: string): bool =
  ## Whether `permission` is granted now. Always true on the desktop.
  bridged(true): callStatic(bool, "Permissions", "check", permission)
proc check*(p: Permissions, permission: AndroidPermission): bool = p.check($permission)
proc check*(p: Permissions, group: PermissionGroup): bool =
  for m in group.members:
    if not p.check(m): return false
  true

proc shouldShowRationale*(_: Permissions, permission: AndroidPermission): bool =
  ## Whether the user denied it before, so the app should explain before asking again.
  bridged(false): callStatic(bool, "Permissions", "shouldShowRationale", $permission)

var nextRequest {.threadvar.}: int

proc request*(_: Permissions, perms: openArray[string]): PermissionRequest =
  ## Ask for `perms`. The answer comes as an `ekPermission` event with this
  ## request's id; `status` reads it. Already granted ones are answered at once,
  ## without a dialog.
  inc nextRequest
  result = PermissionRequest(id: nextRequest)
  if druidStarted():
    callStatic(void, "Permissions", "request", @perms, result.id)
  else:
    var fields = @[$result.id]
    for p in perms: fields.add p; fields.add "1"
    postLocal encodeEvent("permission", fields)

proc request*(p: Permissions, perms: varargs[AndroidPermission]): PermissionRequest =
  var s: seq[string]
  for x in perms: s.add $x
  p.request(s)

proc request*(p: Permissions, group: PermissionGroup): PermissionRequest =
  p.request(group.members)

proc status*(_: Permissions, req: PermissionRequest): PermissionStatus =
  ## The answer to `req`, as far as `pollEvents` has seen.
  let r = permissionResult(req.id)
  if r.isNone: return psPending
  for (_, granted) in r.get:
    if not granted: return psDenied
  psGranted

proc results*(_: Permissions, req: PermissionRequest): seq[tuple[permission: string, granted: bool]] =
  ## Each permission of `req` and whether it was granted; empty while pending.
  permissionResult(req.id).get(@[])

proc openSettings*(_: Permissions) =
  ## Opens this app's system settings, where a permission denied for good can be granted.
  if druidStarted(): callStatic(void, "Permissions", "openSettings")
