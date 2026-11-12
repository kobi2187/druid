import jnim

jclass android.content.Entity* of JVMObject:
  proc getEntityValues*(): ContentValues
  proc getSubValues*(): ArrayList[NamedContentValues]
  proc addSubValue*(uri: Uri, values: ContentValues)
  proc toString*(): string

jclass android.content.NamedContentValues* of JVMObject:
  uri*: Uri
  values*: ContentValues

