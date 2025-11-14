import jnim

jclass android.database.RedactingCursor* of CrossProcessCursorWrapper:
  proc create*(cursor: Cursor, redactions: Map[string, JObject]): Cursor {.`static`.}
  proc fillWindow*(position: jint, window: CursorWindow)
  proc getWindow*(): CursorWindow
  proc getWrappedCursor*(): Cursor
  proc getDouble*(columnIndex: jint): jdouble
  proc getFloat*(columnIndex: jint): jfloat
  proc getInt*(columnIndex: jint): jint
  proc getLong*(columnIndex: jint): jlong
  proc getShort*(columnIndex: jint): jshort
  proc getString*(columnIndex: jint): string
  proc copyStringToBuffer*(columnIndex: jint, buffer: CharArrayBuffer)
  proc getBlob*(columnIndex: jint): seq[jbyte]
  proc getType*(columnIndex: jint): jint
  proc isNull*(columnIndex: jint): jboolean

