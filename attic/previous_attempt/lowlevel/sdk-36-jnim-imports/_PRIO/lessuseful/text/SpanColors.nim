import jnim

jclass android.text.SpanColors* of JVMObject:
  proc init*(workPaint: TextPaint, spanned: Spanned, start: jint, end: jint)
  proc recycle*()
  proc getColorAt*(index: jint): jint
  NO_COLOR_FOUND*: jint {.`static`.}

