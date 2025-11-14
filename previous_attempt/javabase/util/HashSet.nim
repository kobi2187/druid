import jnim

jclass java.util.HashSet* of AbstractSet:
  proc iterator*(): Iterator[E]
  proc size*(): jint
  proc isEmpty*(): jboolean
  proc contains*(o: JObject): jboolean
  proc add*(e: E): jboolean
  proc remove*(o: JObject): jboolean
  proc clear*()
  proc clone*(): JObject
  proc spliterator*(): Spliterator[E]
  proc toArray*(): seq[JObject]
  proc toArray*(a: seq[T]): seq[T]
  proc newHashSet*(numElements: jint): HashSet[T] {.`static`.}

