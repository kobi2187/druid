import jnim

jclass android.bluetooth.BufferConstraints* of JVMObject:
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc forCodec*(codec: jint): BufferConstraint
  BUFFER_CODEC_MAX_NUM*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[BufferConstraints] {.`static`.}

