import jnim

jclass android.nfc.NdefRecord* of JVMObject:
  proc createApplicationRecord*(packageName: string): NdefRecord {.`static`.}
  proc createUri*(uri: Uri): NdefRecord {.`static`.}
  proc createUri*(uriString: string): NdefRecord {.`static`.}
  proc createMime*(mimeType: string, mimeData: seq[jbyte]): NdefRecord {.`static`.}
  proc createExternal*(domain: string, type: string, data: seq[jbyte]): NdefRecord {.`static`.}
  proc createTextRecord*(languageCode: string, text: string): NdefRecord {.`static`.}
  proc getTnf*(): jshort
  proc getType*(): seq[jbyte]
  proc getId*(): seq[jbyte]
  proc getPayload*(): seq[jbyte]
  proc toByteArray*(): seq[jbyte]
  proc toMimeType*(): string
  proc toUri*(): Uri
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream)
  TNF_EMPTY*: jshort {.`static`.}
  TNF_WELL_KNOWN*: jshort {.`static`.}
  TNF_MIME_MEDIA*: jshort {.`static`.}
  TNF_ABSOLUTE_URI*: jshort {.`static`.}
  TNF_EXTERNAL_TYPE*: jshort {.`static`.}
  TNF_UNKNOWN*: jshort {.`static`.}
  TNF_UNCHANGED*: jshort {.`static`.}
  TNF_RESERVED*: jshort {.`static`.}
  RTD_TEXT*: jbyte {.`static`.}
  RTD_URI*: jbyte {.`static`.}
  RTD_SMART_POSTER*: jbyte {.`static`.}
  RTD_ALTERNATIVE_CARRIER*: jbyte {.`static`.}
  RTD_HANDOVER_CARRIER*: jbyte {.`static`.}
  RTD_HANDOVER_REQUEST*: jbyte {.`static`.}
  RTD_HANDOVER_SELECT*: jbyte {.`static`.}
  RTD_ANDROID_APP*: jbyte {.`static`.}
  CREATOR*: Parcelable.Creator[NdefRecord] {.`static`.}

