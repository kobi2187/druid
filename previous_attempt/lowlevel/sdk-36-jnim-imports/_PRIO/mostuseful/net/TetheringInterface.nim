import jnim

jclass android.net.TetheringInterface* of JVMObject:
  proc getType*(): jint
  proc getInterface*(): string
  proc getSoftApConfiguration*(): SoftApConfiguration
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Creator[TetheringInterface] {.`static`.}

