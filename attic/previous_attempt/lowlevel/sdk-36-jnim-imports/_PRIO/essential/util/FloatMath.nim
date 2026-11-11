import jnim

jclass android.util.FloatMath* of JVMObject:
  proc floor*(value: jfloat): jfloat {.`static`.}
  proc ceil*(value: jfloat): jfloat {.`static`.}
  proc sin*(angle: jfloat): jfloat {.`static`.}
  proc cos*(angle: jfloat): jfloat {.`static`.}
  proc sqrt*(value: jfloat): jfloat {.`static`.}
  proc exp*(value: jfloat): jfloat {.`static`.}
  proc pow*(x: jfloat, y: jfloat): jfloat {.`static`.}
  proc hypot*(x: jfloat, y: jfloat): jfloat {.`static`.}

