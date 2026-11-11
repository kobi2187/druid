import jnim

jclass android.bluetooth.BluetoothActivityEnergyInfo* of JVMObject:
  proc toString*(): string
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc getBluetoothStackState*(): jint
  proc getControllerTxTimeMillis*(): jlong
  proc getControllerRxTimeMillis*(): jlong
  proc getControllerIdleTimeMillis*(): jlong
  proc getControllerEnergyUsed*(): jlong
  proc getTimestampMillis*(): jlong
  proc getUidTraffic*(): List[UidTraffic]
  proc setUidTraffic*(traffic: List[UidTraffic])
  proc isValid*(): jboolean
  BT_STACK_STATE_INVALID*: jint {.`static`.}
  BT_STACK_STATE_STATE_ACTIVE*: jint {.`static`.}
  BT_STACK_STATE_STATE_SCANNING*: jint {.`static`.}
  BT_STACK_STATE_STATE_IDLE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[BluetoothActivityEnergyInfo] {.`static`.}

