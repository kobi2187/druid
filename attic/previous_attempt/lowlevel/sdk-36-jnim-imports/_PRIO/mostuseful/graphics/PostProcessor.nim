import jnim

jclass android.graphics.PostProcessor* of JVMObject:
  proc onPostProcess*(canvas: Canvas): jint

