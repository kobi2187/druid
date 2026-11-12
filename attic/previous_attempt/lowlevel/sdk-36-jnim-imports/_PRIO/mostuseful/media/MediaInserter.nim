import jnim

jclass android.media.MediaInserter* of JVMObject:
  proc insert*(tableUri: Uri, values: ContentValues)
  proc insertwithPriority*(tableUri: Uri, values: ContentValues)
  proc flushAll*()

