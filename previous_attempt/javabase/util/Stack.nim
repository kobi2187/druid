import jnim

jclass java.util.Stack* of Vector:
  proc push*(item: E): E
  proc pop*(): E
  proc peek*(): E
  proc empty*(): jboolean
  proc search*(o: JObject): jint

