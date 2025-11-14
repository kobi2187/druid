import jnim

jclass android.util.SparseDoubleArray* of JVMObject:
  proc clone*(): SparseDoubleArray
  proc get*(key: jint): jdouble
  proc get*(key: jint, valueIfKeyNotFound: jdouble): jdouble
  proc put*(key: jint, value: jdouble)
  proc incrementValue*(key: jint, summand: jdouble)
  proc size*(): jint
  proc indexOfKey*(key: jint): jint
  proc keyAt*(index: jint): jint
  proc valueAt*(index: jint): jdouble
  proc setValueAt*(index: jint, value: jdouble)
  proc removeAt*(index: jint)
  proc delete*(key: jint)
  proc clear*()
  proc toString*(): string

