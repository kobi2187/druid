import jnim

jclass android.content.PeriodicSync* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc syncExtrasEquals*(b1: Bundle, b2: Bundle): jboolean {.`static`.}
  proc toString*(): string
  account*: Account
  authority*: string
  extras*: Bundle
  period*: jlong
  flexTime*: jlong
  CREATOR*: Creator[PeriodicSync] {.`static`.}

