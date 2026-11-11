import jnim

jclass android.graphics.Shader* of JVMObject:
  proc getLocalMatrix*(localM: Matrix): jboolean
  proc setLocalMatrix*(localM: Matrix)
  proc getNativeInstance*(filterFromPaint: jboolean): jlong
  proc getNativeInstance*(): jlong

