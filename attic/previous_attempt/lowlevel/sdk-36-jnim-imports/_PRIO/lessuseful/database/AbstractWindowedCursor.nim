import jnim

jclass android.database.AbstractWindowedCursor* of AbstractCursor:
  proc getBlob*(columnIndex: jint): seq[jbyte]
  proc getString*(columnIndex: jint): string
  proc copyStringToBuffer*(columnIndex: jint, buffer: CharArrayBuffer)
  proc getShort*(columnIndex: jint): jshort
  proc getInt*(columnIndex: jint): jint
  proc getLong*(columnIndex: jint): jlong
  proc getFloat*(columnIndex: jint): jfloat
  proc getDouble*(columnIndex: jint): jdouble
  proc isNull*(columnIndex: jint): jboolean
  proc isBlob*(columnIndex: jint): jboolean
  proc isString*(columnIndex: jint): jboolean
  proc isLong*(columnIndex: jint): jboolean
  proc isFloat*(columnIndex: jint): jboolean
  proc getType*(columnIndex: jint): jint
  proc getWindow*(): CursorWindow
  proc setWindow*(window: CursorWindow)
  proc hasWindow*(): jboolean

