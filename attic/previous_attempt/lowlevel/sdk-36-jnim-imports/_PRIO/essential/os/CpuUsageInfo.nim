import jnim

jclass android.os.CpuUsageInfo* of JVMObject:
  proc getActive*(): jlong
  proc getTotal*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[CpuUsageInfo] {.`static`.}

