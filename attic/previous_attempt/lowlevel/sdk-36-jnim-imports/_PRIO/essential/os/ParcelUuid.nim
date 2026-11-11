import jnim

jclass android.os.ParcelUuid* of JVMObject:
  proc fromString*(uuid: string): ParcelUuid {.`static`.}
  proc getUuid*(): UUID
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(object: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[ParcelUuid] {.`static`.}

