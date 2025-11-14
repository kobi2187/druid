import jnim

jclass android.database.IBulkCursor* of IInterface:
  proc getWindow*(position: jint): CursorWindow
  proc onMove*(position: jint)
  proc deactivate*()
  proc close*()
  proc requery*(observer: IContentObserver): jint

