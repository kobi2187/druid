import jnim

jclass android.util.ArrayMap* of JVMObject:
  proc clear*()
  proc erase*()
  proc ensureCapacity*(minimumCapacity: jint)
  proc containsKey*(key: JObject): jboolean
  proc indexOfKey*(key: JObject): jint
  proc indexOfValue*(value: JObject): jint
  proc containsValue*(value: JObject): jboolean
  proc get*(key: JObject): V
  proc keyAt*(index: jint): K
  proc valueAt*(index: jint): V
  proc setValueAt*(index: jint, value: V): V
  proc isEmpty*(): jboolean
  proc put*(key: K, value: V): V
  proc append*(key: K, value: V)
  proc validate*()
  proc putAll*(array: ArrayMap[? extends K, ? extends V])
  proc remove*(key: JObject): V
  proc removeAt*(index: jint): V
  proc size*(): jint
  proc equals*(object: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc containsAll*(collection: Collection[?]): jboolean
  proc forEach*(action: BiConsumer[? super K, ? super V])
  proc putAll*(map: Map[? extends K, ? extends V])
  proc removeAll*(collection: Collection[?]): jboolean
  proc replaceAll*(function: BiFunction[? super K, ? super V, ? extends V])
  proc retainAll*(collection: Collection[?]): jboolean
  proc entrySet*(): Set[Map.Entry<K, V>]
  proc keySet*(): Set[K]
  proc values*(): Collection[V]
  EMPTY*: ArrayMap {.`static`.}

