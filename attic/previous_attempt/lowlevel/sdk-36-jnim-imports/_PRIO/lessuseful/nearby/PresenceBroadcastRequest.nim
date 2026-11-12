import jnim

jclass android.nearby.PresenceBroadcastRequest* of BroadcastRequest:
  proc getSalt*(): seq[jbyte]
  proc getActions*(): List[Integer]
  proc getCredential*(): PrivateCredential
  proc getExtendedProperties*(): List[DataElement]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[PresenceBroadcastRequest] {.`static`.}

jclass android.nearby.PresenceBroadcastRequest.Builder* of JVMObject:
  proc setVersion*(version: jint): Builder
  proc setTxPower*(txPower: jint): Builder
  proc addAction*(action: jint): Builder
  proc addExtendedProperty*(dataElement: DataElement): Builder
  proc build*(): PresenceBroadcastRequest

jclass android.nearby.Builder* of JVMObject:
  proc setVersion*(version: jint): Builder
  proc setTxPower*(txPower: jint): Builder
  proc addAction*(action: jint): Builder
  proc addExtendedProperty*(dataElement: DataElement): Builder
  proc build*(): PresenceBroadcastRequest

