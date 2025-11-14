import jnim

jclass java.lang.StrictMath* of JVMObject:
  proc sin*(a: jdouble): jdouble {.`static`.}
  proc cos*(a: jdouble): jdouble {.`static`.}
  proc tan*(a: jdouble): jdouble {.`static`.}
  proc asin*(a: jdouble): jdouble {.`static`.}
  proc acos*(a: jdouble): jdouble {.`static`.}
  proc atan*(a: jdouble): jdouble {.`static`.}
  proc toRadians*(angdeg: jdouble): jdouble {.`static`.}
  proc toDegrees*(angrad: jdouble): jdouble {.`static`.}
  proc exp*(a: jdouble): jdouble {.`static`.}
  proc log*(a: jdouble): jdouble {.`static`.}
  proc log10*(a: jdouble): jdouble {.`static`.}
  proc sqrt*(a: jdouble): jdouble {.`static`.}
  proc cbrt*(a: jdouble): jdouble {.`static`.}
  proc IEEEremainder*(f1: jdouble, f2: jdouble): jdouble {.`static`.}
  proc ceil*(a: jdouble): jdouble {.`static`.}
  proc floor*(a: jdouble): jdouble {.`static`.}
  proc rint*(a: jdouble): jdouble {.`static`.}
  proc atan2*(y: jdouble, x: jdouble): jdouble {.`static`.}
  proc pow*(a: jdouble, b: jdouble): jdouble {.`static`.}
  proc round*(a: jfloat): jint {.`static`.}
  proc round*(a: jdouble): jlong {.`static`.}
  proc random*(): jdouble {.`static`.}
  proc addExact*(x: jint, y: jint): jint {.`static`.}
  proc addExact*(x: jlong, y: jlong): jlong {.`static`.}
  proc subtractExact*(x: jint, y: jint): jint {.`static`.}
  proc subtractExact*(x: jlong, y: jlong): jlong {.`static`.}
  proc multiplyExact*(x: jint, y: jint): jint {.`static`.}
  proc multiplyExact*(x: jlong, y: jint): jlong {.`static`.}
  proc multiplyExact*(x: jlong, y: jlong): jlong {.`static`.}
  proc divideExact*(x: jint, y: jint): jint {.`static`.}
  proc divideExact*(x: jlong, y: jlong): jlong {.`static`.}
  proc floorDivExact*(x: jint, y: jint): jint {.`static`.}
  proc floorDivExact*(x: jlong, y: jlong): jlong {.`static`.}
  proc ceilDivExact*(x: jint, y: jint): jint {.`static`.}
  proc ceilDivExact*(x: jlong, y: jlong): jlong {.`static`.}
  proc incrementExact*(a: jint): jint {.`static`.}
  proc incrementExact*(a: jlong): jlong {.`static`.}
  proc decrementExact*(a: jint): jint {.`static`.}
  proc decrementExact*(a: jlong): jlong {.`static`.}
  proc negateExact*(a: jint): jint {.`static`.}
  proc negateExact*(a: jlong): jlong {.`static`.}
  proc toIntExact*(value: jlong): jint {.`static`.}
  proc multiplyFull*(x: jint, y: jint): jlong {.`static`.}
  proc multiplyHigh*(x: jlong, y: jlong): jlong {.`static`.}
  proc unsignedMultiplyHigh*(x: jlong, y: jlong): jlong {.`static`.}
  proc floorDiv*(x: jint, y: jint): jint {.`static`.}
  proc floorDiv*(x: jlong, y: jint): jlong {.`static`.}
  proc floorDiv*(x: jlong, y: jlong): jlong {.`static`.}
  proc floorMod*(x: jint, y: jint): jint {.`static`.}
  proc floorMod*(x: jlong, y: jint): jint {.`static`.}
  proc floorMod*(x: jlong, y: jlong): jlong {.`static`.}
  proc ceilDiv*(x: jint, y: jint): jint {.`static`.}
  proc ceilDiv*(x: jlong, y: jint): jlong {.`static`.}
  proc ceilDiv*(x: jlong, y: jlong): jlong {.`static`.}
  proc ceilMod*(x: jint, y: jint): jint {.`static`.}
  proc ceilMod*(x: jlong, y: jint): jint {.`static`.}
  proc ceilMod*(x: jlong, y: jlong): jlong {.`static`.}
  proc abs*(a: jint): jint {.`static`.}
  proc absExact*(a: jint): jint {.`static`.}
  proc abs*(a: jlong): jlong {.`static`.}
  proc absExact*(a: jlong): jlong {.`static`.}
  proc abs*(a: jfloat): jfloat {.`static`.}
  proc abs*(a: jdouble): jdouble {.`static`.}
  proc max*(a: jint, b: jint): jint {.`static`.}
  proc max*(a: jlong, b: jlong): jlong {.`static`.}
  proc max*(a: jfloat, b: jfloat): jfloat {.`static`.}
  proc max*(a: jdouble, b: jdouble): jdouble {.`static`.}
  proc min*(a: jint, b: jint): jint {.`static`.}
  proc min*(a: jlong, b: jlong): jlong {.`static`.}
  proc min*(a: jfloat, b: jfloat): jfloat {.`static`.}
  proc min*(a: jdouble, b: jdouble): jdouble {.`static`.}
  proc clamp*(value: jlong, min: jint, max: jint): jint {.`static`.}
  proc clamp*(value: jlong, min: jlong, max: jlong): jlong {.`static`.}
  proc clamp*(value: jdouble, min: jdouble, max: jdouble): jdouble {.`static`.}
  proc clamp*(value: jfloat, min: jfloat, max: jfloat): jfloat {.`static`.}
  proc fma*(a: jdouble, b: jdouble, c: jdouble): jdouble {.`static`.}
  proc fma*(a: jfloat, b: jfloat, c: jfloat): jfloat {.`static`.}
  proc ulp*(d: jdouble): jdouble {.`static`.}
  proc ulp*(f: jfloat): jfloat {.`static`.}
  proc signum*(d: jdouble): jdouble {.`static`.}
  proc signum*(f: jfloat): jfloat {.`static`.}
  proc sinh*(x: jdouble): jdouble {.`static`.}
  proc cosh*(x: jdouble): jdouble {.`static`.}
  proc tanh*(x: jdouble): jdouble {.`static`.}
  proc hypot*(x: jdouble, y: jdouble): jdouble {.`static`.}
  proc expm1*(x: jdouble): jdouble {.`static`.}
  proc log1p*(x: jdouble): jdouble {.`static`.}
  proc copySign*(magnitude: jdouble, sign: jdouble): jdouble {.`static`.}
  proc copySign*(magnitude: jfloat, sign: jfloat): jfloat {.`static`.}
  proc getExponent*(f: jfloat): jint {.`static`.}
  proc getExponent*(d: jdouble): jint {.`static`.}
  proc nextAfter*(start: jdouble, direction: jdouble): jdouble {.`static`.}
  proc nextAfter*(start: jfloat, direction: jdouble): jfloat {.`static`.}
  proc nextUp*(d: jdouble): jdouble {.`static`.}
  proc nextUp*(f: jfloat): jfloat {.`static`.}
  proc nextDown*(d: jdouble): jdouble {.`static`.}
  proc nextDown*(f: jfloat): jfloat {.`static`.}
  proc scalb*(d: jdouble, scaleFactor: jint): jdouble {.`static`.}
  proc scalb*(f: jfloat, scaleFactor: jint): jfloat {.`static`.}
  proc unsignedMultiplyExact*(x: jint, y: jint): jint {.`static`.}
  proc unsignedMultiplyExact*(x: jlong, y: jint): jlong {.`static`.}
  proc unsignedMultiplyExact*(x: jlong, y: jlong): jlong {.`static`.}
  proc powExact*(x: jint, n: jint): jint {.`static`.}
  proc unsignedPowExact*(x: jint, n: jint): jint {.`static`.}
  proc powExact*(x: jlong, n: jint): jlong {.`static`.}
  proc unsignedPowExact*(x: jlong, n: jint): jlong {.`static`.}
  E*: jdouble {.`static`.}
  PI*: jdouble {.`static`.}
  TAU*: jdouble {.`static`.}

