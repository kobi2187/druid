import jnim

jclass android.text.AutoGrowArray.ByteArray* of JVMObject:
  proc resize*(newSize: jint)
  proc append*(value: jbyte)
  proc clear*()
  proc clearWithReleasingLargeArray*()
  proc get*(index: jint): jbyte
  proc set*(index: jint, value: jbyte)
  proc size*(): jint
  proc getRawArray*(): seq[jbyte]

jclass android.text.AutoGrowArray.IntArray* of JVMObject:
  proc resize*(newSize: jint)
  proc append*(value: jint)
  proc clear*()
  proc clearWithReleasingLargeArray*()
  proc get*(index: jint): jint
  proc set*(index: jint, value: jint)
  proc size*(): jint
  proc getRawArray*(): seq[jint]

jclass android.text.AutoGrowArray.FloatArray* of JVMObject:
  proc resize*(newSize: jint)
  proc append*(value: jfloat)
  proc clear*()
  proc clearWithReleasingLargeArray*()
  proc get*(index: jint): jfloat
  proc set*(index: jint, value: jfloat)
  proc size*(): jint
  proc getRawArray*(): seq[jfloat]

jclass android.text.ByteArray* of JVMObject:
  proc resize*(newSize: jint)
  proc append*(value: jbyte)
  proc clear*()
  proc clearWithReleasingLargeArray*()
  proc get*(index: jint): jbyte
  proc set*(index: jint, value: jbyte)
  proc size*(): jint
  proc getRawArray*(): seq[jbyte]

jclass android.text.IntArray* of JVMObject:
  proc resize*(newSize: jint)
  proc append*(value: jint)
  proc clear*()
  proc clearWithReleasingLargeArray*()
  proc get*(index: jint): jint
  proc set*(index: jint, value: jint)
  proc size*(): jint
  proc getRawArray*(): seq[jint]

jclass android.text.FloatArray* of JVMObject:
  proc resize*(newSize: jint)
  proc append*(value: jfloat)
  proc clear*()
  proc clearWithReleasingLargeArray*()
  proc get*(index: jint): jfloat
  proc set*(index: jint, value: jfloat)
  proc size*(): jint
  proc getRawArray*(): seq[jfloat]

