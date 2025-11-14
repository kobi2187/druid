import jnim

jclass android.nearby.CredentialElement* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getKey*(): string
  proc getValue*(): seq[jbyte]
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Parcelable.Creator[CredentialElement] {.`static`.}

