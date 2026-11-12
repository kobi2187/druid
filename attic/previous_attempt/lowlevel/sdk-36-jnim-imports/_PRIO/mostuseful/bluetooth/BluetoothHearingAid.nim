import jnim

jclass android.bluetooth.BluetoothHearingAid* of JVMObject:
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc connect*(device: BluetoothDevice): jboolean
  proc disconnect*(device: BluetoothDevice): jboolean
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc setActiveDevice*(device: BluetoothDevice): jboolean
  proc getActiveDevices*(): List[BluetoothDevice]
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  proc setVolume*(volume: jint)
  proc getHiSyncId*(device: BluetoothDevice): jlong
  proc getDeviceSide*(device: BluetoothDevice): jint
  proc getDeviceMode*(device: BluetoothDevice): jint
  proc getAdvertisementServiceData*(device: BluetoothDevice): AdvertisementServiceData
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}
  ACTION_ACTIVE_DEVICE_CHANGED*: string {.`static`.}
  SIDE_UNKNOWN*: jint {.`static`.}
  SIDE_LEFT*: jint {.`static`.}
  SIDE_RIGHT*: jint {.`static`.}
  MODE_UNKNOWN*: jint {.`static`.}
  MODE_MONAURAL*: jint {.`static`.}
  MODE_BINAURAL*: jint {.`static`.}
  HI_SYNC_ID_INVALID*: jlong {.`static`.}

jclass android.bluetooth.BluetoothHearingAid.AdvertisementServiceData* of JVMObject:
  proc getDeviceMode*(): jint
  proc getDeviceSide*(): jint
  proc isCsipSupported*(): jboolean
  proc getTruncatedHiSyncId*(): jint
  proc isInPairWith*(data: AdvertisementServiceData): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.bluetooth.AdvertisementServiceData* of JVMObject:
  proc getDeviceMode*(): jint
  proc getDeviceSide*(): jint
  proc isCsipSupported*(): jboolean
  proc getTruncatedHiSyncId*(): jint
  proc isInPairWith*(data: AdvertisementServiceData): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[AdvertisementServiceData] {.`static`.}

