import jnim

jclass java.util.ArrayDeque* of AbstractCollection:
  proc addFirst*(e: E)
  proc addLast*(e: E)
  proc addAll*(c: Collection[? extends E]): jboolean
  proc offerFirst*(e: E): jboolean
  proc offerLast*(e: E): jboolean
  proc removeFirst*(): E
  proc removeLast*(): E
  proc pollFirst*(): E
  proc pollLast*(): E
  proc getFirst*(): E
  proc getLast*(): E
  proc peekFirst*(): E
  proc peekLast*(): E
  proc removeFirstOccurrence*(o: JObject): jboolean
  proc removeLastOccurrence*(o: JObject): jboolean
  proc add*(e: E): jboolean
  proc offer*(e: E): jboolean
  proc remove*(): E
  proc poll*(): E
  proc element*(): E
  proc peek*(): E
  proc push*(e: E)
  proc pop*(): E
  proc size*(): jint
  proc isEmpty*(): jboolean
  proc iterator*(): Iterator[E]
  proc descendingIterator*(): Iterator[E]
  proc spliterator*(): Spliterator[E]
  proc forEach*(action: Consumer[? super E])
  proc removeIf*(filter: Predicate[? super E]): jboolean
  proc removeAll*(c: Collection[?]): jboolean
  proc retainAll*(c: Collection[?]): jboolean
  proc contains*(o: JObject): jboolean
  proc remove*(o: JObject): jboolean
  proc clear*()
  proc toArray*(): seq[JObject]
  proc toArray*(a: seq[T]): seq[T]
  proc clone*(): ArrayDeque[E]

