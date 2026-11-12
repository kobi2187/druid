import jnim

jclass android.text.TextLine* of JVMObject:
  proc getAddedWordSpacingInPx*(): jfloat
  proc getAddedLetterSpacingInPx*(): jfloat
  proc isJustifying*(): jboolean
  proc obtain*(): TextLine {.`static`.}
  proc recycle*(tl: TextLine): TextLine {.`static`.}
  proc set*(paint: TextPaint, text: CharSequence, start: jint, limit: jint, dir: jint, directions: Directions, hasTabs: jboolean, tabStops: TabStops, ellipsisStart: jint, ellipsisEnd: jint, useFallbackLineSpacing: jboolean)
  proc justify*(justificationMode: jint, justifyWidth: jfloat)
  proc calculateRunFlag*(bidiRunIndex: jint, bidiRunCount: jint, lineDirection: jint): jint {.`static`.}
  proc resolveRunFlagForSubSequence*(runFlag: jint, isRtlRun: jboolean, runStart: jint, runEnd: jint, spanStart: jint, spanEnd: jint): jint {.`static`.}
  proc metrics*(fmi: FontMetricsInt, drawBounds: RectF, returnDrawWidth: jboolean, lineInfo: LineInfo): jfloat
  proc measure*(offset: jint, trailing: jboolean, fmi: FontMetricsInt, drawBounds: RectF, lineInfo: LineInfo): jfloat
  proc measureAllBounds*(bounds: seq[jfloat], advances: seq[jfloat])
  proc measureAllOffsets*(trailing: seq[jboolean], fmi: FontMetricsInt): seq[jfloat]
  proc isLineEndSpace*(ch: jchar): jboolean {.`static`.}

jclass android.text.TextLine.LineInfo* of JVMObject:
  proc getClusterCount*(): jint
  proc setClusterCount*(clusterCount: jint)

jclass android.text.LineInfo* of JVMObject:
  proc getClusterCount*(): jint
  proc setClusterCount*(clusterCount: jint)

