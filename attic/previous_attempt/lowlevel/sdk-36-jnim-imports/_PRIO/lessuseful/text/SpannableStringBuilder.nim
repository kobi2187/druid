import jnim

jclass android.text.SpannableStringBuilder* of JVMObject:
  proc valueOf*(source: CharSequence): SpannableStringBuilder {.`static`.}
  proc charAt*(where: jint): jchar
  proc length*(): jint
  proc insert*(where: jint, tb: CharSequence, start: jint, end: jint): SpannableStringBuilder
  proc insert*(where: jint, tb: CharSequence): SpannableStringBuilder
  proc delete*(start: jint, end: jint): SpannableStringBuilder
  proc clear*()
  proc clearSpans*()
  proc append*(text: CharSequence): SpannableStringBuilder
  proc append*(text: CharSequence, what: JObject, flags: jint): SpannableStringBuilder
  proc append*(text: CharSequence, start: jint, end: jint): SpannableStringBuilder
  proc append*(text: jchar): SpannableStringBuilder
  proc replace*(start: jint, end: jint, tb: CharSequence): SpannableStringBuilder
  proc replace*(start: jint, end: jint, tb: CharSequence, tbstart: jint, tbend: jint): SpannableStringBuilder
  proc setSpan*(what: JObject, start: jint, end: jint, flags: jint)
  proc removeSpan*(what: JObject)
  proc removeSpan*(what: JObject, flags: jint)
  proc getSpanStart*(what: JObject): jint
  proc getSpanEnd*(what: JObject): jint
  proc getSpanFlags*(what: JObject): jint
  proc getSpans*(queryStart: jint, queryEnd: jint, kind: Class[T]): seq[T]
  proc getSpans*(queryStart: jint, queryEnd: jint, kind: Class[T], sortByInsertionOrder: jboolean): seq[T]
  proc nextSpanTransition*(start: jint, limit: jint, kind: Class): jint
  proc subSequence*(start: jint, end: jint): CharSequence
  proc getChars*(start: jint, end: jint, dest: seq[jchar], destoff: jint)
  proc toString*(): string
  proc substring*(start: jint, end: jint): string
  proc getTextWatcherDepth*(): jint
  proc drawText*(c: BaseCanvas, start: jint, end: jint, x: jfloat, y: jfloat, p: Paint)
  proc drawTextRun*(c: BaseCanvas, start: jint, end: jint, contextStart: jint, contextEnd: jint, x: jfloat, y: jfloat, isRtl: jboolean, p: Paint)
  proc measureText*(start: jint, end: jint, p: Paint): jfloat
  proc getTextWidths*(start: jint, end: jint, widths: seq[jfloat], p: Paint): jint
  proc getTextRunAdvances*(start: jint, end: jint, contextStart: jint, contextEnd: jint, isRtl: jboolean, advances: seq[jfloat], advancesPos: jint, p: Paint): jfloat
  proc getTextRunCursor*(contextStart: jint, contextEnd: jint, dir: jint, offset: jint, cursorOpt: jint, p: Paint): jint
  proc getTextRunCursor*(contextStart: jint, contextEnd: jint, isRtl: jboolean, offset: jint, cursorOpt: jint, p: Paint): jint
  proc setFilters*(filters: seq[InputFilter])
  proc getFilters*(): seq[InputFilter]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

