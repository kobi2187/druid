import jnim

jclass android.os.CarrierAssociatedAppEntry* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  SDK_UNSPECIFIED*: jint {.`static`.}
  packageName*: string
  addedInSdk*: jint
  CREATOR*: Parcelable.Creator[CarrierAssociatedAppEntry] {.`static`.}

