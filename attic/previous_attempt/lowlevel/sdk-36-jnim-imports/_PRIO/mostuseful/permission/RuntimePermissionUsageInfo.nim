import jnim

jclass android.permission.RuntimePermissionUsageInfo* of JVMObject:
  proc getAppAccessCount*(): jint
  proc getName*(): string
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CREATOR*: Creator[RuntimePermissionUsageInfo] {.`static`.}

