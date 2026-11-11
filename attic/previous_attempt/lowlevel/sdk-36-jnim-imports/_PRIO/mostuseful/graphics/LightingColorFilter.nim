import jnim

jclass android.graphics.LightingColorFilter* of ColorFilter:
  proc getColorMultiply*(): jint
  proc setColorMultiply*(mul: jint)
  proc getColorAdd*(): jint
  proc setColorAdd*(add: jint)

