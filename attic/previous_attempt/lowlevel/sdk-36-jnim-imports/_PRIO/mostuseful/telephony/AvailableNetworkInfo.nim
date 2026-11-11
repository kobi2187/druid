import jnim

jclass android.telephony.AvailableNetworkInfo* of JVMObject:
  proc getSubId*(): jint
  proc getPriority*(): jint
  proc getMccMncs*(): List[string]
  proc getBands*(): List[Integer]
  proc getRadioAccessSpecifiers*(): List[RadioAccessSpecifier]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  PRIORITY_HIGH*: jint {.`static`.}
  PRIORITY_MED*: jint {.`static`.}
  PRIORITY_LOW*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AvailableNetworkInfo] {.`static`.}

jclass android.telephony.AvailableNetworkInfo.Builder* of JVMObject:
  proc setPriority*(priority: jint): Builder
  proc setMccMncs*(mccMncs: List[string]): Builder
  proc setRadioAccessSpecifiers*(radioAccessSpecifiers: List[RadioAccessSpecifier]): Builder
  proc build*(): AvailableNetworkInfo

jclass android.telephony.Builder* of JVMObject:
  proc setPriority*(priority: jint): Builder
  proc setMccMncs*(mccMncs: List[string]): Builder
  proc setRadioAccessSpecifiers*(radioAccessSpecifiers: List[RadioAccessSpecifier]): Builder
  proc build*(): AvailableNetworkInfo

