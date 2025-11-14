import jnim

jclass android.text.SegmentFinder* of JVMObject:
  proc previousStartBoundary*(offset: jint): jint
  proc previousEndBoundary*(offset: jint): jint
  proc nextStartBoundary*(offset: jint): jint
  proc nextEndBoundary*(offset: jint): jint
  DONE*: jint {.`static`.}

jclass android.text.SegmentFinder.PrescribedSegmentFinder* of JVMObject:
  proc previousStartBoundary*(offset: jint): jint
  proc previousEndBoundary*(offset: jint): jint
  proc nextStartBoundary*(offset: jint): jint
  proc nextEndBoundary*(offset: jint): jint

jclass android.text.PrescribedSegmentFinder* of SegmentFinder:
  proc previousStartBoundary*(offset: jint): jint
  proc previousEndBoundary*(offset: jint): jint
  proc nextStartBoundary*(offset: jint): jint
  proc nextEndBoundary*(offset: jint): jint

