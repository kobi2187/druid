import jnim

jclass android.graphics.Picture* of JVMObject:
  proc close*()
  proc beginRecording*(width: jint, height: jint): Canvas
  proc endRecording*()
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc requiresHardwareAcceleration*(): jboolean
  proc draw*(canvas: Canvas)
  proc createFromStream*(stream: InputStream): Picture {.`static`.}
  proc writeToStream*(stream: OutputStream)

