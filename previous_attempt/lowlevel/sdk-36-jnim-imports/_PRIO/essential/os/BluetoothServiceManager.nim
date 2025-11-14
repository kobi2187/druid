import jnim

jclass android.os.BluetoothServiceManager* of JVMObject:
  proc getBluetoothManagerServiceRegisterer*(): ServiceRegisterer
  BLUETOOTH_MANAGER_SERVICE*: string {.`static`.}

jclass android.os.BluetoothServiceManager.ServiceRegisterer* of JVMObject:
  proc register*(service: IBinder)
  proc get*(): IBinder
  proc getOrThrow*(): IBinder
  proc tryGet*(): IBinder

jclass android.os.ServiceRegisterer* of JVMObject:
  proc register*(service: IBinder)
  proc get*(): IBinder
  proc getOrThrow*(): IBinder
  proc tryGet*(): IBinder

jclass android.os.ServiceNotFoundException* of ServiceNotFoundException:

