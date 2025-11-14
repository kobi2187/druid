import jnim

jclass android.net.NetworkState* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  EMPTY*: NetworkState {.`static`.}
  networkInfo*: NetworkInfo
  linkProperties*: LinkProperties
  networkCapabilities*: NetworkCapabilities
  network*: Network
  subscriberId*: string
  legacyNetworkType*: jint
  CREATOR*: Creator[NetworkState] {.`static`.}

