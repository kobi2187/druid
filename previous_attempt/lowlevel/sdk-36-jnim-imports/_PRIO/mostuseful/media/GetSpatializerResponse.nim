import jnim

jclass android.media.GetSpatializerResponse* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  spatializer*: android.media.ISpatializer
  CREATOR*: android.os.Parcelable.Creator[GetSpatializerResponse] {.`static`.}

