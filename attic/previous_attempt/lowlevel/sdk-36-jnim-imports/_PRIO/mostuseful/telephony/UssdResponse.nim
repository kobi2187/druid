import jnim

jclass android.telephony.UssdResponse* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getUssdRequest*(): string
  proc getReturnMessage*(): CharSequence
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[UssdResponse] {.`static`.}

