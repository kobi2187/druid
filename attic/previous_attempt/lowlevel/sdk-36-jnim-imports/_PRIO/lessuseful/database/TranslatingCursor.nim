import jnim

jclass android.database.TranslatingCursor* of CrossProcessCursorWrapper:
  proc getColumnCount*(): jint
  proc getColumnNames*(): seq[string]
  proc query*(config: Config, translator: Translator, qb: SQLiteQueryBuilder, db: SQLiteDatabase, projectionIn: seq[string], selection: string, selectionArgs: seq[string], groupBy: string, having: string, sortOrder: string, limit: string, signal: CancellationSignal): Cursor {.`static`.}
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

jclass android.database.Config* of JVMObject:
  baseUri*: Uri
  auxiliaryColumn*: string
  translateColumns*: string

