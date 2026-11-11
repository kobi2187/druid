import jnim

jclass android.nfc.NfcServiceManager* of JVMObject:
  proc getNfcManagerServiceRegisterer*(): ServiceRegisterer

jclass android.nfc.NfcServiceManager.ServiceRegisterer* of JVMObject:
  proc register*(service: IBinder)
  proc get*(): IBinder
  proc getOrThrow*(): IBinder
  proc tryGet*(): IBinder

jclass android.nfc.ServiceRegisterer* of JVMObject:
  proc register*(service: IBinder)
  proc get*(): IBinder
  proc getOrThrow*(): IBinder
  proc tryGet*(): IBinder

jclass android.nfc.ServiceNotFoundException* of ServiceNotFoundException:

