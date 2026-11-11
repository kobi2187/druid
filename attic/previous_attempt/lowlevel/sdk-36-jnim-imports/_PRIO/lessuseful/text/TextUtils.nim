import jnim

jclass android.text.TextUtils* of JVMObject:
  proc getEllipsisString*(method: TextUtils.TruncateAt): string {.`static`.}
  proc getChars*(s: CharSequence, start: jint, end: jint, dest: seq[jchar], destoff: jint) {.`static`.}
  proc indexOf*(s: CharSequence, ch: jchar): jint {.`static`.}
  proc indexOf*(s: CharSequence, ch: jchar, start: jint): jint {.`static`.}
  proc indexOf*(s: CharSequence, ch: jchar, start: jint, end: jint): jint {.`static`.}
  proc lastIndexOf*(s: CharSequence, ch: jchar): jint {.`static`.}
  proc lastIndexOf*(s: CharSequence, ch: jchar, last: jint): jint {.`static`.}
  proc lastIndexOf*(s: CharSequence, ch: jchar, start: jint, last: jint): jint {.`static`.}
  proc indexOf*(s: CharSequence, needle: CharSequence): jint {.`static`.}
  proc indexOf*(s: CharSequence, needle: CharSequence, start: jint): jint {.`static`.}
  proc indexOf*(s: CharSequence, needle: CharSequence, start: jint, end: jint): jint {.`static`.}
  proc regionMatches*(one: CharSequence, toffset: jint, two: CharSequence, ooffset: jint, len: jint): jboolean {.`static`.}
  proc substring*(source: CharSequence, start: jint, end: jint): string {.`static`.}
  proc truncateStringForUtf8Storage*(str: string, maxbytes: jint): string {.`static`.}
  proc join*(delimiter: CharSequence, tokens: seq[JObject]): string {.`static`.}
  proc join*(delimiter: CharSequence, tokens: Iterable): string {.`static`.}
  proc split*(text: string, expression: string): seq[string] {.`static`.}
  proc split*(text: string, pattern: Pattern): seq[string] {.`static`.}
  proc stringOrSpannedString*(source: CharSequence): CharSequence {.`static`.}
  proc isEmpty*(str: CharSequence): jboolean {.`static`.}
  proc nullIfEmpty*(str: string): string {.`static`.}
  proc emptyIfNull*(str: string): string {.`static`.}
  proc firstNotEmpty*(a: string, b: string): string {.`static`.}
  proc length*(s: string): jint {.`static`.}
  proc safeIntern*(s: string): string {.`static`.}
  proc getTrimmedLength*(s: CharSequence): jint {.`static`.}
  proc equals*(a: CharSequence, b: CharSequence): jboolean {.`static`.}
  proc getReverse*(source: CharSequence, start: jint, end: jint): CharSequence {.`static`.}
  proc writeToParcel*(cs: CharSequence, p: Parcel, parcelableFlags: jint) {.`static`.}
  proc dumpSpans*(cs: CharSequence, printer: Printer, prefix: string) {.`static`.}
  proc replace*(template: CharSequence, sources: seq[string], destinations: seq[CharSequence]): CharSequence {.`static`.}
  proc expandTemplate*(template: CharSequence, values: CharSequence): CharSequence {.`static`.}
  proc getOffsetBefore*(text: CharSequence, offset: jint): jint {.`static`.}
  proc getOffsetAfter*(text: CharSequence, offset: jint): jint {.`static`.}
  proc copySpansFrom*(source: Spanned, start: jint, end: jint, kind: Class, dest: Spannable, destoff: jint) {.`static`.}
  proc toUpperCase*(locale: Locale, source: CharSequence, copySpans: jboolean): CharSequence {.`static`.}
  proc ellipsize*(text: CharSequence, p: TextPaint, avail: jfloat, where: TruncateAt): CharSequence {.`static`.}
  proc ellipsize*(text: CharSequence, paint: TextPaint, avail: jfloat, where: TruncateAt, preserveLength: jboolean, callback: EllipsizeCallback): CharSequence {.`static`.}
  proc ellipsize*(text: CharSequence, paint: TextPaint, avail: jfloat, where: TruncateAt, preserveLength: jboolean, callback: EllipsizeCallback, textDir: TextDirectionHeuristic, ellipsis: string): CharSequence {.`static`.}
  proc listEllipsize*(context: Context, elements: List[CharSequence], separator: string, paint: TextPaint, avail: jfloat, moreId: jint): CharSequence {.`static`.}
  proc commaEllipsize*(text: CharSequence, p: TextPaint, avail: jfloat, oneMore: string, more: string): CharSequence {.`static`.}
  proc commaEllipsize*(text: CharSequence, p: TextPaint, avail: jfloat, oneMore: string, more: string, textDir: TextDirectionHeuristic): CharSequence {.`static`.}
  proc htmlEncode*(s: string): string {.`static`.}
  proc concat*(text: CharSequence): CharSequence {.`static`.}
  proc isGraphic*(str: CharSequence): jboolean {.`static`.}
  proc isGraphic*(c: jchar): jboolean {.`static`.}
  proc isDigitsOnly*(str: CharSequence): jboolean {.`static`.}
  proc isPrintableAscii*(c: jchar): jboolean {.`static`.}
  proc isPrintableAsciiOnly*(str: CharSequence): jboolean {.`static`.}
  proc getCapsMode*(cs: CharSequence, off: jint, reqModes: jint): jint {.`static`.}
  proc delimitedStringContains*(delimitedString: string, delimiter: jchar, item: string): jboolean {.`static`.}
  proc removeEmptySpans*(spans: seq[T], spanned: Spanned, klass: Class[T]): seq[T] {.`static`.}
  proc packRangeInLong*(start: jint, end: jint): jlong {.`static`.}
  proc unpackRangeStartFromLong*(range: jlong): jint {.`static`.}
  proc unpackRangeEndFromLong*(range: jlong): jint {.`static`.}
  proc getLayoutDirectionFromLocale*(locale: Locale): jint {.`static`.}
  proc formatSimple*(format: string, args: JObject): string {.`static`.}
  proc hasStyleSpan*(spanned: Spanned): jboolean {.`static`.}
  proc trimNoCopySpans*(charSequence: CharSequence): CharSequence {.`static`.}
  proc wrap*(builder: StringBuilder, start: string, end: string) {.`static`.}
  proc trimToParcelableSize*(text: T): T {.`static`.}
  proc trimToSize*(text: T, size: jint): T {.`static`.}
  proc trimToLengthWithEllipsis*(text: T, size: jint): T {.`static`.}
  proc isNewline*(codePoint: jint): jboolean {.`static`.}
  proc isWhitespace*(codePoint: jint): jboolean {.`static`.}
  proc isWhitespaceExceptNewline*(codePoint: jint): jboolean {.`static`.}
  proc isPunctuation*(codePoint: jint): jboolean {.`static`.}
  proc withoutPrefix*(prefix: string, str: string): string {.`static`.}
  proc makeSafeForPresentation*(unclean: string, maxCharactersToConsider: jint, ellipsizeDip: jfloat, flags: jint): CharSequence {.`static`.}
  LINE_FEED_CODE_POINT*: jint {.`static`.}
  SAFE_STRING_FLAG_TRIM*: jint {.`static`.}
  SAFE_STRING_FLAG_SINGLE_LINE*: jint {.`static`.}
  SAFE_STRING_FLAG_FIRST_LINE*: jint {.`static`.}
  ALIGNMENT_SPAN*: jint {.`static`.}
  FIRST_SPAN*: jint {.`static`.}
  FOREGROUND_COLOR_SPAN*: jint {.`static`.}
  RELATIVE_SIZE_SPAN*: jint {.`static`.}
  SCALE_X_SPAN*: jint {.`static`.}
  STRIKETHROUGH_SPAN*: jint {.`static`.}
  UNDERLINE_SPAN*: jint {.`static`.}
  STYLE_SPAN*: jint {.`static`.}
  BULLET_SPAN*: jint {.`static`.}
  QUOTE_SPAN*: jint {.`static`.}
  LEADING_MARGIN_SPAN*: jint {.`static`.}
  URL_SPAN*: jint {.`static`.}
  BACKGROUND_COLOR_SPAN*: jint {.`static`.}
  TYPEFACE_SPAN*: jint {.`static`.}
  SUPERSCRIPT_SPAN*: jint {.`static`.}
  SUBSCRIPT_SPAN*: jint {.`static`.}
  ABSOLUTE_SIZE_SPAN*: jint {.`static`.}
  TEXT_APPEARANCE_SPAN*: jint {.`static`.}
  ANNOTATION*: jint {.`static`.}
  SUGGESTION_SPAN*: jint {.`static`.}
  SPELL_CHECK_SPAN*: jint {.`static`.}
  SUGGESTION_RANGE_SPAN*: jint {.`static`.}
  EASY_EDIT_SPAN*: jint {.`static`.}
  LOCALE_SPAN*: jint {.`static`.}
  TTS_SPAN*: jint {.`static`.}
  ACCESSIBILITY_CLICKABLE_SPAN*: jint {.`static`.}
  ACCESSIBILITY_URL_SPAN*: jint {.`static`.}
  LINE_BACKGROUND_SPAN*: jint {.`static`.}
  LINE_HEIGHT_SPAN*: jint {.`static`.}
  ACCESSIBILITY_REPLACEMENT_SPAN*: jint {.`static`.}
  LINE_BREAK_CONFIG_SPAN*: jint {.`static`.}
  NO_WRITING_TOOLS_SPAN*: jint {.`static`.}
  LAST_SPAN*: jint {.`static`.}
  CHAR_SEQUENCE_CREATOR*: Parcelable.Creator[CharSequence] {.`static`.}
  CAP_MODE_CHARACTERS*: jint {.`static`.}
  CAP_MODE_WORDS*: jint {.`static`.}
  CAP_MODE_SENTENCES*: jint {.`static`.}

jclass android.text.TextUtils.StringSplitter* of JVMObject:
  proc setString*(string: string)

jclass android.text.TextUtils.SimpleStringSplitter* of JVMObject:
  proc setString*(string: string)
  proc iterator*(): Iterator[string]
  proc hasNext*(): jboolean
  proc next*(): string
  proc remove*()

jclass android.text.TextUtils.EllipsizeCallback* of JVMObject:
  proc ellipsized*(start: jint, end: jint)

jclass android.text.StringSplitter* of Iterable:
  proc setString*(string: string)

jclass android.text.SimpleStringSplitter* of JVMObject:
  proc setString*(string: string)
  proc iterator*(): Iterator[string]
  proc hasNext*(): jboolean
  proc next*(): string
  proc remove*()

jclass android.text.EllipsizeCallback* of JVMObject:
  proc ellipsized*(start: jint, end: jint)

