import jnim

jclass android.media.MediaCommunicationManager* of JVMObject:
  proc getVersion*(): jint
  proc notifySession2Created*(token: Session2Token)
  proc isTrustedForMediaControl*(userInfo: MediaSessionManager.RemoteUserInfo): jboolean
  proc getSession2Tokens*(): List[Session2Token]
  proc registerSessionCallback*(executor: Executor, callback: SessionCallback)
  proc unregisterSessionCallback*(callback: SessionCallback)
  proc dispatchMediaKeyEvent*(keyEvent: KeyEvent, asSystemService: jboolean)

