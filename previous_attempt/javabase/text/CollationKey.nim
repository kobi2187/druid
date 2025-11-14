import jnim

jclass java.text.CollationKey* of JVMObject:
  proc compareTo*(target: CollationKey): jint
  proc getSourceString*(): string
  proc toByteArray*(): seq[jbyte]

