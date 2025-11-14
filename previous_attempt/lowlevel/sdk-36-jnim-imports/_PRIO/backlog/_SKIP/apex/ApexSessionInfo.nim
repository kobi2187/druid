import jnim

jclass android.apex.ApexSessionInfo* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  sessionId*: jint
  isUnknown*: jboolean
  isVerified*: jboolean
  isStaged*: jboolean
  isActivated*: jboolean
  isRevertInProgress*: jboolean
  isActivationFailed*: jboolean
  isSuccess*: jboolean
  isReverted*: jboolean
  isRevertFailed*: jboolean
  crashingNativeProcess*: string
  errorMessage*: string
  CREATOR*: android.os.Parcelable.Creator[ApexSessionInfo] {.`static`.}

