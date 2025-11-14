import jnim

jclass android.content.UndoManager* of JVMObject:
  proc getOwner*(tag: string, data: JObject): UndoOwner
  proc saveInstanceState*(p: Parcel)
  proc restoreInstanceState*(p: Parcel, loader: ClassLoader)
  proc setHistorySize*(size: jint)
  proc getHistorySize*(): jint
  proc undo*(owners: seq[UndoOwner], count: jint): jint
  proc redo*(owners: seq[UndoOwner], count: jint): jint
  proc isInUndo*(): jboolean
  proc forgetUndos*(owners: seq[UndoOwner], count: jint): jint
  proc forgetRedos*(owners: seq[UndoOwner], count: jint): jint
  proc countUndos*(owners: seq[UndoOwner]): jint
  proc countRedos*(owners: seq[UndoOwner]): jint
  proc getUndoLabel*(owners: seq[UndoOwner]): CharSequence
  proc getRedoLabel*(owners: seq[UndoOwner]): CharSequence
  proc beginUpdate*(label: CharSequence)
  proc isInUpdate*(): jboolean
  proc setUndoLabel*(label: CharSequence)
  proc suggestUndoLabel*(label: CharSequence)
  proc getUpdateNestingLevel*(): jint
  proc hasOperation*(owner: UndoOwner): jboolean
  proc getLastOperation*(mergeMode: jint): UndoOperation[?]
  proc getLastOperation*(owner: UndoOwner, mergeMode: jint): UndoOperation[?]
  proc getLastOperation*(clazz: Class[T], owner: UndoOwner, mergeMode: jint): T
  proc addOperation*(op: UndoOperation[?], mergeMode: jint)
  proc endUpdate*()
  proc commitState*(owner: UndoOwner): jint
  proc uncommitState*(commitId: jint, owner: UndoOwner): jboolean
  MERGE_MODE_NONE*: jint {.`static`.}
  MERGE_MODE_UNIQUE*: jint {.`static`.}
  MERGE_MODE_ANY*: jint {.`static`.}

