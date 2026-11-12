import jnim

jclass android.os.Messenger* of JVMObject:
  proc send*(message: Message)
  proc getBinder*(): IBinder
  proc equals*(otherObj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc writeMessengerOrNullToParcel*(messenger: Messenger, output:Parcel) {.`static`.}
  proc readMessengerOrNullFromParcel*(in: Parcel): Messenger {.`static`.}
  CREATOR*: Parcelable.Creator[Messenger] {.`static`.}

