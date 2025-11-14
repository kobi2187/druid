import jnim

jclass android.app.ServiceStartArgs* of JVMObject:
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  taskRemoved*: jboolean
  startId*: jint
  flags*: jint
  args*: Intent
  CREATOR*: Parcelable.Creator[ServiceStartArgs] {.`static`.}

