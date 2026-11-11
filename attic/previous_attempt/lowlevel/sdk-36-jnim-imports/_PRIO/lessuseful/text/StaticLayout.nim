import jnim

jclass android.text.StaticLayout* of Layout:
  proc getLineForVertical*(vertical: jint): jint
  proc getLineCount*(): jint
  proc getLineTop*(line: jint): jint
  proc getLineExtra*(line: jint): jint
  proc getLineDescent*(line: jint): jint
  proc getLineStart*(line: jint): jint
  proc getParagraphDirection*(line: jint): jint
  proc getLineContainsTab*(line: jint): jboolean
  proc getLineDirections*(line: jint): Directions
  proc getTopPadding*(): jint
  proc getBottomPadding*(): jint
  proc getStartHyphenEdit*(lineNumber: jint): jint
  proc getEndHyphenEdit*(lineNumber: jint): jint
  proc getIndentAdjust*(line: jint, align: Alignment): jint
  proc getEllipsisCount*(line: jint): jint
  proc getEllipsisStart*(line: jint): jint
  proc computeDrawingBoundingBox*(): RectF
  proc getHeight*(cap: jboolean): jint

jclass android.text.StaticLayout.Builder* of JVMObject:
  proc obtain*(source: CharSequence, start: jint, end: jint, paint: TextPaint, width: jint): Builder {.`static`.}
  proc setText*(source: CharSequence): Builder
  proc setText*(source: CharSequence, start: jint, end: jint): Builder
  proc setPaint*(paint: TextPaint): Builder
  proc setWidth*(width: jint): Builder
  proc setAlignment*(alignment: Alignment): Builder
  proc setTextDirection*(textDir: TextDirectionHeuristic): Builder
  proc setLineSpacing*(spacingAdd: jfloat, spacingMult: jfloat): Builder
  proc setIncludePad*(includePad: jboolean): Builder
  proc setUseLineSpacingFromFallbacks*(useLineSpacingFromFallbacks: jboolean): Builder
  proc setEllipsizedWidth*(ellipsizedWidth: jint): Builder
  proc setEllipsize*(ellipsize: TextUtils.TruncateAt): Builder
  proc setMaxLines*(maxLines: jint): Builder
  proc setBreakStrategy*(breakStrategy: jint): Builder
  proc setHyphenationFrequency*(hyphenationFrequency: jint): Builder
  proc setIndents*(leftIndents: seq[jint], rightIndents: seq[jint]): Builder
  proc setJustificationMode*(justificationMode: jint): Builder
  proc setLineBreakConfig*(lineBreakConfig: LineBreakConfig): Builder
  proc setUseBoundsForWidth*(useBoundsForWidth: jboolean): Builder
  proc setShiftDrawingOffsetForStartOverhang*(shiftDrawingOffsetForStartOverhang: jboolean): Builder
  proc setCalculateBounds*(value: jboolean): Builder
  proc setMinimumFontMetrics*(minimumFontMetrics: Paint.FontMetrics): Builder
  proc build*(): StaticLayout

jclass android.text.Builder* of JVMObject:
  proc obtain*(source: CharSequence, start: jint, end: jint, paint: TextPaint, width: jint): Builder {.`static`.}
  proc setText*(source: CharSequence): Builder
  proc setText*(source: CharSequence, start: jint, end: jint): Builder
  proc setPaint*(paint: TextPaint): Builder
  proc setWidth*(width: jint): Builder
  proc setAlignment*(alignment: Alignment): Builder
  proc setTextDirection*(textDir: TextDirectionHeuristic): Builder
  proc setLineSpacing*(spacingAdd: jfloat, spacingMult: jfloat): Builder
  proc setIncludePad*(includePad: jboolean): Builder
  proc setUseLineSpacingFromFallbacks*(useLineSpacingFromFallbacks: jboolean): Builder
  proc setEllipsizedWidth*(ellipsizedWidth: jint): Builder
  proc setEllipsize*(ellipsize: TextUtils.TruncateAt): Builder
  proc setMaxLines*(maxLines: jint): Builder
  proc setBreakStrategy*(breakStrategy: jint): Builder
  proc setHyphenationFrequency*(hyphenationFrequency: jint): Builder
  proc setIndents*(leftIndents: seq[jint], rightIndents: seq[jint]): Builder
  proc setJustificationMode*(justificationMode: jint): Builder
  proc setLineBreakConfig*(lineBreakConfig: LineBreakConfig): Builder
  proc setUseBoundsForWidth*(useBoundsForWidth: jboolean): Builder
  proc setShiftDrawingOffsetForStartOverhang*(shiftDrawingOffsetForStartOverhang: jboolean): Builder
  proc setCalculateBounds*(value: jboolean): Builder
  proc setMinimumFontMetrics*(minimumFontMetrics: Paint.FontMetrics): Builder
  proc build*(): StaticLayout

