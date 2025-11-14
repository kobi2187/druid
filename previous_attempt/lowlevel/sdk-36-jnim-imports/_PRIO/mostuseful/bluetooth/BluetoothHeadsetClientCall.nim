import jnim

jclass android.bluetooth.BluetoothHeadsetClientCall* of JVMObject:
  proc setAttributionSource*(attributionSource: AttributionSource)
  proc setState*(state: jint)
  proc setNumber*(number: string)
  proc setMultiParty*(multiParty: jboolean)
  proc getDevice*(): BluetoothDevice
  proc getId*(): jint
  proc getUUID*(): UUID
  proc getState*(): jint
  proc getNumber*(): string
  proc getCreationElapsedMilli*(): jlong
  proc isMultiParty*(): jboolean
  proc isOutgoing*(): jboolean
  proc isInBandRing*(): jboolean
  proc toString*(): string
  proc toString*(loggable: jboolean): string
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  CALL_STATE_ACTIVE*: jint {.`static`.}
  CALL_STATE_HELD*: jint {.`static`.}
  CALL_STATE_DIALING*: jint {.`static`.}
  CALL_STATE_ALERTING*: jint {.`static`.}
  CALL_STATE_INCOMING*: jint {.`static`.}
  CALL_STATE_WAITING*: jint {.`static`.}
  CALL_STATE_HELD_BY_RESPONSE_AND_HOLD*: jint {.`static`.}
  CALL_STATE_TERMINATED*: jint {.`static`.}
  CREATOR*: Creator[BluetoothHeadsetClientCall] {.`static`.}

