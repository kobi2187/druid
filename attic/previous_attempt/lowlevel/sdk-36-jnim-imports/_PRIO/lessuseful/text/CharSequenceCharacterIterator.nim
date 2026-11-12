import jnim

jclass android.text.CharSequenceCharacterIterator* of JVMObject:
  proc first*(): jchar
  proc last*(): jchar
  proc current*(): jchar
  proc next*(): jchar
  proc previous*(): jchar
  proc setIndex*(position: jint): jchar
  proc getBeginIndex*(): jint
  proc getEndIndex*(): jint
  proc getIndex*(): jint
  proc clone*(): JObject

