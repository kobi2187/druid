import jnim

jclass android.animation.Keyframe* of JVMObject:
  proc ofInt*(fraction: jfloat, value: jint): Keyframe {.`static`.}
  proc ofInt*(fraction: jfloat): Keyframe {.`static`.}
  proc ofFloat*(fraction: jfloat, value: jfloat): Keyframe {.`static`.}
  proc ofFloat*(fraction: jfloat): Keyframe {.`static`.}
  proc ofObject*(fraction: jfloat, value: JObject): Keyframe {.`static`.}
  proc ofObject*(fraction: jfloat): Keyframe {.`static`.}
  proc hasValue*(): jboolean
  proc getValue*(): JObject
  proc setValue*(value: JObject)
  proc getFraction*(): jfloat
  proc setFraction*(fraction: jfloat)
  proc getInterpolator*(): TimeInterpolator
  proc setInterpolator*(interpolator: TimeInterpolator)
  proc getType*(): Class
  proc clone*(): Keyframe

