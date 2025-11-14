import jnim

jclass android.animation.KeyframeSet* of JVMObject:
  proc getKeyframes*(): List[Keyframe]
  proc ofInt*(values: jint): KeyframeSet {.`static`.}
  proc ofFloat*(values: jfloat): KeyframeSet {.`static`.}
  proc ofKeyframe*(keyframes: Keyframe): KeyframeSet {.`static`.}
  proc ofObject*(values: JObject): KeyframeSet {.`static`.}
  proc ofPath*(path: Path): PathKeyframes {.`static`.}
  proc ofPath*(path: Path, error: jfloat): PathKeyframes {.`static`.}
  proc setEvaluator*(evaluator: TypeEvaluator)
  proc getType*(): Class
  proc clone*(): KeyframeSet
  proc getValue*(fraction: jfloat): JObject
  proc toString*(): string

