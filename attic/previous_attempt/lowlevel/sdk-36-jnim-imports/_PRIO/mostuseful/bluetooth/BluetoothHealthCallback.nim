import jnim

jclass android.bluetooth.BluetoothHealthCallback* of JVMObject:
  proc onHealthAppConfigurationStatusChange*(config: BluetoothHealthAppConfiguration, status: jint)
  proc onHealthChannelStateChange*(config: BluetoothHealthAppConfiguration, device: BluetoothDevice, prevState: jint, newState: jint, fd: ParcelFileDescriptor, channelId: jint)

