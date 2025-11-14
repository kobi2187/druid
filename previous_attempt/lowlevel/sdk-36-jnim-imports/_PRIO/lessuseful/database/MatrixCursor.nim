import jnim

jclass android.database.MatrixCursor* of AbstractCursor:
  proc newRow*(): RowBuilder
  proc addRow*(columnValues: seq[JObject])
  proc addRow*(columnValues: Iterable[?])
  proc getCount*(): jint
  proc getColumnNames*(): seq[string]
  proc getString*(column: jint): string
  proc getShort*(column: jint): jshort
  proc getInt*(column: jint): jint
  proc getLong*(column: jint): jlong
  proc getFloat*(column: jint): jfloat
  proc getDouble*(column: jint): jdouble
  proc getBlob*(column: jint): seq[jbyte]
  proc getType*(column: jint): jint
  proc isNull*(column: jint): jboolean

jclass android.database.MatrixCursor.RowBuilder* of JVMObject:
  proc add*(columnValue: JObject): RowBuilder
  proc add*(columnName: string, value: JObject): RowBuilder
  proc add*(columnIndex: jint, value: JObject): RowBuilder

jclass android.database.RowBuilder* of JVMObject:
  proc add*(columnValue: JObject): RowBuilder
  proc add*(columnName: string, value: JObject): RowBuilder
  proc add*(columnIndex: jint, value: JObject): RowBuilder

