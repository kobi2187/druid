import jnim

jclass android.content.UriRelativeFilterGroup* of JVMObject:
  proc matchGroupsToUri*(groups: List[UriRelativeFilterGroup], uri: Uri): jboolean {.`static`.}
  proc parcelsToGroups*(parcels: List[UriRelativeFilterGroupParcel]): List[UriRelativeFilterGroup] {.`static`.}
  proc groupsToParcels*(groups: List[UriRelativeFilterGroup]): List[UriRelativeFilterGroupParcel] {.`static`.}
  proc getAction*(): jint
  proc addUriRelativeFilter*(uriRelativeFilter: UriRelativeFilter)
  proc getUriRelativeFilters*(): Collection[UriRelativeFilter]
  proc matchData*(data: Uri): jboolean
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc writeToXml*(serializer: XmlSerializer)
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toParcel*(): UriRelativeFilterGroupParcel
  ACTION_ALLOW*: jint {.`static`.}
  ACTION_BLOCK*: jint {.`static`.}

