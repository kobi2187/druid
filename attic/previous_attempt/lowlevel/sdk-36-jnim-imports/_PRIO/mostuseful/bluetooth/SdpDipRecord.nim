import jnim

jclass android.bluetooth.SdpDipRecord* of JVMObject:
  proc getSpecificationId*(): jint
  proc getVendorId*(): jint
  proc getVendorIdSource*(): jint
  proc getProductId*(): jint
  proc getVersion*(): jint
  proc getPrimaryRecord*(): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator {.`static`.}

