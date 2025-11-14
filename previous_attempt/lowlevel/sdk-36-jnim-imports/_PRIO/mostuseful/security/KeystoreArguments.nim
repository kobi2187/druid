import jnim

jclass android.security.KeystoreArguments* of JVMObject:
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  args*: jbyte
  CREATOR*: Parcelable.Creator[KeystoreArguments] {.`static`.}

