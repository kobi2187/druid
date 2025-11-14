import jnim

jclass java.util.AbstractCollection* of JVMObject:
  proc iterator*(): Iterator[E]
  proc size*(): jint
  proc isEmpty*(): jboolean
  proc contains*(o: JObject): jboolean
  proc toArray*(): seq[JObject]
  proc toArray*(a: seq[T]): seq[T]
  proc add*(e: E): jboolean
  proc remove*(o: JObject): jboolean
  proc containsAll*(c: Collection[?]): jboolean
  proc addAll*(c: Collection[? extends E]): jboolean
  proc removeAll*(c: Collection[?]): jboolean
  proc retainAll*(c: Collection[?]): jboolean
  proc clear*()
  proc toString*(): string

