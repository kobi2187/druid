import jnim

jclass android.text.TextShaper* of JVMObject:
  proc shapeText*(text: CharSequence, start: jint, count: jint, dir: TextDirectionHeuristic, paint: TextPaint, consumer: GlyphsConsumer) {.`static`.}

