import jnim

jclass android.util.SparseBooleanArray* of JVMObject:
  proc clone*(): SparseBooleanArray
  proc get*(key: jint): jboolean
  proc get*(key: jint, valueIfKeyNotFound: jboolean): jboolean
  proc delete*(key: jint)
  proc removeAt*(index: jint)
  proc put*(key: jint, value: jboolean)
  proc size*(): jint
  proc keyAt*(index: jint): jint
  proc valueAt*(index: jint): jboolean
  proc setValueAt*(index: jint, value: jboolean)
  proc setKeyAt*(index: jint, key: jint)
  proc indexOfKey*(key: jint): jint
  proc indexOfValue*(value: jboolean): jint
  proc clear*()
  proc append*(key: jint, value: jboolean)
  proc hashCode*(): jint
  proc equals*(that: JObject): jboolean
  proc toString*(): string

