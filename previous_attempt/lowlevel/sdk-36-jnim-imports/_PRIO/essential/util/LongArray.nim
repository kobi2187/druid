import jnim

jclass android.util.LongArray* of JVMObject:
  proc wrap*(array: seq[jlong]): LongArray {.`static`.}
  proc fromArray*(array: seq[jlong], size: jint): LongArray {.`static`.}
  proc resize*(newSize: jint)
  proc add*(value: jlong)
  proc add*(index: jint, value: jlong)
  proc addAll*(values: LongArray)
  proc clear*()
  proc clone*(): LongArray
  proc get*(index: jint): jlong
  proc set*(index: jint, value: jlong)
  proc indexOf*(value: jlong): jint
  proc remove*(index: jint)
  proc size*(): jint
  proc toArray*(): seq[jlong]
  proc elementsEqual*(a: LongArray, b: LongArray): jboolean {.`static`.}

