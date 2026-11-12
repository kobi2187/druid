import jnim

jclass android.net.RssiCurve* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc lookupScore*(rssi: jint): jbyte
  proc lookupScore*(rssi: jint, isActiveNetwork: jboolean): jbyte
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  start*: jint
  bucketWidth*: jint
  rssiBuckets*: jbyte
  activeNetworkRssiBoost*: jint
  CREATOR*: Creator[RssiCurve] {.`static`.}

