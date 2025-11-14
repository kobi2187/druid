import jnim

jclass android.util.JsonWriter* of JVMObject:
  proc setIndent*(indent: string)
  proc setLenient*(lenient: jboolean)
  proc isLenient*(): jboolean
  proc beginArray*(): JsonWriter
  proc endArray*(): JsonWriter
  proc beginObject*(): JsonWriter
  proc endObject*(): JsonWriter
  proc name*(name: string): JsonWriter
  proc value*(value: string): JsonWriter
  proc nullValue*(): JsonWriter
  proc value*(value: jboolean): JsonWriter
  proc value*(value: jdouble): JsonWriter
  proc value*(value: jlong): JsonWriter
  proc value*(value: Number): JsonWriter
  proc flush*()
  proc close*()

