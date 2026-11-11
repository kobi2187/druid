import jnim

jclass android.nearby.PresenceScanFilter* of ScanFilter:
  proc getCredentials*(): List[PublicCredential]
  proc getPresenceActions*(): List[Integer]
  proc getExtendedProperties*(): List[DataElement]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[PresenceScanFilter] {.`static`.}

jclass android.nearby.PresenceScanFilter.Builder* of JVMObject:
  proc setMaxPathLoss*(maxPathLoss: jint): Builder
  proc addCredential*(credential: PublicCredential): Builder
  proc addPresenceAction*(action: jint): Builder
  proc addExtendedProperty*(dataElement: DataElement): Builder
  proc build*(): PresenceScanFilter

jclass android.nearby.Builder* of JVMObject:
  proc setMaxPathLoss*(maxPathLoss: jint): Builder
  proc addCredential*(credential: PublicCredential): Builder
  proc addPresenceAction*(action: jint): Builder
  proc addExtendedProperty*(dataElement: DataElement): Builder
  proc build*(): PresenceScanFilter

