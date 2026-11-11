import jnim

jclass android.telecom.CallEndpoint* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc getEndpointName*(): CharSequence
  proc getEndpointType*(): jint
  proc getIdentifier*(): ParcelUuid
  proc endpointTypeToString*(endpointType: jint): string {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(destination: Parcel, flags: jint)
  ENDPOINT_OPERATION_SUCCESS*: jint {.`static`.}
  ENDPOINT_OPERATION_FAILED*: jint {.`static`.}
  TYPE_UNKNOWN*: jint {.`static`.}
  TYPE_EARPIECE*: jint {.`static`.}
  TYPE_BLUETOOTH*: jint {.`static`.}
  TYPE_WIRED_HEADSET*: jint {.`static`.}
  TYPE_SPEAKER*: jint {.`static`.}
  TYPE_STREAMING*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CallEndpoint] {.`static`.}

