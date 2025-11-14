import jnim

jclass android.text.Html* of JVMObject:
  proc fromHtml*(source: string): Spanned {.`static`.}
  proc fromHtml*(source: string, flags: jint): Spanned {.`static`.}
  proc fromHtml*(source: string, imageGetter: ImageGetter, tagHandler: TagHandler): Spanned {.`static`.}
  proc fromHtml*(source: string, flags: jint, imageGetter: ImageGetter, tagHandler: TagHandler): Spanned {.`static`.}
  proc toHtml*(text: Spanned): string {.`static`.}
  proc toHtml*(text: Spanned, option: jint): string {.`static`.}
  proc escapeHtml*(text: CharSequence): string {.`static`.}
  TO_HTML_PARAGRAPH_LINES_CONSECUTIVE*: jint {.`static`.}
  TO_HTML_PARAGRAPH_LINES_INDIVIDUAL*: jint {.`static`.}
  FROM_HTML_SEPARATOR_LINE_BREAK_PARAGRAPH*: jint {.`static`.}
  FROM_HTML_SEPARATOR_LINE_BREAK_HEADING*: jint {.`static`.}
  FROM_HTML_SEPARATOR_LINE_BREAK_LIST_ITEM*: jint {.`static`.}
  FROM_HTML_SEPARATOR_LINE_BREAK_LIST*: jint {.`static`.}
  FROM_HTML_SEPARATOR_LINE_BREAK_DIV*: jint {.`static`.}
  FROM_HTML_SEPARATOR_LINE_BREAK_BLOCKQUOTE*: jint {.`static`.}
  FROM_HTML_OPTION_USE_CSS_COLORS*: jint {.`static`.}
  FROM_HTML_MODE_LEGACY*: jint {.`static`.}
  FROM_HTML_MODE_COMPACT*: jint {.`static`.}

jclass android.text.Html.ImageGetter* of JVMObject:
  proc getDrawable*(source: string): Drawable

jclass android.text.Html.TagHandler* of JVMObject:
  proc handleTag*(opening: jboolean, tag: string, output: Editable, xmlReader: XMLReader)

jclass android.text.ImageGetter* of JVMObject:
  proc getDrawable*(source: string): Drawable

jclass android.text.TagHandler* of JVMObject:
  proc handleTag*(opening: jboolean, tag: string, output: Editable, xmlReader: XMLReader)

