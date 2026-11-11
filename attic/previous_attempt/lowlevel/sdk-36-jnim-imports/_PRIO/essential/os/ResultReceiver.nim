import jnim

jclass android.os.ResultReceiver* of JVMObject:
  proc send*(resultCode: jint, resultData: Bundle)
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[ResultReceiver] {.`static`.}

