import jnim

jclass android.net.TcpKeepalivePacketData* of KeepalivePacketData:
  proc getTcpSeq*(): jint
  proc getTcpAck*(): jint
  proc getTcpWindow*(): jint
  proc getTcpWindowScale*(): jint
  proc getIpTos*(): jint
  proc getIpTtl*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc toString*(): string
  tcpSeq*: jint
  tcpAck*: jint
  tcpWindow*: jint
  tcpWindowScale*: jint
  ipTos*: jint
  ipTtl*: jint
  CREATOR*: Parcelable.Creator[TcpKeepalivePacketData] {.`static`.}

