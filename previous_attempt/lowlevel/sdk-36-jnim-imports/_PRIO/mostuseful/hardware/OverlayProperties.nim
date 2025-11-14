import jnim

jclass android.hardware.OverlayProperties* of JVMObject:
  proc getDefault*(): OverlayProperties {.`static`.}
  proc getLutProperties*(): seq[LutProperties]
  proc isCombinationSupported*(dataspace: jint, format: jint): jboolean
  proc isMixedColorSpacesSupported*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[OverlayProperties] {.`static`.}

