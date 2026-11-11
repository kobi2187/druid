import jnim

jclass android.database.CursorToBulkCursorAdaptor* of BulkCursorNative:
  proc binderDied*()
  proc getBulkCursorDescriptor*(): BulkCursorDescriptor
  proc getWindow*(position: jint): CursorWindow
  proc onMove*(position: jint)
  proc deactivate*()
  proc close*()
  proc requery*(observer: IContentObserver): jint
  proc getExtras*(): Bundle
  proc respond*(extras: Bundle): Bundle

