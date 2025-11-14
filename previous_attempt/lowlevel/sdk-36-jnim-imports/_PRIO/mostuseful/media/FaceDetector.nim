import jnim

jclass android.media.FaceDetector* of JVMObject:
  proc findFaces*(bitmap: Bitmap, faces: seq[Face]): jint

jclass android.media.FaceDetector.Face* of JVMObject:
  proc confidence*(): jfloat
  proc getMidPoint*(point: PointF)
  proc eyesDistance*(): jfloat
  proc pose*(euler: jint): jfloat

jclass android.media.Face* of JVMObject:
  proc confidence*(): jfloat
  proc getMidPoint*(point: PointF)
  proc eyesDistance*(): jfloat
  proc pose*(euler: jint): jfloat
  CONFIDENCE_THRESHOLD*: jfloat {.`static`.}
  EULER_X*: jint {.`static`.}
  EULER_Y*: jint {.`static`.}
  EULER_Z*: jint {.`static`.}

