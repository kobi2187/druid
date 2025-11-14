import jnim

jclass android.view.AccessibilityIterators.TextSegmentIterator* of JVMObject:
  proc following*(current: jint): seq[jint]
  proc preceding*(current: jint): seq[jint]

jclass android.view.AccessibilityIterators.AbstractTextSegmentIterator* of JVMObject:
  proc initialize*(text: string)

jclass android.view.TextSegmentIterator* of JVMObject:
  proc following*(current: jint): seq[jint]
  proc preceding*(current: jint): seq[jint]

jclass android.view.AbstractTextSegmentIterator* of JVMObject:
  proc initialize*(text: string)

