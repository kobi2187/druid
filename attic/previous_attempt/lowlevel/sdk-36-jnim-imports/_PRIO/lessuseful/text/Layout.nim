import jnim

jclass android.text.Layout* of JVMObject:
  proc getDesiredWidth*(source: CharSequence, paint: TextPaint): jfloat {.`static`.}
  proc getDesiredWidth*(source: CharSequence, start: jint, end: jint, paint: TextPaint): jfloat {.`static`.}
  proc getDesiredWidth*(source: CharSequence, start: jint, end: jint, paint: TextPaint, textDir: TextDirectionHeuristic): jfloat {.`static`.}
  proc getDesiredWidthWithLimit*(source: CharSequence, start: jint, end: jint, paint: TextPaint, textDir: TextDirectionHeuristic, upperLimit: jfloat, useBoundsForWidth: jboolean): jfloat {.`static`.}
  proc draw*(c: Canvas)
  proc draw*(canvas: Canvas, selectionHighlight: Path, selectionHighlightPaint: Paint, cursorOffsetVertical: jint)
  proc draw*(canvas: Canvas, highlightPaths: List[Path], highlightPaints: List[Paint], selectionPath: Path, selectionPaint: Paint, cursorOffsetVertical: jint)
  proc drawText*(canvas: Canvas)
  proc drawBackground*(canvas: Canvas)
  proc drawWithoutText*(canvas: Canvas, highlightPaths: List[Path], highlightPaints: List[Paint], selectionPath: Path, selectionPaint: Paint, cursorOffsetVertical: jint, firstLine: jint, lastLine: jint)
  proc drawHighlights*(canvas: Canvas, highlightPaths: List[Path], highlightPaints: List[Paint], selectionPath: Path, selectionPaint: Paint, cursorOffsetVertical: jint, firstLine: jint, lastLine: jint)
  proc drawText*(canvas: Canvas, firstLine: jint, lastLine: jint)
  proc drawBackground*(canvas: Canvas, firstLine: jint, lastLine: jint)
  proc getLineRangeForDraw*(canvas: Canvas): jlong
  proc increaseWidthTo*(wid: jint)
  proc getHeight*(): jint
  proc getHeight*(cap: jboolean): jint
  proc getLineCount*(): jint
  proc computeDrawingBoundingBox*(): RectF
  proc getLineBounds*(line: jint, bounds: Rect): jint
  proc getLineTop*(line: jint): jint
  proc getLineDescent*(line: jint): jint
  proc getLineStart*(line: jint): jint
  proc getParagraphDirection*(line: jint): jint
  proc getLineContainsTab*(line: jint): jboolean
  proc getLineDirections*(line: jint): Directions
  proc getTopPadding*(): jint
  proc getBottomPadding*(): jint
  proc getStartHyphenEdit*(line: jint): jint
  proc getEndHyphenEdit*(line: jint): jint
  proc getIndentAdjust*(line: jint, alignment: Alignment): jint
  proc isLevelBoundary*(offset: jint): jboolean
  proc isRtlCharAt*(offset: jint): jboolean
  proc getRunRange*(offset: jint): jlong
  proc primaryIsTrailingPrevious*(offset: jint): jboolean
  proc primaryIsTrailingPreviousAllLineOffsets*(line: jint): seq[jboolean]
  proc getPrimaryHorizontal*(offset: jint): jfloat
  proc getPrimaryHorizontal*(offset: jint, clamped: jboolean): jfloat
  proc getSecondaryHorizontal*(offset: jint): jfloat
  proc getSecondaryHorizontal*(offset: jint, clamped: jboolean): jfloat
  proc fillCharacterBounds*(start: jint, end: jint, bounds: seq[jfloat], boundsStart: jint)
  proc getLineLeft*(line: jint): jfloat
  proc getLineRight*(line: jint): jfloat
  proc getLineMax*(line: jint): jfloat
  proc getLineWidth*(line: jint): jfloat
  proc getLineLetterSpacingUnitCount*(line: jint, includeTrailingWhitespace: jboolean): jint
  proc getLineForVertical*(vertical: jint): jint
  proc getLineForOffset*(offset: jint): jint
  proc getOffsetForHorizontal*(line: jint, horiz: jfloat): jint
  proc getOffsetForHorizontal*(line: jint, horiz: jfloat, primary: jboolean): jint
  proc getRangeForRect*(area: RectF, segmentFinder: SegmentFinder, inclusionStrategy: TextInclusionStrategy): seq[jint]
  proc getLineEnd*(line: jint): jint
  proc getLineVisibleEnd*(line: jint): jint
  proc getLineBottom*(line: jint): jint
  proc getLineBottom*(line: jint, includeLineSpacing: jboolean): jint
  proc getLineBaseline*(line: jint): jint
  proc getLineAscent*(line: jint): jint
  proc getLineExtra*(line: jint): jint
  proc getOffsetToLeftOf*(offset: jint): jint
  proc getOffsetToRightOf*(offset: jint): jint
  proc shouldClampCursor*(line: jint): jboolean
  proc getCursorPath*(point: jint, dest: Path, editingBuffer: CharSequence)
  proc getSelectionPath*(start: jint, end: jint, dest: Path)
  proc getSelection*(start: jint, end: jint, consumer: SelectionRectangleConsumer)
  proc getParagraphAlignment*(line: jint): Alignment
  proc getParagraphLeft*(line: jint): jint
  proc getParagraphRight*(line: jint): jint
  proc getEllipsisStart*(line: jint): jint
  proc getEllipsisCount*(line: jint): jint
  proc getText*(): CharSequence
  proc getPaint*(): TextPaint
  proc getWidth*(): jint
  proc getAlignment*(): Alignment
  proc getTextDirectionHeuristic*(): TextDirectionHeuristic
  proc getSpacingMultiplier*(): jfloat
  proc getLineSpacingMultiplier*(): jfloat
  proc getSpacingAdd*(): jfloat
  proc getLineSpacingAmount*(): jfloat
  proc isFontPaddingIncluded*(): jboolean
  proc isFallbackLineSpacingEnabled*(): jboolean
  proc getEllipsizedWidth*(): jint
  proc getEllipsize*(): TextUtils.TruncateAt
  proc getMaxLines*(): jint
  proc getBreakStrategy*(): jint
  proc getHyphenationFrequency*(): jint
  proc getLeftIndents*(): seq[jint]
  proc getRightIndents*(): seq[jint]
  proc getJustificationMode*(): jint
  proc getLineBreakConfig*(): LineBreakConfig
  proc getUseBoundsForWidth*(): jboolean
  proc getShiftDrawingOffsetForStartOverhang*(): jboolean
  proc getMinimumFontMetrics*(): Paint.FontMetrics
  BREAK_STRATEGY_SIMPLE*: jint {.`static`.}
  BREAK_STRATEGY_HIGH_QUALITY*: jint {.`static`.}
  BREAK_STRATEGY_BALANCED*: jint {.`static`.}
  HYPHENATION_FREQUENCY_NONE*: jint {.`static`.}
  HYPHENATION_FREQUENCY_NORMAL*: jint {.`static`.}
  HYPHENATION_FREQUENCY_FULL*: jint {.`static`.}
  HYPHENATION_FREQUENCY_NORMAL_FAST*: jint {.`static`.}
  HYPHENATION_FREQUENCY_FULL_FAST*: jint {.`static`.}
  JUSTIFICATION_MODE_NONE*: jint {.`static`.}
  JUSTIFICATION_MODE_INTER_WORD*: jint {.`static`.}
  JUSTIFICATION_MODE_INTER_CHARACTER*: jint {.`static`.}
  DEFAULT_LINESPACING_MULTIPLIER*: jfloat {.`static`.}
  DEFAULT_LINESPACING_ADDITION*: jfloat {.`static`.}
  INCLUSION_STRATEGY_ANY_OVERLAP*: TextInclusionStrategy {.`static`.}
  INCLUSION_STRATEGY_CONTAINS_CENTER*: TextInclusionStrategy {.`static`.}
  INCLUSION_STRATEGY_CONTAINS_ALL*: TextInclusionStrategy {.`static`.}
  DIR_LEFT_TO_RIGHT*: jint {.`static`.}
  DIR_RIGHT_TO_LEFT*: jint {.`static`.}
  DIRS_ALL_LEFT_TO_RIGHT*: Directions {.`static`.}
  DIRS_ALL_RIGHT_TO_LEFT*: Directions {.`static`.}
  TEXT_SELECTION_LAYOUT_RIGHT_TO_LEFT*: jint {.`static`.}
  TEXT_SELECTION_LAYOUT_LEFT_TO_RIGHT*: jint {.`static`.}

jclass android.text.Layout.TabStops* of JVMObject:
  proc nextDefaultStop*(h: jfloat, inc: jfloat): jfloat {.`static`.}

jclass android.text.Layout.Directions* of JVMObject:
  proc getRunCount*(): jint
  proc getRunStart*(runIndex: jint): jint
  proc getRunLength*(runIndex: jint): jint
  proc getRunLevel*(runIndex: jint): jint
  proc isRunRtl*(runIndex: jint): jboolean

jclass android.text.Layout.Builder* of JVMObject:
  proc setAlignment*(alignment: Alignment): Builder
  proc setTextDirectionHeuristic*(textDirection: TextDirectionHeuristic): Builder
  proc setLineSpacingAmount*(amount: jfloat): Builder
  proc setLineSpacingMultiplier*(multiplier: jfloat): Builder
  proc setFontPaddingIncluded*(includeFontPadding: jboolean): Builder
  proc setFallbackLineSpacingEnabled*(fallbackLineSpacing: jboolean): Builder
  proc setEllipsizedWidth*(ellipsizeWidth: jint): Builder
  proc setEllipsize*(ellipsize: TextUtils.TruncateAt): Builder
  proc setMaxLines*(maxLines: jint): Builder
  proc setBreakStrategy*(breakStrategy: jint): Builder
  proc setHyphenationFrequency*(hyphenationFrequency: jint): Builder
  proc setLeftIndents*(leftIndents: seq[jint]): Builder
  proc setRightIndents*(rightIndents: seq[jint]): Builder
  proc setJustificationMode*(justificationMode: jint): Builder
  proc setLineBreakConfig*(lineBreakConfig: LineBreakConfig): Builder
  proc setUseBoundsForWidth*(useBoundsForWidth: jboolean): Builder
  proc setShiftDrawingOffsetForStartOverhang*(shiftDrawingOffsetForStartOverhang: jboolean): Builder
  proc setMinimumFontMetrics*(minimumFontMetrics: Paint.FontMetrics): Builder
  proc build*(): Layout

jclass android.text.TabStops* of JVMObject:
  proc nextDefaultStop*(h: jfloat, inc: jfloat): jfloat {.`static`.}

jclass android.text.Directions* of JVMObject:
  proc getRunCount*(): jint
  proc getRunStart*(runIndex: jint): jint
  proc getRunLength*(runIndex: jint): jint
  proc getRunLevel*(runIndex: jint): jint
  proc isRunRtl*(runIndex: jint): jboolean
  mDirections*: jint



jclass android.text.Builder* of JVMObject:
  proc setAlignment*(alignment: Alignment): Builder
  proc setTextDirectionHeuristic*(textDirection: TextDirectionHeuristic): Builder
  proc setLineSpacingAmount*(amount: jfloat): Builder
  proc setLineSpacingMultiplier*(multiplier: jfloat): Builder
  proc setFontPaddingIncluded*(includeFontPadding: jboolean): Builder
  proc setFallbackLineSpacingEnabled*(fallbackLineSpacing: jboolean): Builder
  proc setEllipsizedWidth*(ellipsizeWidth: jint): Builder
  proc setEllipsize*(ellipsize: TextUtils.TruncateAt): Builder
  proc setMaxLines*(maxLines: jint): Builder
  proc setBreakStrategy*(breakStrategy: jint): Builder
  proc setHyphenationFrequency*(hyphenationFrequency: jint): Builder
  proc setLeftIndents*(leftIndents: seq[jint]): Builder
  proc setRightIndents*(rightIndents: seq[jint]): Builder
  proc setJustificationMode*(justificationMode: jint): Builder
  proc setLineBreakConfig*(lineBreakConfig: LineBreakConfig): Builder
  proc setUseBoundsForWidth*(useBoundsForWidth: jboolean): Builder
  proc setShiftDrawingOffsetForStartOverhang*(shiftDrawingOffsetForStartOverhang: jboolean): Builder
  proc setMinimumFontMetrics*(minimumFontMetrics: Paint.FontMetrics): Builder
  proc build*(): Layout

