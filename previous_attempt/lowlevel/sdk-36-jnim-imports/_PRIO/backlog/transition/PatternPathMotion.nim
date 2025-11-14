import jnim

jclass android.transition.PatternPathMotion* of PathMotion:
  proc getPatternPath*(): Path
  proc setPatternPath*(patternPath: Path)
  proc getPath*(startX: jfloat, startY: jfloat, endX: jfloat, endY: jfloat): Path

