import jnim

jclass android.util.SparseSetArray* of JVMObject:
  proc add*(n: jint, value: T): jboolean
  proc addAll*(n: jint, values: ArraySet[T])
  proc clear*()
  proc contains*(n: jint, value: T): jboolean
  proc get*(n: jint): ArraySet[T]
  proc remove*(n: jint, value: T): jboolean
  proc remove*(n: jint)
  proc size*(): jint
  proc keyAt*(index: jint): jint
  proc sizeAt*(index: jint): jint
  proc valueAt*(intIndex: jint, valueIndex: jint): T
  proc valuesAt*(intIndex: jint): ArraySet[T]

