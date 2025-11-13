# enums to use, and basic data structures and objects.



import common, asyncfutures, sequtils

type
  AndroidFeature* = enum
    afAudio, afCamera, afLocation, afStorage, afVibration,
    afNotifications, afSensors, afBluetooth, afNFC, afTelephony,
    afNetwork, afDatabase, afCrypto

var usedFeatures {.compileTime.}: set[AndroidFeature]

template trackFeature(feature: AndroidFeature) =
  static:
    usedFeatures.incl(feature)


proc requestPermissions*(permissions: seq[AndroidPermission]): Future[PermissionResult] =
  let permissionStrings = permissions.mapIt($it)  # Auto-convert to strings
  for p in permissionStrings:
    var res = requestPerm(p)
    # todo ...

