import jnim

jclass android.apex.ApexInfo* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  moduleName*: string
  modulePath*: string
  preinstalledModulePath*: string
  versionCode*: jlong
  versionName*: string
  isFactory*: jboolean
  isActive*: jboolean
  hasClassPathJars*: jboolean
  activeApexChanged*: jboolean
  partition*: jbyte
  CREATOR*: android.os.Parcelable.Creator[ApexInfo] {.`static`.}

