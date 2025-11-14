import jnim

jclass android.nearby.BroadcastRequest* of JVMObject:
  proc createFromParcel*(in: Parcel): BroadcastRequest {.`static`.}
  proc getType*(): jint
  proc getVersion*(): jint
  proc getTxPower*(): jint
  proc getMediums*(): List[Integer]
  proc writeToParcel*(dest: Parcel, flags: jint)
  BROADCAST_TYPE_UNKNOWN*: jint {.`static`.}
  BROADCAST_TYPE_NEARBY_PRESENCE*: jint {.`static`.}
  UNKNOWN_TX_POWER*: jint {.`static`.}
  PRESENCE_VERSION_UNKNOWN*: jint {.`static`.}
  PRESENCE_VERSION_V0*: jint {.`static`.}
  PRESENCE_VERSION_V1*: jint {.`static`.}
  MEDIUM_BLE*: jint {.`static`.}

