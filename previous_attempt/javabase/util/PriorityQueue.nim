import jnim

jclass java.util.PriorityQueue* of AbstractQueue:
  proc add*(e: E): jboolean
  proc offer*(e: E): jboolean
  proc peek*(): E
  proc remove*(o: JObject): jboolean
  proc contains*(o: JObject): jboolean
  proc toArray*(): seq[JObject]
  proc toArray*(a: seq[T]): seq[T]
  proc iterator*(): Iterator[E]
  proc size*(): jint
  proc clear*()
  proc poll*(): E
  proc comparator*(): Comparator[? super E]
  proc spliterator*(): Spliterator[E]
  proc removeIf*(filter: Predicate[? super E]): jboolean
  proc removeAll*(c: Collection[?]): jboolean
  proc retainAll*(c: Collection[?]): jboolean
  proc forEach*(action: Consumer[? super E])

