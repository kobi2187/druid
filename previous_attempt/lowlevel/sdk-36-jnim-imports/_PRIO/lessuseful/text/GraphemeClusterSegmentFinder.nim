import jnim

jclass android.text.GraphemeClusterSegmentFinder* of SegmentFinder:
  proc previousStartBoundary*(offset: jint): jint
  proc previousEndBoundary*(offset: jint): jint
  proc nextStartBoundary*(offset: jint): jint
  proc nextEndBoundary*(offset: jint): jint

