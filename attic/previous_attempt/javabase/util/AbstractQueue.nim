import jnim

jclass java.util.AbstractQueue* of AbstractCollection:
  proc add*(e: E): jboolean
  proc remove*(): E
  proc element*(): E
  proc clear*()
  proc addAll*(c: Collection[? extends E]): jboolean

