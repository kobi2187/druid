import jnim

jclass java.util.LinkedList* of AbstractSequentialList:
  proc getFirst*(): E
  proc getLast*(): E
  proc removeFirst*(): E
  proc removeLast*(): E
  proc addFirst*(e: E)
  proc addLast*(e: E)
  proc contains*(o: JObject): jboolean
  proc size*(): jint
  proc add*(e: E): jboolean
  proc remove*(o: JObject): jboolean
  proc addAll*(c: Collection[? extends E]): jboolean
  proc addAll*(index: jint, c: Collection[? extends E]): jboolean
  proc clear*()
  proc get*(index: jint): E
  proc set*(index: jint, element: E): E
  proc add*(index: jint, element: E)
  proc remove*(index: jint): E
  proc indexOf*(o: JObject): jint
  proc lastIndexOf*(o: JObject): jint
  proc peek*(): E
  proc element*(): E
  proc poll*(): E
  proc remove*(): E
  proc offer*(e: E): jboolean
  proc offerFirst*(e: E): jboolean
  proc offerLast*(e: E): jboolean
  proc peekFirst*(): E
  proc peekLast*(): E
  proc pollFirst*(): E
  proc pollLast*(): E
  proc push*(e: E)
  proc pop*(): E
  proc removeFirstOccurrence*(o: JObject): jboolean
  proc removeLastOccurrence*(o: JObject): jboolean
  proc listIterator*(index: jint): ListIterator[E]
  proc descendingIterator*(): Iterator[E]
  proc clone*(): JObject
  proc toArray*(): seq[JObject]
  proc toArray*(a: seq[T]): seq[T]
  proc spliterator*(): Spliterator[E]
  proc reversed*(): LinkedList[E]

