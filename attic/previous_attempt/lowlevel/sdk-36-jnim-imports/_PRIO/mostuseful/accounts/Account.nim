import jnim

jclass android.accounts.Account* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc getAccessId*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc toSafeString*(): string
  proc toSafeName*(name: string, replacement: jchar): string {.`static`.}
  name*: string
  typ*: string
  CREATOR*: Creator[Account] {.`static`.}

