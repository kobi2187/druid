import jnim

jclass java.util.AbstractList* of AbstractCollection:
  proc add*(e: E): jboolean
  proc get*(index: jint): E
  proc set*(index: jint, element: E): E
  proc add*(index: jint, element: E)
  proc remove*(index: jint): E
  proc indexOf*(o: JObject): jint
  proc lastIndexOf*(o: JObject): jint
  proc clear*()
  proc addAll*(index: jint, c: Collection[? extends E]): jboolean
  proc iterator*(): Iterator[E]
  proc listIterator*(): ListIterator[E]
  proc listIterator*(index: jint): ListIterator[E]
  proc subList*(fromIndex: jint, toIndex: jint): List[E]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

