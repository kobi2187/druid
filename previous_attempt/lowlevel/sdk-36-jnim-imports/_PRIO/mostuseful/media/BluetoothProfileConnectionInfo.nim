import jnim

jclass android.media.BluetoothProfileConnectionInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc createA2dpInfo*(suppressNoisyIntent: jboolean, volume: jint): BluetoothProfileConnectionInfo {.`static`.}
  proc createA2dpSinkInfo*(volume: jint): BluetoothProfileConnectionInfo {.`static`.}
  proc createHearingAidInfo*(suppressNoisyIntent: jboolean): BluetoothProfileConnectionInfo {.`static`.}
  proc createLeAudioInfo*(suppressNoisyIntent: jboolean, isLeOutput: jboolean): BluetoothProfileConnectionInfo {.`static`.}
  proc createLeAudioOutputInfo*(suppressNoisyIntent: jboolean, volume: jint): BluetoothProfileConnectionInfo {.`static`.}
  proc getProfile*(): jint
  proc isSuppressNoisyIntent*(): jboolean
  proc getVolume*(): jint
  proc isLeOutput*(): jboolean
  proc createHfpInfo*(): BluetoothProfileConnectionInfo {.`static`.}
  CREATOR*: Parcelable.Creator[BluetoothProfileConnectionInfo] {.`static`.}

