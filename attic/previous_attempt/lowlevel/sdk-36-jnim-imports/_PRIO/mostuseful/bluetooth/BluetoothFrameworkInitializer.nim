import jnim

jclass android.bluetooth.BluetoothFrameworkInitializer* of JVMObject:
  proc setBluetoothServiceManager*(bluetoothServiceManager: BluetoothServiceManager) {.`static`.}
  proc getBluetoothServiceManager*(): BluetoothServiceManager {.`static`.}
  proc setBinderCallsStatsInitializer*(binderCallsStatsConsumer: Consumer[Context]) {.`static`.}
  proc initializeBinderCallsStats*(context: Context) {.`static`.}
  proc registerServiceWrappers*() {.`static`.}

