import jnim

jclass android.os.BaseBundle* of JVMObject:
  proc setShouldDefuse*(shouldDefuse: jboolean) {.`static`.}
  proc hasIntent*(): jboolean
  proc setHasIntent*(hasIntent: jboolean)
  proc getPairValue*(): string
  proc getClassLoader*(): ClassLoader
  proc isValueParceled*(key: string): jboolean
  proc isParcelled*(): jboolean
  proc isEmptyParcel*(): jboolean
  proc size*(): jint
  proc isEmpty*(): jboolean
  proc isDefinitelyEmpty*(): jboolean
  proc kindofEquals*(a: BaseBundle, b: BaseBundle): jboolean {.`static`.}
  proc kindofEquals*(other: BaseBundle): jboolean
  proc clear*()
  proc containsKey*(key: string): jboolean
  proc get*(key: string): JObject
  proc remove*(key: string)
  proc putAll*(bundle: PersistableBundle)
  proc keySet*(): Set[string]
  proc putObject*(key: string, value: JObject)
  proc putBoolean*(key: string, value: jboolean)
  proc putInt*(key: string, value: jint)
  proc putLong*(key: string, value: jlong)
  proc putDouble*(key: string, value: jdouble)
  proc putString*(key: string, value: string)
  proc putBooleanArray*(key: string, value: seq[jboolean])
  proc putIntArray*(key: string, value: seq[jint])
  proc putLongArray*(key: string, value: seq[jlong])
  proc putDoubleArray*(key: string, value: seq[jdouble])
  proc putStringArray*(key: string, value: seq[string])
  proc getBoolean*(key: string): jboolean
  proc getBoolean*(key: string, defaultValue: jboolean): jboolean
  proc getInt*(key: string): jint
  proc getInt*(key: string, defaultValue: jint): jint
  proc getLong*(key: string): jlong
  proc getLong*(key: string, defaultValue: jlong): jlong
  proc getDouble*(key: string): jdouble
  proc getDouble*(key: string, defaultValue: jdouble): jdouble
  proc getString*(key: string): string
  proc getString*(key: string, defaultValue: string): string
  proc getBooleanArray*(key: string): seq[jboolean]
  proc getIntArray*(key: string): seq[jint]
  proc getLongArray*(key: string): seq[jlong]
  proc getDoubleArray*(key: string): seq[jdouble]
  proc getStringArray*(key: string): seq[string]
  proc dumpStats*(pw: IndentingPrintWriter, key: string, value: JObject) {.`static`.}
  proc dumpStats*(pw: IndentingPrintWriter, array: SparseArray) {.`static`.}
  proc dumpStats*(pw: IndentingPrintWriter, bundle: BaseBundle) {.`static`.}
  mFlags*: jint

