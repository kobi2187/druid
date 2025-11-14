import jnim

jclass android.nfc.PackageAndUser* of JVMObject:
  proc describeContents*(): jint
  proc getUserId*(): jint
  proc getPackage*(): string
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint

