import jnim

jclass java.text.CharacterIterator* of Cloneable:
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
  DONE*: jchar {.`static`.}

