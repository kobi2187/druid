import jnim

jclass android.permission.RuntimePermissionPresentationInfo* of JVMObject:
  proc isGranted*(): jboolean
  proc isStandard*(): jboolean
  proc getLabel*(): CharSequence
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CREATOR*: Creator[RuntimePermissionPresentationInfo] {.`static`.}

