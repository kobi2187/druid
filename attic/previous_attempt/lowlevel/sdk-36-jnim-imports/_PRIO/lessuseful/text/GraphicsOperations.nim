import jnim

jclass android.text.GraphicsOperations* of CharSequence:
  proc getTextWidths*(start: jint, end: jint, widths: seq[jfloat], p: Paint): jint

