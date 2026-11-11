import jnim

jclass android.database.ContentObserver* of JVMObject:
  proc getContentObserver*(): IContentObserver
  proc releaseContentObserver*(): IContentObserver
  proc deliverSelfNotifications*(): jboolean
  proc onChange*(selfChange: jboolean)
  proc onChange*(selfChange: jboolean, uri: Uri)
  proc onChange*(selfChange: jboolean, uri: Uri, flags: jint)
  proc onChange*(selfChange: jboolean, uris: Collection[Uri], flags: jint)
  proc onChange*(selfChange: jboolean, uris: Collection[Uri], flags: jint, user: UserHandle)
  proc onChange*(selfChange: jboolean, uris: Collection[Uri], flags: jint, userId: jint)
  proc dispatchChange*(selfChange: jboolean)
  proc dispatchChange*(selfChange: jboolean, uri: Uri)
  proc dispatchChange*(selfChange: jboolean, uri: Uri, flags: jint)
  proc dispatchChange*(selfChange: jboolean, uris: Collection[Uri], flags: jint)
  proc dispatchChange*(selfChange: jboolean, uris: Collection[Uri], flags: jint, userId: jint)

