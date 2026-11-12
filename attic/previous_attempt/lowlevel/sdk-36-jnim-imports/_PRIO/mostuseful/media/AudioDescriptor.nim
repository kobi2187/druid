import jnim

jclass android.media.AudioDescriptor* of JVMObject:
  proc getStandard*(): jint
  proc getDescriptor*(): seq[jbyte]
  proc getEncapsulationType*(): jint
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  STANDARD_NONE*: jint {.`static`.}
  STANDARD_EDID*: jint {.`static`.}
  STANDARD_SADB*: jint {.`static`.}
  STANDARD_VSADB*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AudioDescriptor] {.`static`.}

