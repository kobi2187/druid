import jnim

jclass android.app.StatsCursor* of AbstractCursor:
  proc getCount*(): jint
  proc getColumnNames*(): seq[string]
  proc getString*(column: jint): string
  proc getShort*(column: jint): jshort
  proc getInt*(column: jint): jint
  proc getLong*(column: jint): jlong
  proc getFloat*(column: jint): jfloat
  proc getDouble*(column: jint): jdouble
  proc isNull*(column: jint): jboolean
  proc getType*(column: jint): jint
  proc onMove*(oldPosition: jint, newPosition: jint): jboolean

