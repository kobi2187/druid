import jnim

jclass android.content.UriRelativeFilter* of JVMObject:
  proc getUriPart*(): jint
  proc getPatternType*(): jint
  proc getFilter*(): string
  proc matchData*(data: Uri): jboolean
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc writeToXml*(serializer: XmlSerializer)
  proc toString*(): string
  proc toParcel*(): UriRelativeFilterParcel
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  PATH*: jint {.`static`.}
  QUERY*: jint {.`static`.}
  FRAGMENT*: jint {.`static`.}

