import jnim

jclass android.security.UrisToAliases* of JVMObject:
  proc getUrisToAliases*(): Map[Uri, string]
  proc addUriToAlias*(uri: Uri, alias: string)
  proc readFromXml*(parser: XmlPullParser): UrisToAliases {.`static`.}
  proc writeToXml*(output:XmlSerializer)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Creator[UrisToAliases] {.`static`.}

