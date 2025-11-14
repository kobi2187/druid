import jnim

jclass android.text.Highlights* of JVMObject:
  proc getSize*(): jint
  proc getPaint*(index: jint): Paint
  proc getRanges*(index: jint): seq[jint]

jclass android.text.Highlights.Builder* of JVMObject:
  proc addRange*(paint: Paint, start: jint, end: jint): Builder
  proc addRanges*(paint: Paint, ranges: jint): Builder
  proc build*(): Highlights

jclass android.text.Builder* of JVMObject:
  proc addRange*(paint: Paint, start: jint, end: jint): Builder
  proc addRanges*(paint: Paint, ranges: jint): Builder
  proc build*(): Highlights

