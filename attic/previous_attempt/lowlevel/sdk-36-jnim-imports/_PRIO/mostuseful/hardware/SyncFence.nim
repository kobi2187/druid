import jnim

jclass android.hardware.SyncFence* of JVMObject:
  proc createEmpty*(): SyncFence {.`static`.}
  proc create*(wrapped: ParcelFileDescriptor): SyncFence {.`static`.}
  proc adopt*(fileDescriptor: jint): SyncFence {.`static`.}
  proc getFdDup*(): ParcelFileDescriptor
  proc isValid*(): jboolean
  proc await*(timeout: Duration): jboolean
  proc awaitForever*(): jboolean
  proc getSignalTime*(): jlong
  proc close*()
  proc describeContents*(): jint
  proc getLock*(): JObject
  proc getNativeFence*(): jlong
  proc writeToParcel*(output:Parcel, flags: jint)
  SIGNAL_TIME_INVALID*: jlong {.`static`.}
  SIGNAL_TIME_PENDING*: jlong {.`static`.}
  CREATOR*: Parcelable.Creator[SyncFence] {.`static`.}

