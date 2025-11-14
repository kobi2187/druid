import jnim

jclass android.nearby.PresenceDevice* of NearbyDevice:
  proc getDeviceId*(): string
  proc getSalt*(): seq[jbyte]
  proc getSecretId*(): seq[jbyte]
  proc getEncryptedIdentity*(): seq[jbyte]
  proc getDeviceType*(): jint
  proc getDeviceImageUrl*(): string
  proc getDiscoveryTimestampMillis*(): jlong
  proc getExtendedProperties*(): List[DataElement]
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Creator[PresenceDevice] {.`static`.}

jclass android.nearby.PresenceDevice.Builder* of JVMObject:
  proc setName*(name: string): Builder
  proc addMedium*(medium: jint): Builder
  proc setRssi*(rssi: jint): Builder
  proc setDeviceType*(deviceType: jint): Builder
  proc setDeviceImageUrl*(deviceImageUrl: string): Builder
  proc setDiscoveryTimestampMillis*(discoveryTimestampMillis: jlong): Builder
  proc addExtendedProperty*(dataElement: DataElement): Builder
  proc build*(): PresenceDevice

jclass android.nearby.Builder* of JVMObject:
  proc setName*(name: string): Builder
  proc addMedium*(medium: jint): Builder
  proc setRssi*(rssi: jint): Builder
  proc setDeviceType*(deviceType: jint): Builder
  proc setDeviceImageUrl*(deviceImageUrl: string): Builder
  proc setDiscoveryTimestampMillis*(discoveryTimestampMillis: jlong): Builder
  proc addExtendedProperty*(dataElement: DataElement): Builder
  proc build*(): PresenceDevice

