import jnim

jclass android.text.SpannedString* of SpannableStringInternal:
  proc subSequence*(start: jint, end: jint): CharSequence
  proc valueOf*(source: CharSequence): SpannedString {.`static`.}

