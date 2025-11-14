import jnim

jclass android.text.SpannableString* of SpannableStringInternal:
  proc valueOf*(source: CharSequence): SpannableString {.`static`.}
  proc setSpan*(what: JObject, start: jint, end: jint, flags: jint)
  proc removeSpan*(what: JObject)
  proc subSequence*(start: jint, end: jint): CharSequence

