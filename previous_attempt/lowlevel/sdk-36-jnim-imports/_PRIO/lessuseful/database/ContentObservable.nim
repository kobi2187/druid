import jnim

jclass android.database.ContentObservable* of Observable:
  proc registerObserver*(observer: ContentObserver)
  proc dispatchChange*(selfChange: jboolean)
  proc dispatchChange*(selfChange: jboolean, uri: Uri)
  proc notifyChange*(selfChange: jboolean)

