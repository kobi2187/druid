import jnim

jclass android.database.MergeCursor* of AbstractCursor:
  proc getCount*(): jint
  proc onMove*(oldPosition: jint, newPosition: jint): jboolean
  proc getString*(column: jint): string
  proc getShort*(column: jint): jshort
  proc getInt*(column: jint): jint
  proc getLong*(column: jint): jlong
  proc getFloat*(column: jint): jfloat
  proc getDouble*(column: jint): jdouble
  proc getType*(column: jint): jint
  proc isNull*(column: jint): jboolean
  proc getBlob*(column: jint): seq[jbyte]
  proc getColumnNames*(): seq[string]
  proc deactivate*()
  proc close*()
  proc registerContentObserver*(observer: ContentObserver)
  proc unregisterContentObserver*(observer: ContentObserver)
  proc registerDataSetObserver*(observer: DataSetObserver)
  proc unregisterDataSetObserver*(observer: DataSetObserver)
  proc requery*(): jboolean

