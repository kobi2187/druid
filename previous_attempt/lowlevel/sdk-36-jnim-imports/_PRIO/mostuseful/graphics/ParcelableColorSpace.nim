import jnim

jclass android.graphics.ParcelableColorSpace* of JVMObject:
  proc isParcelable*(colorSpace: ColorSpace): jboolean {.`static`.}
  proc getColorSpace*(): ColorSpace
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Parcelable.Creator[ParcelableColorSpace] {.`static`.}

