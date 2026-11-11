import jnim

jclass android.animation.PathKeyframes* of JVMObject:
  proc getKeyframes*(): ArrayList[Keyframe]
  proc getValue*(fraction: jfloat): JObject
  proc setEvaluator*(evaluator: TypeEvaluator)
  proc getType*(): Class
  proc clone*(): Keyframes
  proc createXFloatKeyframes*(): FloatKeyframes
  proc createYFloatKeyframes*(): FloatKeyframes
  proc createXIntKeyframes*(): IntKeyframes
  proc createYIntKeyframes*(): IntKeyframes

