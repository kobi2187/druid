import jnim

jclass android.telecom.CallAudioState* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc isMuted*(): jboolean
  proc getRoute*(): jint
  proc getSupportedRouteMask*(): jint
  proc getRawSupportedRouteMask*(): jint
  proc getActiveBluetoothDevice*(): BluetoothDevice
  proc getSupportedBluetoothDevices*(): Collection[BluetoothDevice]
  proc audioRouteToString*(route: jint): string {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(destination: Parcel, flags: jint)
  ROUTE_EARPIECE*: jint {.`static`.}
  ROUTE_BLUETOOTH*: jint {.`static`.}
  ROUTE_WIRED_HEADSET*: jint {.`static`.}
  ROUTE_SPEAKER*: jint {.`static`.}
  ROUTE_STREAMING*: jint {.`static`.}
  ROUTE_WIRED_OR_EARPIECE*: jint {.`static`.}
  ROUTE_ALL*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CallAudioState] {.`static`.}

