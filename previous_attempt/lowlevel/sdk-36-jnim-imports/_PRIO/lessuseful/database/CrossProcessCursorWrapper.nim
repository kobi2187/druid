import jnim

jclass android.database.CrossProcessCursorWrapper* of CursorWrapper:
  proc fillWindow*(position: jint, window: CursorWindow)
  proc getWindow*(): CursorWindow
  proc onMove*(oldPosition: jint, newPosition: jint): jboolean

