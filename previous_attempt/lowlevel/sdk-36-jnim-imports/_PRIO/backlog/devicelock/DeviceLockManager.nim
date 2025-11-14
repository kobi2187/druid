import jnim

jclass android.devicelock.DeviceLockManager* of JVMObject:
  proc getService*(): IDeviceLockService
  proc lockDevice*(executor: Executor, callback: OutcomeReceiver[Void, Exception])
  proc unlockDevice*(executor: Executor, callback: OutcomeReceiver[Void, Exception])
  proc isDeviceLocked*(executor: Executor, callback: OutcomeReceiver[Boolean, Exception])
  proc clearDeviceRestrictions*(executor: Executor, callback: OutcomeReceiver[Void, Exception])
  proc getDeviceId*(executor: Executor, callback: OutcomeReceiver[DeviceId, Exception])
  proc getKioskApps*(executor: Executor, callback: OutcomeReceiver[Map<Integer, String>, Exception])
  DEVICE_LOCK_ROLE_FINANCING*: jint {.`static`.}

