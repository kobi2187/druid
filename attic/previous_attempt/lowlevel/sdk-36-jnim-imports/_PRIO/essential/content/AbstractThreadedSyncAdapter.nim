import jnim

jclass android.content.AbstractThreadedSyncAdapter* of JVMObject:
  proc getContext*(): Context
  proc getSyncAdapterBinder*(): IBinder
  proc onUnsyncableAccount*(): jboolean
  proc onPerformSync*(account: Account, extras: Bundle, authority: string, provider: ContentProviderClient, syncResult: SyncResult)
  proc onSecurityException*(account: Account, extras: Bundle, authority: string, syncResult: SyncResult)
  proc onSyncCanceled*()
  proc onSyncCanceled*(thread: Thread)
  LOG_SYNC_DETAILS*: jint {.`static`.}

