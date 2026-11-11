import jnim

jclass android.text.TextPaint* of Paint:
  proc set*(tp: TextPaint)
  proc setUnderlineText*(color: jint, thickness: jfloat)
  proc getUnderlineThickness*(): jfloat
  bgColor*: jint
  baselineShift*: jint
  linkColor*: jint
  drawableState*: jint
  density*: jfloat
  underlineColor*: jint
  underlineThickness*: jfloat

