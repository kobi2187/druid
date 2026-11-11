import jnim

jclass android.apex.CompressedApexInfo* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  moduleName*: string
  versionCode*: jlong
  decompressedSize*: jlong
  CREATOR*: android.os.Parcelable.Creator[CompressedApexInfo] {.`static`.}

