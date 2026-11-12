import jnim

jclass android.nearby.OffloadCapability* of JVMObject:
  proc isFastPairSupported*(): jboolean
  proc isNearbyShareSupported*(): jboolean
  proc getVersion*(): jlong
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[OffloadCapability] {.`static`.}

jclass android.nearby.OffloadCapability.Builder* of JVMObject:
  proc setFastPairSupported*(fastPairSupported: jboolean): Builder
  proc setNearbyShareSupported*(nearbyShareSupported: jboolean): Builder
  proc setVersion*(version: jlong): Builder
  proc build*(): OffloadCapability

jclass android.nearby.Builder* of JVMObject:
  proc setFastPairSupported*(fastPairSupported: jboolean): Builder
  proc setNearbyShareSupported*(nearbyShareSupported: jboolean): Builder
  proc setVersion*(version: jlong): Builder
  proc build*(): OffloadCapability

