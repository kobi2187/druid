import jnim

jclass android.bluetooth.BluetoothServerSocket* of JVMObject:
  proc accept*(): BluetoothSocket
  proc accept*(timeout: jint): BluetoothSocket
  proc close*()
  proc getChannel*(): jint
  proc getPsm*(): jint
  proc toString*(): string

