import jnim

jclass android.bluetooth.BluetoothSocket* of JVMObject:
  proc getRemoteDevice*(): BluetoothDevice
  proc getInputStream*(): InputStream
  proc getOutputStream*(): OutputStream
  proc isConnected*(): jboolean
  proc connect*()
  proc close*()
  proc getMaxTransmitPacketSize*(): jint
  proc getMaxReceivePacketSize*(): jint
  proc getConnectionType*(): jint
  proc setExcludeSdp*(excludeSdp: jboolean)
  proc requestMaximumTxDataLength*()
  proc getL2capLocalChannelId*(): jint
  proc getL2capRemoteChannelId*(): jint
  proc getSocketId*(): jlong
  proc getParcelFileDescriptor*(): ParcelFileDescriptor
  proc toString*(): string
  MAX_RFCOMM_CHANNEL*: jint {.`static`.}
  TYPE_RFCOMM*: jint {.`static`.}
  TYPE_SCO*: jint {.`static`.}
  TYPE_L2CAP*: jint {.`static`.}
  TYPE_L2CAP_BREDR*: jint {.`static`.}
  TYPE_L2CAP_LE*: jint {.`static`.}
  TYPE_LE*: jint {.`static`.}

