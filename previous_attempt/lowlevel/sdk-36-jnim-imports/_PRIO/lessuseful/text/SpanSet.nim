import jnim

jclass android.text.SpanSet* of JVMObject:
  proc init*(spanned: Spanned, start: jint, limit: jint)
  proc hasSpansIntersecting*(start: jint, end: jint): jboolean
  proc recycle*()

