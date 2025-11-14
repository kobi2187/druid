import jnim

jclass android.view.DisplayAddress* of JVMObject:
  proc fromPhysicalDisplayId*(physicalDisplayId: jlong): Physical {.`static`.}
  proc fromPortAndModel*(port: jint, model: Long): Physical {.`static`.}
  proc fromMacAddress*(macAddress: string): Network {.`static`.}
  proc describeContents*(): jint

jclass android.view.DisplayAddress.Physical* of JVMObject:
  proc getPhysicalDisplayId*(): jlong
  proc getPort*(): jint
  proc getModel*(): Long
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc hashCode*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc isPortMatch*(a1: DisplayAddress, a2: DisplayAddress): jboolean {.`static`.}

jclass android.view.DisplayAddress.Network* of JVMObject:
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc hashCode*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)

jclass android.view.Physical* of DisplayAddress:
  proc getPhysicalDisplayId*(): jlong
  proc getPort*(): jint
  proc getModel*(): Long
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc hashCode*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc isPortMatch*(a1: DisplayAddress, a2: DisplayAddress): jboolean {.`static`.}
  CREATOR*: Parcelable.Creator[Physical] {.`static`.}

jclass android.view.Network* of DisplayAddress:
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  proc hashCode*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[Network] {.`static`.}

