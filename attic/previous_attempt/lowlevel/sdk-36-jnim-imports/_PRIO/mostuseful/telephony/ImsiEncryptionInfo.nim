import jnim

jclass android.telephony.ImsiEncryptionInfo* of JVMObject:
  proc getMnc*(): string
  proc getMcc*(): string
  proc getCarrierId*(): jint
  proc getKeyIdentifier*(): string
  proc getKeyType*(): jint
  proc getPublicKey*(): PublicKey
  proc getExpirationTime*(): Date
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[ImsiEncryptionInfo] {.`static`.}

