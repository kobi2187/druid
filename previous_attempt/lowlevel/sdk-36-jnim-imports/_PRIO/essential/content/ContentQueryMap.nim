import jnim

jclass android.content.ContentQueryMap* of Observable:
  proc setKeepUpdated*(keepUpdated: jboolean)
  proc getValues*(rowName: string): ContentValues
  proc requery*()
  proc getRows*(): Map[string, ContentValues]
  proc close*()

