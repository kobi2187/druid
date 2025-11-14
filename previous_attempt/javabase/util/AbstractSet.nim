import jnim

jclass java.util.AbstractSet* of AbstractCollection:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc removeAll*(c: Collection[?]): jboolean

