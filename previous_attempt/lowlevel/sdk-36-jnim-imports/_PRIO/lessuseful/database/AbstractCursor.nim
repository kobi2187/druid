import jnim

jclass android.database.AbstractCursor* of JVMObject:
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
  proc getBlob*(column: jint): seq[jbyte]
  proc getWindow*(): CursorWindow
  proc getColumnCount*(): jint
  proc deactivate*()
  proc requery*(): jboolean
  proc isClosed*(): jboolean
  proc close*()
  proc onMove*(oldPosition: jint, newPosition: jint): jboolean
  proc copyStringToBuffer*(columnIndex: jint, buffer: CharArrayBuffer)
  proc getPosition*(): jint
  proc moveToPosition*(position: jint): jboolean
  proc fillWindow*(position: jint, window: CursorWindow)
  proc move*(offset: jint): jboolean
  proc moveToFirst*(): jboolean
  proc moveToLast*(): jboolean
  proc moveToNext*(): jboolean
  proc moveToPrevious*(): jboolean
  proc isFirst*(): jboolean
  proc isLast*(): jboolean
  proc isBeforeFirst*(): jboolean
  proc isAfterLast*(): jboolean
  proc getColumnIndex*(columnName: string): jint
  proc getColumnIndexOrThrow*(columnName: string): jint
  proc getColumnName*(columnIndex: jint): string
  proc registerContentObserver*(observer: ContentObserver)
  proc unregisterContentObserver*(observer: ContentObserver)
  proc registerDataSetObserver*(observer: DataSetObserver)
  proc unregisterDataSetObserver*(observer: DataSetObserver)
  proc setNotificationUri*(cr: ContentResolver, notifyUri: Uri)
  proc setNotificationUris*(cr: ContentResolver, notifyUris: List[Uri])
  proc setNotificationUris*(cr: ContentResolver, notifyUris: List[Uri], userHandle: jint, registerSelfObserver: jboolean)
  proc getNotificationUri*(): Uri
  proc getNotificationUris*(): List[Uri]
  proc getWantsAllOnMoveCalls*(): jboolean
  proc setExtras*(extras: Bundle)
  proc getExtras*(): Bundle
  proc respond*(extras: Bundle): Bundle

