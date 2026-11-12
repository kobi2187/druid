import jnim

jclass android.app.SynchronousUserSwitchObserver* of UserSwitchObserver:
  proc onUserSwitching*(newUserId: jint, reply: IRemoteCallback)
  proc onUserSwitching*(newUserId: jint)

