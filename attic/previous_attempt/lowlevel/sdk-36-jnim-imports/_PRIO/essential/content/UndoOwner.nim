import jnim

jclass android.content.UndoOwner* of JVMObject:
  proc getTag*(): string
  proc getData*(): JObject
  proc toString*(): string

