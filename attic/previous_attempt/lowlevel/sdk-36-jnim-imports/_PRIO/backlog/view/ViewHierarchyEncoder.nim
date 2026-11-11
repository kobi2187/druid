import jnim

jclass android.view.ViewHierarchyEncoder* of JVMObject:
  proc setUserPropertiesEnabled*(enabled: jboolean)
  proc beginObject*(o: JObject)
  proc endObject*()
  proc endStream*()
  proc addProperty*(name: string, v: jboolean)
  proc addProperty*(name: string, s: jshort)
  proc addProperty*(name: string, v: jint)
  proc addProperty*(name: string, v: jfloat)
  proc addProperty*(name: string, s: string)
  proc addUserProperty*(name: string, s: string)
  proc addPropertyKey*(name: string)

