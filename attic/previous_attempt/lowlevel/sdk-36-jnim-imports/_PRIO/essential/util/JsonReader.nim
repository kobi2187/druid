import jnim

jclass android.util.JsonReader* of JVMObject:
  proc setLenient*(lenient: jboolean)
  proc isLenient*(): jboolean
  proc beginArray*()
  proc endArray*()
  proc beginObject*()
  proc endObject*()
  proc hasNext*(): jboolean
  proc peek*(): JsonToken
  proc nextName*(): string
  proc nextString*(): string
  proc nextBoolean*(): jboolean
  proc nextNull*()
  proc nextDouble*(): jdouble
  proc nextLong*(): jlong
  proc nextInt*(): jint
  proc close*()
  proc skipValue*()
  proc toString*(): string

