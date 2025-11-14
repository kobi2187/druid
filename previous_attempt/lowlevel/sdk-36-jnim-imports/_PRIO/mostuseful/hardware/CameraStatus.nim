import jnim

jclass android.hardware.CameraStatus* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc readFromParcel*(in: Parcel)
  cameraId*: string
  status*: jint
  unavailablePhysicalCameras*: string
  clientPackage*: string
  deviceId*: jint
  CREATOR*: Parcelable.Creator[CameraStatus] {.`static`.}

