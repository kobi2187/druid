import jnim

jclass android.text.Spannable* of Spanned:
  proc setSpan*(what: JObject, start: jint, end: jint, flags: jint)
  proc removeSpan*(what: JObject)

jclass android.text.Spannable.Factory* of JVMObject:
  proc getInstance*(): Spannable.Factory {.`static`.}
  proc newSpannable*(source: CharSequence): Spannable

jclass android.text.Factory* of JVMObject:
  proc getInstance*(): Spannable.Factory {.`static`.}
  proc newSpannable*(source: CharSequence): Spannable

