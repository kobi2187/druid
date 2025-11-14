import jnim

jclass android.graphics.CanvasProperty* of JVMObject:
  proc createFloat*(initialValue: jfloat): CanvasProperty[Float] {.`static`.}
  proc createPaint*(initialValue: Paint): CanvasProperty[Paint] {.`static`.}
  proc getNativeContainer*(): jlong

