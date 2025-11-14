import jnim

jclass android.bluetooth.BluetoothLeCall* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getUuid*(): UUID
  proc getUri*(): string
  proc getFriendlyName*(): string
  proc getState*(): jint
  proc getCallFlags*(): jint
  proc isIncomingCall*(): jboolean
  STATE_INCOMING*: jint {.`static`.}
  STATE_DIALING*: jint {.`static`.}
  STATE_ALERTING*: jint {.`static`.}
  STATE_ACTIVE*: jint {.`static`.}
  STATE_LOCALLY_HELD*: jint {.`static`.}
  STATE_REMOTELY_HELD*: jint {.`static`.}
  STATE_LOCALLY_AND_REMOTELY_HELD*: jint {.`static`.}
  FLAG_OUTGOING_CALL*: jint {.`static`.}
  FLAG_WITHHELD_BY_SERVER*: jint {.`static`.}
  FLAG_WITHHELD_BY_NETWORK*: jint {.`static`.}
  CREATOR*: Creator[BluetoothLeCall] {.`static`.}

