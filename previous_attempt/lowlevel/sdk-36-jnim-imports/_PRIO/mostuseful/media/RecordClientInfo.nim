import jnim

jclass android.media.RecordClientInfo* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  riid*: jint
  uid*: jint
  session*: jint
  source*: jint
  portId*: jint
  silenced*: jboolean
  CREATOR*: android.os.Parcelable.Creator[RecordClientInfo] {.`static`.}

