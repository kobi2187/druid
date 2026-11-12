import jnim

jclass android.hardware.CameraInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  info*: Camera.CameraInfo
  CREATOR*: Parcelable.Creator[CameraInfo] {.`static`.}

