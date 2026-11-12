import jnim

jclass android.uwb.UwbActivityEnergyInfo* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc getTimeSinceBootMillis*(): jlong
  proc getStackState*(): jint
  proc getControllerTxDurationMillis*(): jlong
  proc getControllerRxDurationMillis*(): jlong
  proc getControllerIdleDurationMillis*(): jlong
  proc getControllerWakeCount*(): jlong
  CREATOR*: Creator[UwbActivityEnergyInfo] {.`static`.}

jclass android.uwb.UwbActivityEnergyInfo.Builder* of JVMObject:
  proc setTimeSinceBootMillis*(timeSinceBootMillis: jlong): Builder
  proc setStackState*(stackState: jint): Builder
  proc setControllerTxDurationMillis*(txDurationMillis: jlong): Builder
  proc setControllerRxDurationMillis*(rxDurationMillis: jlong): Builder
  proc setControllerIdleDurationMillis*(idleDurationMillis: jlong): Builder
  proc setControllerWakeCount*(wakeCount: jlong): Builder
  proc build*(): UwbActivityEnergyInfo

jclass android.uwb.Builder* of JVMObject:
  proc setTimeSinceBootMillis*(timeSinceBootMillis: jlong): Builder
  proc setStackState*(stackState: jint): Builder
  proc setControllerTxDurationMillis*(txDurationMillis: jlong): Builder
  proc setControllerRxDurationMillis*(rxDurationMillis: jlong): Builder
  proc setControllerIdleDurationMillis*(idleDurationMillis: jlong): Builder
  proc setControllerWakeCount*(wakeCount: jlong): Builder
  proc build*(): UwbActivityEnergyInfo

