import jnim

jclass android.graphics.Matrix* of JVMObject:
  proc isIdentity*(): jboolean
  proc isAffine*(): jboolean
  proc rectStaysRect*(): jboolean
  proc set*(src: Matrix)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc reset*()
  proc setTranslate*(dx: jfloat, dy: jfloat)
  proc setScale*(sx: jfloat, sy: jfloat, px: jfloat, py: jfloat)
  proc setScale*(sx: jfloat, sy: jfloat)
  proc setRotate*(degrees: jfloat, px: jfloat, py: jfloat)
  proc setRotate*(degrees: jfloat)
  proc setSinCos*(sinValue: jfloat, cosValue: jfloat, px: jfloat, py: jfloat)
  proc setSinCos*(sinValue: jfloat, cosValue: jfloat)
  proc setSkew*(kx: jfloat, ky: jfloat, px: jfloat, py: jfloat)
  proc setSkew*(kx: jfloat, ky: jfloat)
  proc setConcat*(a: Matrix, b: Matrix): jboolean
  proc preTranslate*(dx: jfloat, dy: jfloat): jboolean
  proc preScale*(sx: jfloat, sy: jfloat, px: jfloat, py: jfloat): jboolean
  proc preScale*(sx: jfloat, sy: jfloat): jboolean
  proc preRotate*(degrees: jfloat, px: jfloat, py: jfloat): jboolean
  proc preRotate*(degrees: jfloat): jboolean
  proc preSkew*(kx: jfloat, ky: jfloat, px: jfloat, py: jfloat): jboolean
  proc preSkew*(kx: jfloat, ky: jfloat): jboolean
  proc preConcat*(other: Matrix): jboolean
  proc postTranslate*(dx: jfloat, dy: jfloat): jboolean
  proc postScale*(sx: jfloat, sy: jfloat, px: jfloat, py: jfloat): jboolean
  proc postScale*(sx: jfloat, sy: jfloat): jboolean
  proc postRotate*(degrees: jfloat, px: jfloat, py: jfloat): jboolean
  proc postRotate*(degrees: jfloat): jboolean
  proc postSkew*(kx: jfloat, ky: jfloat, px: jfloat, py: jfloat): jboolean
  proc postSkew*(kx: jfloat, ky: jfloat): jboolean
  proc postConcat*(other: Matrix): jboolean
  proc setRectToRect*(src: RectF, dst: RectF, stf: ScaleToFit): jboolean
  proc setPolyToPoly*(src: seq[jfloat], srcIndex: jint, dst: seq[jfloat], dstIndex: jint, pointCount: jint): jboolean
  proc invert*(inverse: Matrix): jboolean
  proc mapPoints*(dst: seq[jfloat], dstIndex: jint, src: seq[jfloat], srcIndex: jint, pointCount: jint)
  proc mapVectors*(dst: seq[jfloat], dstIndex: jint, src: seq[jfloat], srcIndex: jint, vectorCount: jint)
  proc mapPoints*(dst: seq[jfloat], src: seq[jfloat])
  proc mapVectors*(dst: seq[jfloat], src: seq[jfloat])
  proc mapPoints*(pts: seq[jfloat])
  proc mapVectors*(vecs: seq[jfloat])
  proc mapRect*(dst: RectF, src: RectF): jboolean
  proc mapRect*(rect: RectF): jboolean
  proc mapRadius*(radius: jfloat): jfloat
  proc getValues*(values: seq[jfloat])
  proc setValues*(values: seq[jfloat])
  proc toString*(): string
  proc toShortString*(): string
  proc dump*(pw: PrintWriter)
  proc ni*(): jlong
  MSCALE_X*: jint {.`static`.}
  MSKEW_X*: jint {.`static`.}
  MTRANS_X*: jint {.`static`.}
  MSKEW_Y*: jint {.`static`.}
  MSCALE_Y*: jint {.`static`.}
  MTRANS_Y*: jint {.`static`.}
  MPERSP_0*: jint {.`static`.}
  MPERSP_1*: jint {.`static`.}
  MPERSP_2*: jint {.`static`.}
  IDENTITY_MATRIX*: Matrix {.`static`.}

