import jnim

jclass android.content.AttributionSourceState* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  pid*: jint
  uid*: jint
  deviceId*: jint
  packageName*: string
  attributionTag*: string
  token*: android.os.IBinder
  renouncedPermissions*: string
  next*: android.content.AttributionSourceState
  CREATOR*: android.os.Parcelable.Creator[AttributionSourceState] {.`static`.}

