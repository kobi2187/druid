import jnim

jclass android.database.CursorWrapper* of JVMObject:
  proc getWrappedCursor*(): Cursor
  proc close*()
  proc isClosed*(): jboolean
  proc getCount*(): jint
  proc deactivate*()
  proc moveToFirst*(): jboolean
  proc getColumnCount*(): jint
  proc getColumnIndex*(columnName: string): jint
  proc getColumnIndexOrThrow*(columnName: string): jint
  proc getColumnName*(columnIndex: jint): string
  proc getColumnNames*(): seq[string]
  proc getDouble*(columnIndex: jint): jdouble
  proc setExtras*(extras: Bundle)
  proc getExtras*(): Bundle
  proc getFloat*(columnIndex: jint): jfloat
  proc getInt*(columnIndex: jint): jint
  proc getLong*(columnIndex: jint): jlong
  proc getShort*(columnIndex: jint): jshort
  proc getString*(columnIndex: jint): string
  proc copyStringToBuffer*(columnIndex: jint, buffer: CharArrayBuffer)
  proc getBlob*(columnIndex: jint): seq[jbyte]
  proc getWantsAllOnMoveCalls*(): jboolean
  proc isAfterLast*(): jboolean
  proc isBeforeFirst*(): jboolean
  proc isFirst*(): jboolean
  proc isLast*(): jboolean
  proc getType*(columnIndex: jint): jint
  proc isNull*(columnIndex: jint): jboolean
  proc moveToLast*(): jboolean
  proc move*(offset: jint): jboolean
  proc moveToPosition*(position: jint): jboolean
  proc moveToNext*(): jboolean
  proc getPosition*(): jint
  proc moveToPrevious*(): jboolean
  proc registerContentObserver*(observer: ContentObserver)
  proc registerDataSetObserver*(observer: DataSetObserver)
  proc requery*(): jboolean
  proc respond*(extras: Bundle): Bundle
  proc setNotificationUri*(cr: ContentResolver, uri: Uri)
  proc setNotificationUris*(cr: ContentResolver, uris: List[Uri])
  proc getNotificationUri*(): Uri
  proc getNotificationUris*(): List[Uri]
  proc unregisterContentObserver*(observer: ContentObserver)
  proc unregisterDataSetObserver*(observer: DataSetObserver)

