import jnim

jclass android.net.TelephonyNetworkSpecifier* of NetworkSpecifier:
  proc getSubscriptionId*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc canBeSatisfiedBy*(other: NetworkSpecifier): jboolean
  CREATOR*: Creator[TelephonyNetworkSpecifier] {.`static`.}

jclass android.net.TelephonyNetworkSpecifier.Builder* of JVMObject:
  proc setSubscriptionId*(subId: jint): Builder
  proc build*(): TelephonyNetworkSpecifier

jclass android.net.Builder* of JVMObject:
  proc setSubscriptionId*(subId: jint): Builder
  proc build*(): TelephonyNetworkSpecifier

