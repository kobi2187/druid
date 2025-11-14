import jnim

jclass java.util.EventObject* of JVMObject:
  proc getSource*(): JObject
  proc toString*(): string

