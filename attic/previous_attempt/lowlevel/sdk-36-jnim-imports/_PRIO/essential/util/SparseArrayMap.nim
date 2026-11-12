import jnim

jclass android.util.SparseArrayMap* of JVMObject:
  proc add*(key: jint, mapKey: K, obj: V): V
  proc clear*()
  proc contains*(key: jint, mapKey: K): jboolean
  proc delete*(key: jint)
  proc deleteAt*(keyIndex: jint)
  proc delete*(key: jint, mapKey: K): V
  proc deleteAt*(keyIndex: jint, mapIndex: jint)
  proc get*(key: jint, mapKey: K): V
  proc getOrDefault*(key: jint, mapKey: K, defaultValue: V): V
  proc indexOfKey*(key: jint): jint
  proc indexOfKey*(key: jint, mapKey: K): jint
  proc keyAt*(index: jint): jint
  proc keyAt*(keyIndex: jint, mapIndex: jint): K
  proc numMaps*(): jint
  proc numElementsForKey*(key: jint): jint
  proc numElementsForKeyAt*(keyIndex: jint): jint
  proc valueAt*(keyIndex: jint, mapIndex: jint): V
  proc forEach*(consumer: Consumer[V])
  proc forEach*(consumer: TriConsumer[K, V])

