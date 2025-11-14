import jnim

jclass android.text.DynamicLayout* of Layout:
  proc reflow*(s: CharSequence, where: jint, before: jint, after: jint)
  proc getBlocksAlwaysNeedToBeRedrawn*(): ArraySet[Integer]
  proc updateBlocks*(startLine: jint, endLine: jint, newLineCount: jint)
  proc setBlocksDataForTest*(blockEndLines: seq[jint], blockIndices: seq[jint], numberOfBlocks: jint, totalLines: jint)
  proc getBlockEndLines*(): seq[jint]
  proc getBlockIndices*(): seq[jint]
  proc getBlockIndex*(index: jint): jint
  proc setBlockIndex*(index: jint, blockIndex: jint)
  proc getNumberOfBlocks*(): jint
  proc getIndexFirstChangedBlock*(): jint
  proc setIndexFirstChangedBlock*(i: jint)
  proc getLineCount*(): jint
  proc getLineTop*(line: jint): jint
  proc getLineDescent*(line: jint): jint
  proc getLineExtra*(line: jint): jint
  proc getLineStart*(line: jint): jint
  proc getLineContainsTab*(line: jint): jboolean
  proc getParagraphDirection*(line: jint): jint
  proc getLineDirections*(line: jint): Directions
  proc getTopPadding*(): jint
  proc getBottomPadding*(): jint
  proc getStartHyphenEdit*(line: jint): jint
  proc getEndHyphenEdit*(line: jint): jint
  proc getEllipsizedWidth*(): jint
  proc getEllipsisStart*(line: jint): jint
  proc getEllipsisCount*(line: jint): jint
  proc getLineBreakConfig*(): LineBreakConfig
  INVALID_BLOCK_INDEX*: jint {.`static`.}

jclass android.text.DynamicLayout.Builder* of JVMObject:
  proc obtain*(base: CharSequence, paint: TextPaint, width: jint): Builder {.`static`.}
  proc setDisplayText*(display: CharSequence): Builder
  proc setAlignment*(alignment: Alignment): Builder
  proc setTextDirection*(textDir: TextDirectionHeuristic): Builder
  proc setLineSpacing*(spacingAdd: jfloat, spacingMult: jfloat): Builder
  proc setIncludePad*(includePad: jboolean): Builder
  proc setUseLineSpacingFromFallbacks*(useLineSpacingFromFallbacks: jboolean): Builder
  proc setEllipsizedWidth*(ellipsizedWidth: jint): Builder
  proc setEllipsize*(ellipsize: TextUtils.TruncateAt): Builder
  proc setBreakStrategy*(breakStrategy: jint): Builder
  proc setHyphenationFrequency*(hyphenationFrequency: jint): Builder
  proc setJustificationMode*(justificationMode: jint): Builder
  proc setLineBreakConfig*(lineBreakConfig: LineBreakConfig): Builder
  proc setUseBoundsForWidth*(useBoundsForWidth: jboolean): Builder
  proc setShiftDrawingOffsetForStartOverhang*(shiftDrawingOffsetForStartOverhang: jboolean): Builder
  proc setMinimumFontMetrics*(minimumFontMetrics: Paint.FontMetrics): Builder
  proc build*(): DynamicLayout

jclass android.text.Builder* of JVMObject:
  proc obtain*(base: CharSequence, paint: TextPaint, width: jint): Builder {.`static`.}
  proc setDisplayText*(display: CharSequence): Builder
  proc setAlignment*(alignment: Alignment): Builder
  proc setTextDirection*(textDir: TextDirectionHeuristic): Builder
  proc setLineSpacing*(spacingAdd: jfloat, spacingMult: jfloat): Builder
  proc setIncludePad*(includePad: jboolean): Builder
  proc setUseLineSpacingFromFallbacks*(useLineSpacingFromFallbacks: jboolean): Builder
  proc setEllipsizedWidth*(ellipsizedWidth: jint): Builder
  proc setEllipsize*(ellipsize: TextUtils.TruncateAt): Builder
  proc setBreakStrategy*(breakStrategy: jint): Builder
  proc setHyphenationFrequency*(hyphenationFrequency: jint): Builder
  proc setJustificationMode*(justificationMode: jint): Builder
  proc setLineBreakConfig*(lineBreakConfig: LineBreakConfig): Builder
  proc setUseBoundsForWidth*(useBoundsForWidth: jboolean): Builder
  proc setShiftDrawingOffsetForStartOverhang*(shiftDrawingOffsetForStartOverhang: jboolean): Builder
  proc setMinimumFontMetrics*(minimumFontMetrics: Paint.FontMetrics): Builder
  proc build*(): DynamicLayout

