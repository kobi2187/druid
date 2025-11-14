import jnim

jclass android.apex.ApexSessionParams* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  sessionId*: jint
  childSessionIds*: jint
  hasRollbackEnabled*: jboolean
  isRollback*: jboolean
  rollbackId*: jint
  CREATOR*: android.os.Parcelable.Creator[ApexSessionParams] {.`static`.}

