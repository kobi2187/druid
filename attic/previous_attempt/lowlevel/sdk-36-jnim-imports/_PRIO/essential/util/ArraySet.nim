import jnim

jclass android.util.ArraySet* of JVMObject:
  proc clear*()
  proc ensureCapacity*(minimumCapacity: jint)
  proc contains*(key: JObject): jboolean
  proc indexOf*(key: JObject): jint
  proc valueAt*(index: jint): E
  proc valueAtUnchecked*(index: jint): E
  proc isEmpty*(): jboolean
  proc add*(value: E): jboolean
  proc append*(value: E)
  proc addAll*(array: ArraySet[? extends E])
  proc remove*(object: JObject): jboolean
  proc removeAt*(index: jint): E
  proc removeAll*(array: ArraySet[? extends E]): jboolean
  proc removeIf*(filter: Predicate[? super E]): jboolean
  proc size*(): jint
  proc forEach*(action: Consumer[? super E])
  proc toArray*(): seq[JObject]
  proc toArray*(array: seq[T]): seq[T]
  proc equals*(object: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc iterator*(): Iterator[E]
  proc containsAll*(collection: Collection[?]): jboolean
  proc addAll*(collection: Collection[? extends E]): jboolean
  proc removeAll*(collection: Collection[?]): jboolean
  proc retainAll*(collection: Collection[?]): jboolean

