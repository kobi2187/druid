import jnim

jclass android.timezone.TelephonyNetwork* of JVMObject:
  proc getMcc*(): string
  proc getMnc*(): string
  proc getCountryIsoCode*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

