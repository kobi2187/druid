import jnim

jclass android.telephony.CarrierInfo* of JVMObject:
  proc getMcc*(): string
  proc getMnc*(): string
  proc getSpn*(): string
  proc getGid1*(): string
  proc getGid2*(): string
  proc getImsiPrefix*(): string
  proc getIccid*(): string
  proc getImpi*(): string
  proc getEhplmn*(): List[string]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[CarrierInfo] {.`static`.}

