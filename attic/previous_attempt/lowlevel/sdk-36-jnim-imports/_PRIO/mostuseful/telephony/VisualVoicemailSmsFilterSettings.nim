import jnim

jclass android.telephony.VisualVoicemailSmsFilterSettings* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  DESTINATION_PORT_ANY*: jint {.`static`.}
  DESTINATION_PORT_DATA_SMS*: jint {.`static`.}
  DEFAULT_CLIENT_PREFIX*: string {.`static`.}
  DEFAULT_ORIGINATING_NUMBERS*: List[string] {.`static`.}
  DEFAULT_DESTINATION_PORT*: jint {.`static`.}
  MAX_STRING_LENGTH*: jint {.`static`.}
  MAX_LIST_SIZE*: jint {.`static`.}
  clientPrefix*: string
  originatingNumbers*: List[string]
  destinationPort*: jint
  packageName*: string
  CREATOR*: Creator[VisualVoicemailSmsFilterSettings] {.`static`.}

jclass android.telephony.VisualVoicemailSmsFilterSettings.Builder* of JVMObject:
  proc build*(): VisualVoicemailSmsFilterSettings
  proc setClientPrefix*(clientPrefix: string): Builder
  proc setOriginatingNumbers*(originatingNumbers: List[string]): Builder
  proc setDestinationPort*(destinationPort: jint): Builder
  proc setPackageName*(packageName: string): Builder

jclass android.telephony.Builder* of JVMObject:
  proc build*(): VisualVoicemailSmsFilterSettings
  proc setClientPrefix*(clientPrefix: string): Builder
  proc setOriginatingNumbers*(originatingNumbers: List[string]): Builder
  proc setDestinationPort*(destinationPort: jint): Builder
  proc setPackageName*(packageName: string): Builder

