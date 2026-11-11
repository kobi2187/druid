import jnim

jclass android.net.NetworkQuotaInfo* of JVMObject:
  proc getEstimatedBytes*(): jlong
  proc getSoftLimitBytes*(): jlong
  proc getHardLimitBytes*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  NO_LIMIT*: jlong {.`static`.}
  CREATOR*: Creator[NetworkQuotaInfo] {.`static`.}

