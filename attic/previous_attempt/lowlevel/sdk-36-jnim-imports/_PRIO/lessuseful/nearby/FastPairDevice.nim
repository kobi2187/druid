import jnim

jclass android.nearby.FastPairDevice* of NearbyDevice:
  proc getTxPower*(): jint
  proc getModelId*(): string
  proc getBluetoothAddress*(): string
  proc getData*(): seq[jbyte]
  proc describeContents*(): jint
  proc toString*(): string
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[FastPairDevice] {.`static`.}

jclass android.nearby.FastPairDevice.Builder* of JVMObject:
  proc setName*(name: string): Builder
  proc addMedium*(medium: jint): Builder
  proc setRssi*(rssi: jint): Builder
  proc setTxPower*(txPower: jint): Builder
  proc setModelId*(modelId: string): Builder
  proc setBluetoothAddress*(bluetoothAddress: string): Builder
  proc setData*(data: seq[jbyte]): Builder
  proc build*(): FastPairDevice

jclass android.nearby.Builder* of JVMObject:
  proc setName*(name: string): Builder
  proc addMedium*(medium: jint): Builder
  proc setRssi*(rssi: jint): Builder
  proc setTxPower*(txPower: jint): Builder
  proc setModelId*(modelId: string): Builder
  proc setBluetoothAddress*(bluetoothAddress: string): Builder
  proc setData*(data: seq[jbyte]): Builder
  proc build*(): FastPairDevice

