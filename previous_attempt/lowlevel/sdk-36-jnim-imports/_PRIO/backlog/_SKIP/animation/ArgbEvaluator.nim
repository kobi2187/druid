import jnim

jclass android.animation.ArgbEvaluator* of JVMObject:
  proc getInstance*(): ArgbEvaluator {.`static`.}
  proc evaluate*(fraction: jfloat, startValue: JObject, endValue: JObject): JObject

