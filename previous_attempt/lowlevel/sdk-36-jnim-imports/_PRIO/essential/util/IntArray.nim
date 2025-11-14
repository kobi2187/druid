import jnim

jclass android.util.IntArray* of JVMObject:
  proc wrap*(array: seq[jint]): IntArray {.`static`.}
  proc fromArray*(array: seq[jint], size: jint): IntArray {.`static`.}
  proc resize*(newSize: jint)
  proc add*(value: jint)
  proc add*(index: jint, value: jint)
  proc binarySearch*(value: jint): jint
  proc addAll*(values: IntArray)
  proc addAll*(values: seq[jint])
  proc clear*()
  proc clone*(): IntArray
  proc get*(index: jint): jint
  proc set*(index: jint, value: jint)
  proc indexOf*(value: jint): jint
  proc contains*(value: jint): jboolean
  proc remove*(index: jint)
  proc size*(): jint
  proc toArray*(): seq[jint]
  proc toString*(): string

