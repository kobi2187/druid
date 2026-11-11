import jnim

jclass android.transition.ArcMotion* of PathMotion:
  proc setMinimumHorizontalAngle*(angleInDegrees: jfloat)
  proc getMinimumHorizontalAngle*(): jfloat
  proc setMinimumVerticalAngle*(angleInDegrees: jfloat)
  proc getMinimumVerticalAngle*(): jfloat
  proc setMaximumAngle*(angleInDegrees: jfloat)
  proc getMaximumAngle*(): jfloat
  proc getPath*(startX: jfloat, startY: jfloat, endX: jfloat, endY: jfloat): Path

