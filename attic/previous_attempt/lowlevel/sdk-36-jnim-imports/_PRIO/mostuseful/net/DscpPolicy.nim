import jnim

jclass android.net.DscpPolicy* of JVMObject:
  proc describeContents*(): jint
  proc getPolicyId*(): jint
  proc getDscpValue*(): jint
  proc getSourceAddress*(): InetAddress
  proc getDestinationAddress*(): InetAddress
  proc getSourcePort*(): jint
  proc getProtocol*(): jint
  proc getDestinationPortRange*(): Range[Integer]
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  PROTOCOL_ANY*: jint {.`static`.}
  SOURCE_PORT_ANY*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[DscpPolicy] {.`static`.}

jclass android.net.DscpPolicy.Builder* of JVMObject:
  proc setSourceAddress*(value: InetAddress): Builder
  proc setDestinationAddress*(value: InetAddress): Builder
  proc setSourcePort*(value: jint): Builder
  proc setProtocol*(value: jint): Builder
  proc setDestinationPortRange*(range: Range[Integer]): Builder
  proc build*(): DscpPolicy

jclass android.net.Builder* of JVMObject:
  proc setSourceAddress*(value: InetAddress): Builder
  proc setDestinationAddress*(value: InetAddress): Builder
  proc setSourcePort*(value: jint): Builder
  proc setProtocol*(value: jint): Builder
  proc setDestinationPortRange*(range: Range[Integer]): Builder
  proc build*(): DscpPolicy

