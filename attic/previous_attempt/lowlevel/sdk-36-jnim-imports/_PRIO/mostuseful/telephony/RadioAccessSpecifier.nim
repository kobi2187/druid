import jnim

jclass android.telephony.RadioAccessSpecifier* of JVMObject:
  proc getRadioAccessNetwork*(): jint
  proc getBands*(): seq[jint]
  proc getChannels*(): seq[jint]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Parcelable.Creator[RadioAccessSpecifier] {.`static`.}

