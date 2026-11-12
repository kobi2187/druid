import jnim

jclass android.graphics.Paint* of JVMObject:
  proc reset*()
  proc set*(src: Paint)
  proc setCompatibilityScaling*(factor: jfloat)
  proc getNativeInstance*(): jlong
  proc getBidiFlags*(): jint
  proc setBidiFlags*(flags: jint)
  proc getFlags*(): jint
  proc setFlags*(flags: jint)
  proc getHinting*(): jint
  proc setHinting*(mode: jint)
  proc isAntiAlias*(): jboolean
  proc setAntiAlias*(aa: jboolean)
  proc isDither*(): jboolean
  proc setDither*(dither: jboolean)
  proc isLinearText*(): jboolean
  proc setLinearText*(linearText: jboolean)
  proc isSubpixelText*(): jboolean
  proc setSubpixelText*(subpixelText: jboolean)
  proc isUnderlineText*(): jboolean
  proc getUnderlinePosition*(): jfloat
  proc getUnderlineThickness*(): jfloat
  proc setUnderlineText*(underlineText: jboolean)
  proc isStrikeThruText*(): jboolean
  proc getStrikeThruPosition*(): jfloat
  proc getStrikeThruThickness*(): jfloat
  proc setStrikeThruText*(strikeThruText: jboolean)
  proc isFakeBoldText*(): jboolean
  proc setFakeBoldText*(fakeBoldText: jboolean)
  proc isFilterBitmap*(): jboolean
  proc setFilterBitmap*(filter: jboolean)
  proc getStyle*(): Style
  proc setStyle*(style: Style)
  proc getColor*(): jint
  proc getColorLong*(): jlong
  proc setColor*(color: jint)
  proc setColor*(color: jlong)
  proc getAlpha*(): jint
  proc setAlpha*(a: jint)
  proc setARGB*(a: jint, r: jint, g: jint, b: jint)
  proc getStrokeWidth*(): jfloat
  proc setStrokeWidth*(width: jfloat)
  proc getStrokeMiter*(): jfloat
  proc setStrokeMiter*(miter: jfloat)
  proc getStrokeCap*(): Cap
  proc setStrokeCap*(cap: Cap)
  proc getStrokeJoin*(): Join
  proc setStrokeJoin*(join: Join)
  proc getFillPath*(src: Path, dst: Path): jboolean
  proc getShader*(): Shader
  proc setShader*(shader: Shader): Shader
  proc getColorFilter*(): ColorFilter
  proc setColorFilter*(filter: ColorFilter): ColorFilter
  proc getXfermode*(): Xfermode
  proc getBlendMode*(): BlendMode
  proc setXfermode*(xfermode: Xfermode): Xfermode
  proc setBlendMode*(blendmode: BlendMode)
  proc getPathEffect*(): PathEffect
  proc setPathEffect*(effect: PathEffect): PathEffect
  proc getMaskFilter*(): MaskFilter
  proc setMaskFilter*(maskfilter: MaskFilter): MaskFilter
  proc getTypeface*(): Typeface
  proc setTypeface*(typeface: Typeface): Typeface
  proc getRasterizer*(): Rasterizer
  proc setRasterizer*(rasterizer: Rasterizer): Rasterizer
  proc setShadowLayer*(radius: jfloat, dx: jfloat, dy: jfloat, shadowColor: jint)
  proc setShadowLayer*(radius: jfloat, dx: jfloat, dy: jfloat, shadowColor: jlong)
  proc clearShadowLayer*()
  proc hasShadowLayer*(): jboolean
  proc getShadowLayerRadius*(): jfloat
  proc getShadowLayerDx*(): jfloat
  proc getShadowLayerDy*(): jfloat
  proc getShadowLayerColor*(): jint
  proc getShadowLayerColorLong*(): jlong
  proc getTextAlign*(): Align
  proc setTextAlign*(align: Align)
  proc getTextLocale*(): Locale
  proc getTextLocales*(): LocaleList
  proc setTextLocale*(locale: Locale)
  proc setTextLocales*(locales: LocaleList)
  proc isElegantTextHeight*(): jboolean
  proc setElegantTextHeight*(elegant: jboolean)
  proc getTextSize*(): jfloat
  proc setTextSize*(textSize: jfloat)
  proc getTextScaleX*(): jfloat
  proc setTextScaleX*(scaleX: jfloat)
  proc getTextSkewX*(): jfloat
  proc setTextSkewX*(skewX: jfloat)
  proc getLetterSpacing*(): jfloat
  proc setLetterSpacing*(letterSpacing: jfloat)
  proc getWordSpacing*(): jfloat
  proc setWordSpacing*(wordSpacing: jfloat)
  proc getFontFeatureSettings*(): string
  proc setFontFeatureSettings*(settings: string)
  proc getFontVariationSettings*(): string
  proc setFontVariationSettings*(fontVariationSettings: string): jboolean
  proc setFontVariationOverride*(fontVariationOverride: string)
  proc getFontVariationOverride*(): string
  proc getStartHyphenEdit*(): jint
  proc getEndHyphenEdit*(): jint
  proc setStartHyphenEdit*(startHyphen: jint)
  proc setEndHyphenEdit*(endHyphen: jint)
  proc ascent*(): jfloat
  proc descent*(): jfloat
  proc getFontMetrics*(metrics: FontMetrics): jfloat
  proc getFontMetrics*(): FontMetrics
  proc getFontMetricsForLocale*(metrics: FontMetrics)
  proc getFontMetricsInt*(text: CharSequence, start: jint, count: jint, contextStart: jint, contextCount: jint, isRtl: jboolean, outMetrics: FontMetricsInt)
  proc getFontMetricsInt*(text: seq[jchar], start: jint, count: jint, contextStart: jint, contextCount: jint, isRtl: jboolean, outMetrics: FontMetricsInt)
  proc getFontMetricsInt*(fmi: FontMetricsInt): jint
  proc getFontMetricsInt*(): FontMetricsInt
  proc getFontMetricsIntForLocale*(metrics: FontMetricsInt)
  proc getFontSpacing*(): jfloat
  proc measureText*(text: seq[jchar], index: jint, count: jint): jfloat
  proc measureText*(text: string, start: jint, end: jint): jfloat
  proc measureText*(text: string): jfloat
  proc measureText*(text: CharSequence, start: jint, end: jint): jfloat
  proc breakText*(text: seq[jchar], index: jint, count: jint, maxWidth: jfloat, measuredWidth: seq[jfloat]): jint
  proc breakText*(text: CharSequence, start: jint, end: jint, measureForwards: jboolean, maxWidth: jfloat, measuredWidth: seq[jfloat]): jint
  proc breakText*(text: string, measureForwards: jboolean, maxWidth: jfloat, measuredWidth: seq[jfloat]): jint
  proc getTextWidths*(text: seq[jchar], index: jint, count: jint, widths: seq[jfloat]): jint
  proc getTextWidths*(text: CharSequence, start: jint, end: jint, widths: seq[jfloat]): jint
  proc getTextWidths*(text: string, start: jint, end: jint, widths: seq[jfloat]): jint
  proc getTextWidths*(text: string, widths: seq[jfloat]): jint
  proc getTextRunAdvances*(chars: seq[jchar], index: jint, count: jint, contextIndex: jint, contextCount: jint, isRtl: jboolean, advances: seq[jfloat], advancesIndex: jint): jfloat
  proc getTextRunCursor*(text: seq[jchar], contextStart: jint, contextLength: jint, isRtl: jboolean, offset: jint, cursorOpt: jint): jint
  proc getTextRunCursor*(text: CharSequence, contextStart: jint, contextEnd: jint, isRtl: jboolean, offset: jint, cursorOpt: jint): jint
  proc getTextRunCursor*(text: string, contextStart: jint, contextEnd: jint, isRtl: jboolean, offset: jint, cursorOpt: jint): jint
  proc getTextPath*(text: seq[jchar], index: jint, count: jint, x: jfloat, y: jfloat, path: Path)
  proc getTextPath*(text: string, start: jint, end: jint, x: jfloat, y: jfloat, path: Path)
  proc getTextBounds*(text: string, start: jint, end: jint, bounds: Rect)
  proc getTextBounds*(text: CharSequence, start: jint, end: jint, bounds: Rect)
  proc getTextBounds*(text: seq[jchar], index: jint, count: jint, bounds: Rect)
  proc hasGlyph*(string: string): jboolean
  proc getRunAdvance*(text: seq[jchar], start: jint, end: jint, contextStart: jint, contextEnd: jint, isRtl: jboolean, offset: jint): jfloat
  proc getRunAdvance*(text: CharSequence, start: jint, end: jint, contextStart: jint, contextEnd: jint, isRtl: jboolean, offset: jint): jfloat
  proc getRunCharacterAdvance*(text: seq[jchar], start: jint, end: jint, contextStart: jint, contextEnd: jint, isRtl: jboolean, offset: jint, advances: seq[jfloat], advancesIndex: jint): jfloat
  proc getRunCharacterAdvance*(text: seq[jchar], start: jint, end: jint, contextStart: jint, contextEnd: jint, isRtl: jboolean, offset: jint, advances: seq[jfloat], advancesIndex: jint, drawBounds: RectF, runInfo: RunInfo): jfloat
  proc getRunCharacterAdvance*(text: CharSequence, start: jint, end: jint, contextStart: jint, contextEnd: jint, isRtl: jboolean, offset: jint, advances: seq[jfloat], advancesIndex: jint): jfloat
  proc getRunCharacterAdvance*(text: CharSequence, start: jint, end: jint, contextStart: jint, contextEnd: jint, isRtl: jboolean, offset: jint, advances: seq[jfloat], advancesIndex: jint, drawBounds: RectF, runInfo: RunInfo): jfloat
  proc getOffsetForAdvance*(text: seq[jchar], start: jint, end: jint, contextStart: jint, contextEnd: jint, isRtl: jboolean, advance: jfloat): jint
  proc getOffsetForAdvance*(text: CharSequence, start: jint, end: jint, contextStart: jint, contextEnd: jint, isRtl: jboolean, advance: jfloat): jint
  proc equalsForTextMeasurement*(other: Paint): jboolean
  mBidiFlags*: jint
  ANTI_ALIAS_FLAG*: jint {.`static`.}
  FILTER_BITMAP_FLAG*: jint {.`static`.}
  DITHER_FLAG*: jint {.`static`.}
  UNDERLINE_TEXT_FLAG*: jint {.`static`.}
  STRIKE_THRU_TEXT_FLAG*: jint {.`static`.}
  FAKE_BOLD_TEXT_FLAG*: jint {.`static`.}
  LINEAR_TEXT_FLAG*: jint {.`static`.}
  SUBPIXEL_TEXT_FLAG*: jint {.`static`.}
  DEV_KERN_TEXT_FLAG*: jint {.`static`.}
  LCD_RENDER_TEXT_FLAG*: jint {.`static`.}
  EMBEDDED_BITMAP_TEXT_FLAG*: jint {.`static`.}
  AUTO_HINTING_TEXT_FLAG*: jint {.`static`.}
  VERTICAL_TEXT_FLAG*: jint {.`static`.}
  TEXT_RUN_FLAG_LEFT_EDGE*: jint {.`static`.}
  TEXT_RUN_FLAG_RIGHT_EDGE*: jint {.`static`.}
  HINTING_OFF*: jint {.`static`.}
  HINTING_ON*: jint {.`static`.}
  BIDI_LTR*: jint {.`static`.}
  BIDI_RTL*: jint {.`static`.}
  BIDI_DEFAULT_LTR*: jint {.`static`.}
  BIDI_DEFAULT_RTL*: jint {.`static`.}
  BIDI_FORCE_LTR*: jint {.`static`.}
  BIDI_FORCE_RTL*: jint {.`static`.}
  DIRECTION_LTR*: jint {.`static`.}
  DIRECTION_RTL*: jint {.`static`.}
  CURSOR_AFTER*: jint {.`static`.}
  CURSOR_AT_OR_AFTER*: jint {.`static`.}
  CURSOR_BEFORE*: jint {.`static`.}
  CURSOR_AT_OR_BEFORE*: jint {.`static`.}
  CURSOR_AT*: jint {.`static`.}
  START_HYPHEN_EDIT_NO_EDIT*: jint {.`static`.}
  START_HYPHEN_EDIT_INSERT_HYPHEN*: jint {.`static`.}
  START_HYPHEN_EDIT_INSERT_ZWJ*: jint {.`static`.}
  END_HYPHEN_EDIT_NO_EDIT*: jint {.`static`.}
  END_HYPHEN_EDIT_REPLACE_WITH_HYPHEN*: jint {.`static`.}
  END_HYPHEN_EDIT_INSERT_HYPHEN*: jint {.`static`.}
  END_HYPHEN_EDIT_INSERT_ARMENIAN_HYPHEN*: jint {.`static`.}
  END_HYPHEN_EDIT_INSERT_MAQAF*: jint {.`static`.}
  END_HYPHEN_EDIT_INSERT_UCAS_HYPHEN*: jint {.`static`.}
  END_HYPHEN_EDIT_INSERT_ZWJ_AND_HYPHEN*: jint {.`static`.}
  DEPRECATE_UI_FONT*: jlong {.`static`.}
  DEPRECATE_UI_FONT_ENFORCE*: jlong {.`static`.}

jclass android.graphics.Paint.FontMetrics* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.graphics.Paint.FontMetricsInt* of JVMObject:
  proc set*(fontMetricsInt: FontMetricsInt)
  proc set*(fontMetrics: FontMetrics)
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.graphics.Paint.RunInfo* of JVMObject:
  proc getClusterCount*(): jint
  proc setClusterCount*(clusterCount: jint)

jclass android.graphics.FontMetrics* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  top*: jfloat
  ascent*: jfloat
  descent*: jfloat
  bottom*: jfloat
  leading*: jfloat

jclass android.graphics.FontMetricsInt* of JVMObject:
  proc set*(fontMetricsInt: FontMetricsInt)
  proc set*(fontMetrics: FontMetrics)
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  top*: jint
  ascent*: jint
  descent*: jint
  bottom*: jint
  leading*: jint

jclass android.graphics.RunInfo* of JVMObject:
  proc getClusterCount*(): jint
  proc setClusterCount*(clusterCount: jint)

