import jnim

jclass android.text.Spanned* of CharSequence:
  proc getSpans*(start: jint, end: jint, type: Class[T]): seq[T]
  proc getSpanStart*(tag: JObject): jint
  proc getSpanEnd*(tag: JObject): jint
  proc getSpanFlags*(tag: JObject): jint
  proc nextSpanTransition*(start: jint, limit: jint, type: Class): jint
  SPAN_POINT_MARK_MASK*: jint {.`static`.}
  SPAN_MARK_MARK*: jint {.`static`.}
  SPAN_MARK_POINT*: jint {.`static`.}
  SPAN_POINT_MARK*: jint {.`static`.}
  SPAN_POINT_POINT*: jint {.`static`.}
  SPAN_PARAGRAPH*: jint {.`static`.}
  SPAN_INCLUSIVE_EXCLUSIVE*: jint {.`static`.}
  SPAN_INCLUSIVE_INCLUSIVE*: jint {.`static`.}
  SPAN_EXCLUSIVE_EXCLUSIVE*: jint {.`static`.}
  SPAN_EXCLUSIVE_INCLUSIVE*: jint {.`static`.}
  SPAN_COMPOSING*: jint {.`static`.}
  SPAN_INTERMEDIATE*: jint {.`static`.}
  SPAN_USER_SHIFT*: jint {.`static`.}
  SPAN_USER*: jint {.`static`.}
  SPAN_PRIORITY_SHIFT*: jint {.`static`.}
  SPAN_PRIORITY*: jint {.`static`.}

