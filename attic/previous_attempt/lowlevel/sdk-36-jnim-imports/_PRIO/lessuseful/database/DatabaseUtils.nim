import jnim

jclass android.database.DatabaseUtils* of JVMObject:
  proc writeExceptionToParcel*(reply: Parcel, e: Exception) {.`static`.}
  proc readExceptionFromParcel*(reply: Parcel) {.`static`.}
  proc readExceptionWithFileNotFoundExceptionFromParcel*(reply: Parcel) {.`static`.}
  proc readExceptionWithOperationApplicationExceptionFromParcel*(reply: Parcel) {.`static`.}
  proc executeInsert*(db: SQLiteDatabase, sql: string, bindArgs: seq[JObject]): jlong {.`static`.}
  proc executeUpdateDelete*(db: SQLiteDatabase, sql: string, bindArgs: seq[JObject]): jint {.`static`.}
  proc bindObjectToProgram*(prog: SQLiteProgram, index: jint, value: JObject) {.`static`.}
  proc bindSelection*(selection: string, selectionArgs: JObject): string {.`static`.}
  proc deepCopyOf*(args: seq[JObject]): seq[JObject] {.`static`.}
  proc getTypeOfObject*(obj: JObject): jint {.`static`.}
  proc cursorFillWindow*(cursor: Cursor, position: jint, window: CursorWindow) {.`static`.}
  proc appendEscapedSQLString*(sb: StringBuilder, sqlString: string) {.`static`.}
  proc sqlEscapeString*(value: string): string {.`static`.}
  proc appendValueToSql*(sql: StringBuilder, value: JObject) {.`static`.}
  proc concatenateWhere*(a: string, b: string): string {.`static`.}
  proc getCollationKey*(name: string): string {.`static`.}
  proc getHexCollationKey*(name: string): string {.`static`.}
  proc dumpCursor*(cursor: Cursor) {.`static`.}
  proc dumpCursor*(cursor: Cursor, stream: PrintStream) {.`static`.}
  proc dumpCursor*(cursor: Cursor, sb: StringBuilder) {.`static`.}
  proc dumpCursorToString*(cursor: Cursor): string {.`static`.}
  proc dumpCurrentRow*(cursor: Cursor) {.`static`.}
  proc dumpCurrentRow*(cursor: Cursor, stream: PrintStream) {.`static`.}
  proc dumpCurrentRow*(cursor: Cursor, sb: StringBuilder) {.`static`.}
  proc dumpCurrentRowToString*(cursor: Cursor): string {.`static`.}
  proc cursorStringToContentValues*(cursor: Cursor, field: string, values: ContentValues) {.`static`.}
  proc cursorStringToInsertHelper*(cursor: Cursor, field: string, inserter: InsertHelper, index: jint) {.`static`.}
  proc cursorStringToContentValues*(cursor: Cursor, field: string, values: ContentValues, key: string) {.`static`.}
  proc cursorIntToContentValues*(cursor: Cursor, field: string, values: ContentValues) {.`static`.}
  proc cursorIntToContentValues*(cursor: Cursor, field: string, values: ContentValues, key: string) {.`static`.}
  proc cursorLongToContentValues*(cursor: Cursor, field: string, values: ContentValues) {.`static`.}
  proc cursorLongToContentValues*(cursor: Cursor, field: string, values: ContentValues, key: string) {.`static`.}
  proc cursorDoubleToCursorValues*(cursor: Cursor, field: string, values: ContentValues) {.`static`.}
  proc cursorDoubleToContentValues*(cursor: Cursor, field: string, values: ContentValues, key: string) {.`static`.}
  proc cursorRowToContentValues*(cursor: Cursor, values: ContentValues) {.`static`.}
  proc cursorPickFillWindowStartPosition*(cursorPosition: jint, cursorWindowCapacity: jint): jint {.`static`.}
  proc queryNumEntries*(db: SQLiteDatabase, table: string): jlong {.`static`.}
  proc queryNumEntries*(db: SQLiteDatabase, table: string, selection: string): jlong {.`static`.}
  proc queryNumEntries*(db: SQLiteDatabase, table: string, selection: string, selectionArgs: seq[string]): jlong {.`static`.}
  proc queryIsEmpty*(db: SQLiteDatabase, table: string): jboolean {.`static`.}
  proc longForQuery*(db: SQLiteDatabase, query: string, selectionArgs: seq[string]): jlong {.`static`.}
  proc longForQuery*(prog: SQLiteStatement, selectionArgs: seq[string]): jlong {.`static`.}
  proc stringForQuery*(db: SQLiteDatabase, query: string, selectionArgs: seq[string]): string {.`static`.}
  proc stringForQuery*(prog: SQLiteStatement, selectionArgs: seq[string]): string {.`static`.}
  proc blobFileDescriptorForQuery*(db: SQLiteDatabase, query: string, selectionArgs: seq[string]): ParcelFileDescriptor {.`static`.}
  proc blobFileDescriptorForQuery*(prog: SQLiteStatement, selectionArgs: seq[string]): ParcelFileDescriptor {.`static`.}
  proc cursorStringToContentValuesIfPresent*(cursor: Cursor, values: ContentValues, column: string) {.`static`.}
  proc cursorLongToContentValuesIfPresent*(cursor: Cursor, values: ContentValues, column: string) {.`static`.}
  proc cursorShortToContentValuesIfPresent*(cursor: Cursor, values: ContentValues, column: string) {.`static`.}
  proc cursorIntToContentValuesIfPresent*(cursor: Cursor, values: ContentValues, column: string) {.`static`.}
  proc cursorFloatToContentValuesIfPresent*(cursor: Cursor, values: ContentValues, column: string) {.`static`.}
  proc cursorDoubleToContentValuesIfPresent*(cursor: Cursor, values: ContentValues, column: string) {.`static`.}
  proc createDbFromSqlStatements*(context: Context, dbName: string, dbVersion: jint, sqlStatements: string) {.`static`.}
  proc getSqlStatementTypeExtended*(sql: string): jint {.`static`.}
  proc getSqlStatementType*(extended: jint): jint {.`static`.}
  proc getSqlStatementType*(sql: string): jint {.`static`.}
  proc appendSelectionArgs*(originalValues: seq[string], newValues: seq[string]): seq[string] {.`static`.}
  proc findRowIdColumnIndex*(columnNames: seq[string]): jint {.`static`.}
  proc escapeForLike*(arg: string): string {.`static`.}
  STATEMENT_SELECT*: jint {.`static`.}
  STATEMENT_UPDATE*: jint {.`static`.}
  STATEMENT_ATTACH*: jint {.`static`.}
  STATEMENT_BEGIN*: jint {.`static`.}
  STATEMENT_COMMIT*: jint {.`static`.}
  STATEMENT_ABORT*: jint {.`static`.}
  STATEMENT_PRAGMA*: jint {.`static`.}
  STATEMENT_DDL*: jint {.`static`.}
  STATEMENT_UNPREPARED*: jint {.`static`.}
  STATEMENT_OTHER*: jint {.`static`.}
  STATEMENT_WITH*: jint {.`static`.}
  STATEMENT_CREATE*: jint {.`static`.}
  STATEMENT_COMMENT*: jint {.`static`.}

jclass android.database.DatabaseUtils.InsertHelper* of JVMObject:
  proc getColumnIndex*(key: string): jint
  proc bind*(index: jint, value: jdouble)
  proc bind*(index: jint, value: jfloat)
  proc bind*(index: jint, value: jlong)
  proc bind*(index: jint, value: jint)
  proc bind*(index: jint, value: jboolean)
  proc bindNull*(index: jint)
  proc bind*(index: jint, value: seq[jbyte])
  proc bind*(index: jint, value: string)
  proc insert*(values: ContentValues): jlong
  proc execute*(): jlong
  proc prepareForInsert*()
  proc prepareForReplace*()
  proc replace*(values: ContentValues): jlong
  proc close*()

jclass android.database.InsertHelper* of JVMObject:
  proc getColumnIndex*(key: string): jint
  proc bind*(index: jint, value: jdouble)
  proc bind*(index: jint, value: jfloat)
  proc bind*(index: jint, value: jlong)
  proc bind*(index: jint, value: jint)
  proc bind*(index: jint, value: jboolean)
  proc bindNull*(index: jint)
  proc bind*(index: jint, value: seq[jbyte])
  proc bind*(index: jint, value: string)
  proc insert*(values: ContentValues): jlong
  proc execute*(): jlong
  proc prepareForInsert*()
  proc prepareForReplace*()
  proc replace*(values: ContentValues): jlong
  proc close*()
  TABLE_INFO_PRAGMA_COLUMNNAME_INDEX*: jint {.`static`.}
  TABLE_INFO_PRAGMA_DEFAULT_INDEX*: jint {.`static`.}

