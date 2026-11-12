import jnim

jclass android.util.SparseArray* of JVMObject:
  proc clone*(): SparseArray[E]
  proc contains*(key: jint): jboolean
  proc get*(key: jint): E
  proc get*(key: jint, valueIfKeyNotFound: E): E
  proc delete*(key: jint)
  proc removeReturnOld*(key: jint): E
  proc remove*(key: jint)
  proc removeAt*(index: jint)
  proc removeAtRange*(index: jint, size: jint)
  proc set*(key: jint, value: E)
  proc put*(key: jint, value: E)
  proc size*(): jint
  proc keyAt*(index: jint): jint
  proc valueAt*(index: jint): E
  proc setValueAt*(index: jint, value: E)
  proc indexOfKey*(key: jint): jint
  proc indexOfValue*(value: E): jint
  proc indexOfValueByValue*(value: E): jint
  proc clear*()
  proc append*(key: jint, value: E)
  proc toString*(): string
  proc contentEquals*(other: SparseArray[?]): jboolean
  proc contentHashCode*(): jint

