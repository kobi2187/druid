import jnim

jclass android.graphics.ColorMatrix* of JVMObject:
  proc getArray*(): seq[jfloat]
  proc reset*()
  proc set*(src: ColorMatrix)
  proc set*(src: seq[jfloat])
  proc setScale*(rScale: jfloat, gScale: jfloat, bScale: jfloat, aScale: jfloat)
  proc setRotate*(axis: jint, degrees: jfloat)
  proc setConcat*(matA: ColorMatrix, matB: ColorMatrix)
  proc preConcat*(prematrix: ColorMatrix)
  proc postConcat*(postmatrix: ColorMatrix)
  proc setSaturation*(sat: jfloat)
  proc setRGB2YUV*()
  proc setYUV2RGB*()
  proc equals*(obj: JObject): jboolean

