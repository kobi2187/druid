import jnim

jclass android.text.BidiFormatter* of JVMObject:
  proc getInstance*(): BidiFormatter {.`static`.}
  proc getInstance*(rtlContext: jboolean): BidiFormatter {.`static`.}
  proc getInstance*(locale: Locale): BidiFormatter {.`static`.}
  proc isRtlContext*(): jboolean
  proc getStereoReset*(): jboolean
  proc markAfter*(str: CharSequence, heuristic: TextDirectionHeuristic): string
  proc markBefore*(str: CharSequence, heuristic: TextDirectionHeuristic): string
  proc isRtl*(str: string): jboolean
  proc isRtl*(str: CharSequence): jboolean
  proc unicodeWrap*(str: string, heuristic: TextDirectionHeuristic, isolate: jboolean): string
  proc unicodeWrap*(str: CharSequence, heuristic: TextDirectionHeuristic, isolate: jboolean): CharSequence
  proc unicodeWrap*(str: string, heuristic: TextDirectionHeuristic): string
  proc unicodeWrap*(str: CharSequence, heuristic: TextDirectionHeuristic): CharSequence
  proc unicodeWrap*(str: string, isolate: jboolean): string
  proc unicodeWrap*(str: CharSequence, isolate: jboolean): CharSequence
  proc unicodeWrap*(str: string): string
  proc unicodeWrap*(str: CharSequence): CharSequence

jclass android.text.BidiFormatter.Builder* of JVMObject:
  proc stereoReset*(stereoReset: jboolean): Builder
  proc setTextDirectionHeuristic*(heuristic: TextDirectionHeuristic): Builder
  proc build*(): BidiFormatter

jclass android.text.BidiFormatter.DirectionalityEstimator* of JVMObject:
  proc getDirectionality*(codePoint: jint): jbyte {.`static`.}

jclass android.text.Builder* of JVMObject:
  proc stereoReset*(stereoReset: jboolean): Builder
  proc setTextDirectionHeuristic*(heuristic: TextDirectionHeuristic): Builder
  proc build*(): BidiFormatter

jclass android.text.DirectionalityEstimator* of JVMObject:
  proc getDirectionality*(codePoint: jint): jbyte {.`static`.}

