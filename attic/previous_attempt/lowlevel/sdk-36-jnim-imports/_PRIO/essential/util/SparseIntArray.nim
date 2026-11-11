import jnim

jclass android.util.SparseIntArray* of JVMObject:
  proc clone*(): SparseIntArray
  proc get*(key: jint): jint
  proc get*(key: jint, valueIfKeyNotFound: jint): jint
  proc delete*(key: jint)
  proc removeAt*(index: jint)
  proc put*(key: jint, value: jint)
  proc size*(): jint
  proc keyAt*(index: jint): jint
  proc valueAt*(index: jint): jint
  proc setValueAt*(index: jint, value: jint)
  proc indexOfKey*(key: jint): jint
  proc indexOfValue*(value: jint): jint
  proc clear*()
  proc append*(key: jint, value: jint)
  proc copyKeys*(): seq[jint]
  proc toString*(): string

