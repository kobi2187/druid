import jnim

jclass android.telecom.PhoneAccountHandle* of JVMObject:
  proc getComponentName*(): ComponentName
  proc getId*(): string
  proc getUserHandle*(): UserHandle
  proc hashCode*(): jint
  proc toString*(): string
  proc equals*(other: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc areFromSamePackage*(a: PhoneAccountHandle, b: PhoneAccountHandle): jboolean {.`static`.}
  CREATOR*: Creator[PhoneAccountHandle] {.`static`.}

