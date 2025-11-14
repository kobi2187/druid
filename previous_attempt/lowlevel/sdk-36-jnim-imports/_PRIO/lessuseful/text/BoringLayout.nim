import jnim

jclass android.text.BoringLayout* of Layout:
  proc make*(source: CharSequence, paint: TextPaint, outerWidth: jint, align: Alignment, spacingMult: jfloat, spacingAdd: jfloat, metrics: BoringLayout.Metrics, includePad: jboolean): BoringLayout {.`static`.}
  proc make*(source: CharSequence, paint: TextPaint, outerWidth: jint, align: Alignment, spacingmult: jfloat, spacingadd: jfloat, metrics: BoringLayout.Metrics, includePad: jboolean, ellipsize: TextUtils.TruncateAt, ellipsizedWidth: jint): BoringLayout {.`static`.}
  proc make*(source: CharSequence, paint: TextPaint, outerWidth: jint, align: Alignment, metrics: BoringLayout.Metrics, includePad: jboolean, ellipsize: TextUtils.TruncateAt, ellipsizedWidth: jint, useFallbackLineSpacing: jboolean): BoringLayout {.`static`.}
  proc replaceOrMake*(source: CharSequence, paint: TextPaint, outerwidth: jint, align: Alignment, spacingMult: jfloat, spacingAdd: jfloat, metrics: BoringLayout.Metrics, includePad: jboolean): BoringLayout
  proc replaceOrMake*(source: CharSequence, paint: TextPaint, outerWidth: jint, align: Alignment, metrics: BoringLayout.Metrics, includePad: jboolean, ellipsize: TextUtils.TruncateAt, ellipsizedWidth: jint, useFallbackLineSpacing: jboolean): BoringLayout
  proc replaceOrMake*(source: CharSequence, paint: TextPaint, outerWidth: jint, align: Alignment, spacingMultiplier: jfloat, spacingAmount: jfloat, metrics: BoringLayout.Metrics, includePad: jboolean, ellipsize: TextUtils.TruncateAt, ellipsizedWidth: jint, useFallbackLineSpacing: jboolean, useBoundsForWidth: jboolean, minimumFontMetrics: Paint.FontMetrics): BoringLayout
  proc replaceOrMake*(source: CharSequence, paint: TextPaint, outerWidth: jint, align: Alignment, spacingMult: jfloat, spacingAdd: jfloat, metrics: BoringLayout.Metrics, includePad: jboolean, ellipsize: TextUtils.TruncateAt, ellipsizedWidth: jint): BoringLayout
  proc isBoring*(text: CharSequence, paint: TextPaint): Metrics {.`static`.}
  proc isBoring*(text: CharSequence, paint: TextPaint, metrics: Metrics): Metrics {.`static`.}
  proc isBoring*(text: CharSequence, paint: TextPaint, textDir: TextDirectionHeuristic, metrics: Metrics): Metrics {.`static`.}
  proc isBoring*(text: CharSequence, paint: TextPaint, textDir: TextDirectionHeuristic, useFallbackLineSpacing: jboolean, metrics: Metrics): Metrics {.`static`.}
  proc isBoring*(text: CharSequence, paint: TextPaint, textDir: TextDirectionHeuristic, useFallbackLineSpacing: jboolean, minimumFontMetrics: Paint.FontMetrics, metrics: Metrics): Metrics {.`static`.}
  proc getHeight*(): jint
  proc getLineCount*(): jint
  proc getLineTop*(line: jint): jint
  proc getLineDescent*(line: jint): jint
  proc getLineStart*(line: jint): jint
  proc getParagraphDirection*(line: jint): jint
  proc getLineContainsTab*(line: jint): jboolean
  proc getLineMax*(line: jint): jfloat
  proc getLineWidth*(line: jint): jfloat
  proc getLineDirections*(line: jint): Directions
  proc getTopPadding*(): jint
  proc getBottomPadding*(): jint
  proc getEllipsisCount*(line: jint): jint
  proc getEllipsisStart*(line: jint): jint
  proc getEllipsizedWidth*(): jint
  proc isFallbackLineSpacingEnabled*(): jboolean
  proc computeDrawingBoundingBox*(): RectF
  proc draw*(c: Canvas, highlight: Path, highlightpaint: Paint, cursorOffset: jint)
  proc ellipsized*(start: jint, end: jint)

jclass android.text.BoringLayout.Metrics* of JVMObject:
  proc getDrawingBoundingBox*(): RectF
  proc toString*(): string

jclass android.text.Metrics* of FontMetricsInt:
  proc getDrawingBoundingBox*(): RectF
  proc toString*(): string
  width*: jint

