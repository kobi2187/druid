import jnim

jclass android.telephony.CellIdentity* of JVMObject:
  proc describeContents*(): jint
  proc getType*(): jint
  proc getMccString*(): string
  proc getMncString*(): string
  proc getChannelNumber*(): jint
  proc getOperatorAlphaLong*(): CharSequence
  proc setOperatorAlphaLong*(alphaLong: string)
  proc getOperatorAlphaShort*(): CharSequence
  proc setOperatorAlphaShort*(alphaShort: string)
  proc getGlobalCellId*(): string
  proc isSameCell*(ci: CellIdentity): jboolean
  proc getPlmn*(): string
  proc asCellLocation*(): CellLocation
  proc sanitizeLocationInfo*(): CellIdentity
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, type: jint)
  proc isValidPlmn*(plmn: string): jboolean {.`static`.}
  INVALID_CHANNEL_NUMBER*: jint {.`static`.}
  MCC_LENGTH*: jint {.`static`.}
  MNC_MIN_LENGTH*: jint {.`static`.}
  MNC_MAX_LENGTH*: jint {.`static`.}
  CREATOR*: Creator[CellIdentity] {.`static`.}

