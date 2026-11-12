import jnim

jclass android.util.RotationUtils* of JVMObject:
  proc rotateInsets*(insets: Insets, rotation: jint): Insets {.`static`.}
  proc rotateBounds*(inOutBounds: Rect, parentBounds: Rect, oldRotation: jint, newRotation: jint) {.`static`.}
  proc rotateBounds*(inOutBounds: Rect, parentWidth: jint, parentHeight: jint, rotation: jint) {.`static`.}
  proc rotateBounds*(inOutBounds: Rect, parentBounds: Rect, rotation: jint) {.`static`.}
  proc deltaRotation*(oldRotation: jint, newRotation: jint): jint {.`static`.}
  proc rotateSurface*(t: SurfaceControl.Transaction, sc: SurfaceControl, rotation: jint) {.`static`.}
  proc rotatePoint*(inOutPoint: Point, rotation: jint, parentW: jint, parentH: jint) {.`static`.}
  proc rotatePointF*(inOutPoint: PointF, rotation: jint, parentW: jfloat, parentH: jfloat) {.`static`.}
  proc transformPhysicalToLogicalCoordinates*(rotation: jint, physicalWidth: jint, physicalHeight: jint, output:Matrix) {.`static`.}
  proc reverseRotationDirectionAroundZAxis*(rotation: jint): jint {.`static`.}

