import jnim

jclass java.text.CollationElementIterator* of JVMObject:
  proc reset*()
  proc next*(): jint
  proc previous*(): jint
  proc primaryOrder*(order: jint): jint {.`static`.}
  proc secondaryOrder*(order: jint): jshort {.`static`.}
  proc tertiaryOrder*(order: jint): jshort {.`static`.}
  proc setOffset*(newOffset: jint)
  proc getOffset*(): jint
  proc getMaxExpansion*(order: jint): jint
  proc setText*(source: string)
  proc setText*(source: CharacterIterator)
  NULLORDER*: jint {.`static`.}

