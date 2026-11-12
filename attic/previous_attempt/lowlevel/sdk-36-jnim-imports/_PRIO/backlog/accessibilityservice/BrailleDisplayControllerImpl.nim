import jnim

jclass android.accessibilityservice.BrailleDisplayControllerImpl* of JVMObject:
  proc connect*(bluetoothDevice: BluetoothDevice, callback: BrailleDisplayCallback)
  proc connect*(bluetoothDevice: BluetoothDevice, callbackExecutor: Executor, callback: BrailleDisplayCallback)
  proc connect*(usbDevice: UsbDevice, callback: BrailleDisplayCallback)
  proc connect*(usbDevice: UsbDevice, callbackExecutor: Executor, callback: BrailleDisplayCallback)
  proc isConnected*(): jboolean
  proc write*(buffer: seq[jbyte])
  proc disconnect*()

