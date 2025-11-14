import jnim

jclass java.util.Vector* of AbstractList:
  proc copyInto*(anArray: seq[JObject])
  proc trimToSize*()
  proc ensureCapacity*(minCapacity: jint)
  proc setSize*(newSize: jint)
  proc capacity*(): jint
  proc size*(): jint
  proc isEmpty*(): jboolean
  proc elements*(): Enumeration[E]
  proc contains*(o: JObject): jboolean
  proc indexOf*(o: JObject): jint
  proc indexOf*(o: JObject, index: jint): jint
  proc lastIndexOf*(o: JObject): jint
  proc lastIndexOf*(o: JObject, index: jint): jint
  proc elementAt*(index: jint): E
  proc firstElement*(): E
  proc lastElement*(): E
  proc setElementAt*(obj: E, index: jint)
  proc removeElementAt*(index: jint)
  proc insertElementAt*(obj: E, index: jint)
  proc addElement*(obj: E)
  proc removeElement*(obj: JObject): jboolean
  proc removeAllElements*()
  proc clone*(): JObject
  proc toArray*(): seq[JObject]
  proc toArray*(a: seq[T]): seq[T]
  proc get*(index: jint): E
  proc set*(index: jint, element: E): E
  proc add*(e: E): jboolean
  proc remove*(o: JObject): jboolean
  proc add*(index: jint, element: E)
  proc remove*(index: jint): E
  proc clear*()
  proc containsAll*(c: Collection[?]): jboolean
  proc addAll*(c: Collection[? extends E]): jboolean
  proc removeAll*(c: Collection[?]): jboolean
  proc retainAll*(c: Collection[?]): jboolean
  proc removeIf*(filter: Predicate[? super E]): jboolean
  proc addAll*(index: jint, c: Collection[? extends E]): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc subList*(fromIndex: jint, toIndex: jint): List[E]
  proc listIterator*(index: jint): ListIterator[E]
  proc listIterator*(): ListIterator[E]
  proc iterator*(): Iterator[E]
  proc forEach*(action: Consumer[? super E])
  proc replaceAll*(operator: UnaryOperator[E])
  proc sort*(c: Comparator[? super E])
  proc spliterator*(): Spliterator[E]

