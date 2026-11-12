import jnim

jclass android.bluetooth.BluetoothHidDevice* of JVMObject:
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc registerApp*(sdp: BluetoothHidDeviceAppSdpSettings, inQos: BluetoothHidDeviceAppQosSettings, outQos: BluetoothHidDeviceAppQosSettings, executor: Executor, callback: Callback): jboolean
  proc unregisterApp*(): jboolean
  proc sendReport*(device: BluetoothDevice, id: jint, data: seq[jbyte]): jboolean
  proc replyReport*(device: BluetoothDevice, type: jbyte, id: jbyte, data: seq[jbyte]): jboolean
  proc reportError*(device: BluetoothDevice, error: jbyte): jboolean
  proc getUserAppName*(): string
  proc connect*(device: BluetoothDevice): jboolean
  proc disconnect*(device: BluetoothDevice): jboolean
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}
  SUBCLASS1_NONE*: jbyte {.`static`.}
  SUBCLASS1_KEYBOARD*: jbyte {.`static`.}
  SUBCLASS1_MOUSE*: jbyte {.`static`.}
  SUBCLASS1_COMBO*: jbyte {.`static`.}
  SUBCLASS2_UNCATEGORIZED*: jbyte {.`static`.}
  SUBCLASS2_JOYSTICK*: jbyte {.`static`.}
  SUBCLASS2_GAMEPAD*: jbyte {.`static`.}
  SUBCLASS2_REMOTE_CONTROL*: jbyte {.`static`.}
  SUBCLASS2_SENSING_DEVICE*: jbyte {.`static`.}
  SUBCLASS2_DIGITIZER_TABLET*: jbyte {.`static`.}
  SUBCLASS2_CARD_READER*: jbyte {.`static`.}
  REPORT_TYPE_INPUT*: jbyte {.`static`.}
  REPORT_TYPE_OUTPUT*: jbyte {.`static`.}
  REPORT_TYPE_FEATURE*: jbyte {.`static`.}
  ERROR_RSP_SUCCESS*: jbyte {.`static`.}
  ERROR_RSP_NOT_READY*: jbyte {.`static`.}
  ERROR_RSP_INVALID_RPT_ID*: jbyte {.`static`.}
  ERROR_RSP_UNSUPPORTED_REQ*: jbyte {.`static`.}
  ERROR_RSP_INVALID_PARAM*: jbyte {.`static`.}
  ERROR_RSP_UNKNOWN*: jbyte {.`static`.}
  PROTOCOL_BOOT_MODE*: jbyte {.`static`.}
  PROTOCOL_REPORT_MODE*: jbyte {.`static`.}

jclass android.bluetooth.BluetoothHidDevice.Callback* of JVMObject:
  proc onAppStatusChanged*(pluggedDevice: BluetoothDevice, registered: jboolean)
  proc onConnectionStateChanged*(device: BluetoothDevice, state: jint)
  proc onGetReport*(device: BluetoothDevice, type: jbyte, id: jbyte, bufferSize: jint)
  proc onSetReport*(device: BluetoothDevice, type: jbyte, id: jbyte, data: seq[jbyte])
  proc onSetProtocol*(device: BluetoothDevice, protocol: jbyte)
  proc onInterruptData*(device: BluetoothDevice, reportId: jbyte, data: seq[jbyte])
  proc onVirtualCableUnplug*(device: BluetoothDevice)

jclass android.bluetooth.Callback* of JVMObject:
  proc onAppStatusChanged*(pluggedDevice: BluetoothDevice, registered: jboolean)
  proc onConnectionStateChanged*(device: BluetoothDevice, state: jint)
  proc onGetReport*(device: BluetoothDevice, type: jbyte, id: jbyte, bufferSize: jint)
  proc onSetReport*(device: BluetoothDevice, type: jbyte, id: jbyte, data: seq[jbyte])
  proc onSetProtocol*(device: BluetoothDevice, protocol: jbyte)
  proc onInterruptData*(device: BluetoothDevice, reportId: jbyte, data: seq[jbyte])
  proc onVirtualCableUnplug*(device: BluetoothDevice)

