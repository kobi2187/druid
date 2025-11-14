import jnim

jclass android.util.SparseLongArray* of JVMObject:
  proc clone*(): SparseLongArray
  proc get*(key: jint): jlong
  proc get*(key: jint, valueIfKeyNotFound: jlong): jlong
  proc delete*(key: jint)
  proc removeAtRange*(index: jint, size: jint)
  proc removeAt*(index: jint)
  proc put*(key: jint, value: jlong)
  proc incrementValue*(key: jint, summand: jlong)
  proc size*(): jint
  proc keyAt*(index: jint): jint
  proc valueAt*(index: jint): jlong
  proc setValueAt*(index: jint, value: jlong)
  proc indexOfKey*(key: jint): jint
  proc indexOfValue*(value: jlong): jint
  proc clear*()
  proc append*(key: jint, value: jlong)
  proc toString*(): string

