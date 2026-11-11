import jnim

jclass android.security.AppUriAuthenticationPolicy* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc getAppAndUriMappings*(): Map[string, Map<Uri, String>]
  proc readFromXml*(parser: XmlPullParser): AppUriAuthenticationPolicy {.`static`.}
  proc writeToXml*(output:XmlSerializer)
  proc getAliases*(): Set[string]
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Parcelable.Creator[AppUriAuthenticationPolicy] {.`static`.}

jclass android.security.AppUriAuthenticationPolicy.Builder* of JVMObject:
  proc addAppAndUriMapping*(appPackageName: string, uri: Uri, alias: string): Builder
  proc addAppAndUriMapping*(appPackageName: string, urisToAliases: UrisToAliases): Builder
  proc build*(): AppUriAuthenticationPolicy

jclass android.security.Builder* of JVMObject:
  proc addAppAndUriMapping*(appPackageName: string, uri: Uri, alias: string): Builder
  proc addAppAndUriMapping*(appPackageName: string, urisToAliases: UrisToAliases): Builder
  proc build*(): AppUriAuthenticationPolicy

