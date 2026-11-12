import jnim

jclass android.net.IpSecTransformResponse* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  resourceId*: jint
  status*: jint
  CREATOR*: Parcelable.Creator[IpSecTransformResponse] {.`static`.}

