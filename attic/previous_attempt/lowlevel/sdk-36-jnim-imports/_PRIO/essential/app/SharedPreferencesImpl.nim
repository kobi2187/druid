import jnim

jclass android.app.EditorImpl* of JVMObject:
  proc putString*(key: string, value: string): Editor
  proc putStringSet*(key: string, values: Set[string]): Editor
  proc putInt*(key: string, value: jint): Editor
  proc putLong*(key: string, value: jlong): Editor
  proc putFloat*(key: string, value: jfloat): Editor
  proc putBoolean*(key: string, value: jboolean): Editor
  proc remove*(key: string): Editor
  proc clear*(): Editor
  proc apply*()
  proc commit*(): jboolean

