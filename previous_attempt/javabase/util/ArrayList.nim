import jnim

jclass java.util.ArrayList* of AbstractList:
  proc trimToSize*()
  proc ensureCapacity*(minCapacity: jint)
  proc size*(): jint
  proc isEmpty*(): jboolean
  proc contains*(o: JObject): jboolean
  proc indexOf*(o: JObject): jint
  proc lastIndexOf*(o: JObject): jint
  proc clone*(): JObject
  proc toArray*(): seq[JObject]
  proc toArray*(a: seq[T]): seq[T]
  proc get*(index: jint): E
  proc getFirst*(): E
  proc getLast*(): E
  proc set*(index: jint, element: E): E
  proc add*(e: E): jboolean
  proc add*(index: jint, element: E)
  proc addFirst*(element: E)
  proc addLast*(element: E)
  proc remove*(index: jint): E
  proc removeFirst*(): E
  proc removeLast*(): E
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc remove*(o: JObject): jboolean
  proc clear*()
  proc addAll*(c: Collection[? extends E]): jboolean
  proc addAll*(index: jint, c: Collection[? extends E]): jboolean
  proc removeAll*(c: Collection[?]): jboolean
  proc retainAll*(c: Collection[?]): jboolean
  proc listIterator*(index: jint): ListIterator[E]
  proc listIterator*(): ListIterator[E]
  proc iterator*(): Iterator[E]
  proc subList*(fromIndex: jint, toIndex: jint): List[E]
  proc forEach*(action: Consumer[? super E])
  proc spliterator*(): Spliterator[E]
  proc removeIf*(filter: Predicate[? super E]): jboolean
  proc replaceAll*(operator: UnaryOperator[E])
  proc sort*(c: Comparator[? super E])

