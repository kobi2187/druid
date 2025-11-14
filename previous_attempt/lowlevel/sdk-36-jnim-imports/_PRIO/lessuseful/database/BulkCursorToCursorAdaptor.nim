import jnim

jclass android.database.BulkCursorToCursorAdaptor* of AbstractWindowedCursor:
  proc initialize*(d: BulkCursorDescriptor)
  proc getObserver*(): IContentObserver
  proc getCount*(): jint
  proc onMove*(oldPosition: jint, newPosition: jint): jboolean
  proc deactivate*()
  proc close*()
  proc requery*(): jboolean
  proc getColumnNames*(): seq[string]
  proc getExtras*(): Bundle
  proc respond*(extras: Bundle): Bundle

