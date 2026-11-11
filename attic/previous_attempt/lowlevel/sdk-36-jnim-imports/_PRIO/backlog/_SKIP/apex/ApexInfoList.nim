import jnim

jclass android.apex.ApexInfoList* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  apexInfos*: android.apex.ApexInfo
  CREATOR*: android.os.Parcelable.Creator[ApexInfoList] {.`static`.}

