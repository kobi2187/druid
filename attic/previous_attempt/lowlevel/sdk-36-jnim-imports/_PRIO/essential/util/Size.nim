import jnim

jclass android.util.Size* of JVMObject:
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc parseSize*(string: string): Size {.`static`.}
  proc hashCode*(): jint

