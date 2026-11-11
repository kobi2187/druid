import jnim

jclass android.bluetooth.BluetoothLeBroadcastReceiveState* of JVMObject:
  proc getSourceId*(): jint
  proc getSourceAddressType*(): jint
  proc getSourceDevice*(): BluetoothDevice
  proc getSourceAdvertisingSid*(): jint
  proc getBroadcastId*(): jint
  proc getPaSyncState*(): jint
  proc getBigEncryptionState*(): jint
  proc getBadCode*(): seq[jbyte]
  proc getNumSubgroups*(): jint
  proc getBisSyncState*(): List[Long]
  proc getSubgroupMetadata*(): List[BluetoothLeAudioContentMetadata]
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  PA_SYNC_STATE_IDLE*: jint {.`static`.}
  PA_SYNC_STATE_SYNCINFO_REQUEST*: jint {.`static`.}
  PA_SYNC_STATE_SYNCHRONIZED*: jint {.`static`.}
  PA_SYNC_STATE_FAILED_TO_SYNCHRONIZE*: jint {.`static`.}
  PA_SYNC_STATE_NO_PAST*: jint {.`static`.}
  PA_SYNC_STATE_INVALID*: jint {.`static`.}
  BIG_ENCRYPTION_STATE_NOT_ENCRYPTED*: jint {.`static`.}
  BIG_ENCRYPTION_STATE_CODE_REQUIRED*: jint {.`static`.}
  BIG_ENCRYPTION_STATE_DECRYPTING*: jint {.`static`.}
  BIG_ENCRYPTION_STATE_BAD_CODE*: jint {.`static`.}
  BIG_ENCRYPTION_STATE_INVALID*: jint {.`static`.}
  CREATOR*: Creator[BluetoothLeBroadcastReceiveState] {.`static`.}

