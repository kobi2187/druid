import jnim

jclass android.text.PrecomputedText* of JVMObject:
  proc create*(text: CharSequence, params: Params): PrecomputedText {.`static`.}
  proc createMeasuredParagraphs*(text: CharSequence, params: Params, start: jint, end: jint, computeLayout: jboolean, computeBounds: jboolean): seq[ParagraphInfo] {.`static`.}
  proc getText*(): CharSequence
  proc getStart*(): jint
  proc getEnd*(): jint
  proc getParams*(): Params
  proc getParagraphCount*(): jint
  proc getParagraphStart*(paraIndex: jint): jint
  proc getParagraphEnd*(paraIndex: jint): jint
  proc getMeasuredParagraph*(paraIndex: jint): MeasuredParagraph
  proc getParagraphInfo*(): seq[ParagraphInfo]
  proc checkResultUsable*(start: jint, end: jint, textDir: TextDirectionHeuristic, paint: TextPaint, strategy: jint, frequency: jint, lbConfig: LineBreakConfig): jint
  proc findParaIndex*(pos: jint): jint
  proc getWidth*(start: jint, end: jint): jfloat
  proc getBounds*(start: jint, end: jint, bounds: Rect)
  proc getFontMetricsInt*(start: jint, end: jint, outMetrics: Paint.FontMetricsInt)
  proc getCharWidthAt*(offset: jint): jfloat
  proc getMemoryUsage*(): jint
  proc setSpan*(what: JObject, start: jint, end: jint, flags: jint)
  proc removeSpan*(what: JObject)
  proc getSpans*(start: jint, end: jint, type: Class[T]): seq[T]
  proc getSpanStart*(tag: JObject): jint
  proc getSpanEnd*(tag: JObject): jint
  proc getSpanFlags*(tag: JObject): jint
  proc nextSpanTransition*(start: jint, limit: jint, type: Class): jint
  proc length*(): jint
  proc charAt*(index: jint): jchar
  proc subSequence*(start: jint, end: jint): CharSequence
  proc toString*(): string

jclass android.text.PrecomputedText.Params* of JVMObject:
  proc getTextPaint*(): TextPaint
  proc getTextDirection*(): TextDirectionHeuristic
  proc getBreakStrategy*(): jint
  proc getHyphenationFrequency*(): jint
  proc getLineBreakConfig*(): LineBreakConfig
  proc checkResultUsable*(paint: TextPaint, textDir: TextDirectionHeuristic, strategy: jint, frequency: jint, lbConfig: LineBreakConfig): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.text.Params* of JVMObject:
  proc getTextPaint*(): TextPaint
  proc getTextDirection*(): TextDirectionHeuristic
  proc getBreakStrategy*(): jint
  proc getHyphenationFrequency*(): jint
  proc getLineBreakConfig*(): LineBreakConfig
  proc checkResultUsable*(paint: TextPaint, textDir: TextDirectionHeuristic, strategy: jint, frequency: jint, lbConfig: LineBreakConfig): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  UNUSABLE*: jint {.`static`.}
  NEED_RECOMPUTE*: jint {.`static`.}
  USABLE*: jint {.`static`.}

jclass android.text.Params.Builder* of JVMObject:
  proc setBreakStrategy*(strategy: jint): Builder
  proc setHyphenationFrequency*(frequency: jint): Builder
  proc setTextDirection*(textDir: TextDirectionHeuristic): Builder
  proc setLineBreakConfig*(lineBreakConfig: LineBreakConfig): Builder
  proc build*(): Params

jclass android.text.Builder* of JVMObject:
  proc setBreakStrategy*(strategy: jint): Builder
  proc setHyphenationFrequency*(frequency: jint): Builder
  proc setTextDirection*(textDir: TextDirectionHeuristic): Builder
  proc setLineBreakConfig*(lineBreakConfig: LineBreakConfig): Builder
  proc build*(): Params

jclass android.text.ParagraphInfo* of JVMObject:
  paragraphEnd*: jint
  measured*: MeasuredParagraph

