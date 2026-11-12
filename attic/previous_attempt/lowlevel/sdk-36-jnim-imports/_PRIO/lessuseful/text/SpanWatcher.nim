import jnim

jclass android.text.SpanWatcher* of NoCopySpan:
  proc onSpanAdded*(text: Spannable, what: JObject, start: jint, end: jint)
  proc onSpanRemoved*(text: Spannable, what: JObject, start: jint, end: jint)
  proc onSpanChanged*(text: Spannable, what: JObject, ostart: jint, oend: jint, nstart: jint, nend: jint)

