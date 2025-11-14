import jnim

jclass android.util.MathUtils* of JVMObject:
  proc abs*(v: jfloat): jfloat {.`static`.}
  proc constrain*(amount: jint, low: jint, high: jint): jint {.`static`.}
  proc constrain*(amount: jlong, low: jlong, high: jlong): jlong {.`static`.}
  proc constrain*(amount: jfloat, low: jfloat, high: jfloat): jfloat {.`static`.}
  proc log*(a: jfloat): jfloat {.`static`.}
  proc exp*(a: jfloat): jfloat {.`static`.}
  proc pow*(a: jfloat, b: jfloat): jfloat {.`static`.}
  proc sqrt*(a: jfloat): jfloat {.`static`.}
  proc max*(a: jfloat, b: jfloat): jfloat {.`static`.}
  proc max*(a: jint, b: jint): jfloat {.`static`.}
  proc max*(a: jfloat, b: jfloat, c: jfloat): jfloat {.`static`.}
  proc max*(a: jint, b: jint, c: jint): jfloat {.`static`.}
  proc min*(a: jfloat, b: jfloat): jfloat {.`static`.}
  proc min*(a: jint, b: jint): jfloat {.`static`.}
  proc min*(a: jfloat, b: jfloat, c: jfloat): jfloat {.`static`.}
  proc min*(a: jint, b: jint, c: jint): jfloat {.`static`.}
  proc dist*(x1: jfloat, y1: jfloat, x2: jfloat, y2: jfloat): jfloat {.`static`.}
  proc dist*(x1: jfloat, y1: jfloat, z1: jfloat, x2: jfloat, y2: jfloat, z2: jfloat): jfloat {.`static`.}
  proc mag*(a: jfloat, b: jfloat): jfloat {.`static`.}
  proc mag*(a: jfloat, b: jfloat, c: jfloat): jfloat {.`static`.}
  proc sq*(v: jfloat): jfloat {.`static`.}
  proc dot*(v1x: jfloat, v1y: jfloat, v2x: jfloat, v2y: jfloat): jfloat {.`static`.}
  proc cross*(v1x: jfloat, v1y: jfloat, v2x: jfloat, v2y: jfloat): jfloat {.`static`.}
  proc radians*(degrees: jfloat): jfloat {.`static`.}
  proc degrees*(radians: jfloat): jfloat {.`static`.}
  proc acos*(value: jfloat): jfloat {.`static`.}
  proc asin*(value: jfloat): jfloat {.`static`.}
  proc atan*(value: jfloat): jfloat {.`static`.}
  proc atan2*(a: jfloat, b: jfloat): jfloat {.`static`.}
  proc tan*(angle: jfloat): jfloat {.`static`.}
  proc lerp*(start: jfloat, stop: jfloat, amount: jfloat): jfloat {.`static`.}
  proc lerp*(start: jint, stop: jint, amount: jfloat): jfloat {.`static`.}
  proc lerpInv*(a: jfloat, b: jfloat, value: jfloat): jfloat {.`static`.}
  proc saturate*(value: jfloat): jfloat {.`static`.}
  proc lerpInvSat*(a: jfloat, b: jfloat, value: jfloat): jfloat {.`static`.}
  proc lerpDeg*(start: jfloat, end: jfloat, amount: jfloat): jfloat {.`static`.}
  proc norm*(start: jfloat, stop: jfloat, value: jfloat): jfloat {.`static`.}
  proc map*(minStart: jfloat, minStop: jfloat, maxStart: jfloat, maxStop: jfloat, value: jfloat): jfloat {.`static`.}
  proc constrainedMap*(rangeMin: jfloat, rangeMax: jfloat, valueMin: jfloat, valueMax: jfloat, value: jfloat): jfloat {.`static`.}
  proc smoothStep*(start: jfloat, end: jfloat, x: jfloat): jfloat {.`static`.}
  proc addOrThrow*(a: jint, b: jint): jint {.`static`.}
  proc fitRect*(outToResize: Rect, largestSide: jint) {.`static`.}

