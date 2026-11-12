import jnim

jclass android.net.NattKeepalivePacketData* of KeepalivePacketData:
  proc nattKeepalivePacket*(srcAddress: InetAddress, srcPort: jint, dstAddress: InetAddress, dstPort: jint): NattKeepalivePacketData {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Parcelable.Creator[NattKeepalivePacketData] {.`static`.}

