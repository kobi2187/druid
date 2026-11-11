import jnim

jclass java.util.AbstractSequentialList* of AbstractList:
  proc get*(index: jint): E
  proc set*(index: jint, element: E): E
  proc add*(index: jint, element: E)
  proc remove*(index: jint): E
  proc addAll*(index: jint, c: Collection[? extends E]): jboolean
  proc iterator*(): Iterator[E]
  proc listIterator*(index: jint): ListIterator[E]

