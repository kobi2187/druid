import jnim

jclass android.nearby.NearbyDeviceParcelable* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc getDeviceId*(): jlong
  proc getScanType*(): jint
  proc getName*(): string
  proc getMedium*(): jint
  proc getTxPower*(): jint
  proc getRssi*(): jint
  proc getAction*(): jint
  proc getPublicCredential*(): PublicCredential
  proc getFastPairModelId*(): string
  proc getBluetoothAddress*(): string
  proc getData*(): seq[jbyte]
  proc getSalt*(): seq[jbyte]
  proc getPresenceDevice*(): PresenceDevice
  proc getEncryptionKeyTag*(): seq[jbyte]
  CREATOR*: Creator[NearbyDeviceParcelable] {.`static`.}

jclass android.nearby.NearbyDeviceParcelable.Builder* of JVMObject:
  proc setDeviceId*(deviceId: jlong): Builder
  proc setScanType*(scanType: jint): Builder
  proc setName*(name: string): Builder
  proc setMedium*(medium: jint): Builder
  proc setTxPower*(txPower: jint): Builder
  proc setRssi*(rssi: jint): Builder
  proc setAction*(action: jint): Builder
  proc setPublicCredential*(publicCredential: PublicCredential): Builder
  proc setFastPairModelId*(fastPairModelId: string): Builder
  proc setBluetoothAddress*(bluetoothAddress: string): Builder
  proc setData*(data: seq[jbyte]): Builder
  proc setEncryptionKeyTag*(encryptionKeyTag: seq[jbyte]): Builder
  proc setSalt*(salt: seq[jbyte]): Builder
  proc setPresenceDevice*(presenceDevice: PresenceDevice): Builder
  proc build*(): NearbyDeviceParcelable

jclass android.nearby.Builder* of JVMObject:
  proc setDeviceId*(deviceId: jlong): Builder
  proc setScanType*(scanType: jint): Builder
  proc setName*(name: string): Builder
  proc setMedium*(medium: jint): Builder
  proc setTxPower*(txPower: jint): Builder
  proc setRssi*(rssi: jint): Builder
  proc setAction*(action: jint): Builder
  proc setPublicCredential*(publicCredential: PublicCredential): Builder
  proc setFastPairModelId*(fastPairModelId: string): Builder
  proc setBluetoothAddress*(bluetoothAddress: string): Builder
  proc setData*(data: seq[jbyte]): Builder
  proc setEncryptionKeyTag*(encryptionKeyTag: seq[jbyte]): Builder
  proc setSalt*(salt: seq[jbyte]): Builder
  proc setPresenceDevice*(presenceDevice: PresenceDevice): Builder
  proc build*(): NearbyDeviceParcelable

