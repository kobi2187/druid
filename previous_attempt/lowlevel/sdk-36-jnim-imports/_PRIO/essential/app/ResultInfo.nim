import jnim

jclass android.app.ResultInfo* of JVMObject:
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  mResultWho*: string
  mRequestCode*: jint
  mResultCode*: jint
  mData*: Intent
  mCallerToken*: IBinder
  CREATOR*: Parcelable.Creator[ResultInfo] {.`static`.}

