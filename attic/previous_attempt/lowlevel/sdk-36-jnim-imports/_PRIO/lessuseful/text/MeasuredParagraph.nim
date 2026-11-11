import jnim

jclass android.text.MeasuredParagraph* of JVMObject:
  proc recycle*()
  proc release*()
  proc getTextLength*(): jint
  proc getChars*(): seq[jchar]
  proc getParagraphDir*(): jint
  proc getDirections*(start: jint, end: jint): Directions
  proc getWholeWidth*(): jfloat
  proc getWidths*(): FloatArray
  proc getSpanEndCache*(): IntArray
  proc getFontMetrics*(): IntArray
  proc getMeasuredText*(): MeasuredText
  proc getWidth*(start: jint, end: jint): jfloat
  proc getBounds*(start: jint, end: jint, bounds: Rect)
  proc getFontMetricsInt*(start: jint, end: jint, fmi: Paint.FontMetricsInt)
  proc getCharWidthAt*(offset: jint): jfloat
  proc buildForBidi*(text: CharSequence, start: jint, end: jint, textDir: TextDirectionHeuristic, recycle: MeasuredParagraph): MeasuredParagraph {.`static`.}
  proc buildForMeasurement*(paint: TextPaint, text: CharSequence, start: jint, end: jint, textDir: TextDirectionHeuristic, recycle: MeasuredParagraph): MeasuredParagraph {.`static`.}
  proc buildForStaticLayout*(paint: TextPaint, lineBreakConfig: LineBreakConfig, text: CharSequence, start: jint, end: jint, textDir: TextDirectionHeuristic, hyphenationMode: jint, computeLayout: jboolean, computeBounds: jboolean, hint: MeasuredParagraph, recycle: MeasuredParagraph): MeasuredParagraph {.`static`.}
  proc buildForStaticLayoutTest*(paint: TextPaint, lineBreakConfig: LineBreakConfig, text: CharSequence, start: jint, end: jint, textDir: TextDirectionHeuristic, hyphenationMode: jint, computeLayout: jboolean, testCallback: StyleRunCallback): MeasuredParagraph {.`static`.}
  proc getMemoryUsage*(): jint

