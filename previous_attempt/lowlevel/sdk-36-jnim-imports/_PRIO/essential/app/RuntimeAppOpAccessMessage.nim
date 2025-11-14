import jnim

jclass android.app.RuntimeAppOpAccessMessage* of JVMObject:
  proc getOp*(): string
  proc getUid*(): jint
  proc getPackageName*(): string
  proc getAttributionTag*(): string
  proc getMessage*(): string
  proc getSamplingStrategy*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[RuntimeAppOpAccessMessage] {.`static`.}

