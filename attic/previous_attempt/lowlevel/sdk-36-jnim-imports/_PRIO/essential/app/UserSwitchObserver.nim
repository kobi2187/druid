import jnim

jclass android.app.UserSwitchObserver* of Stub:
  proc onBeforeUserSwitching*(newUserId: jint, reply: IRemoteCallback)
  proc onUserSwitching*(newUserId: jint, reply: IRemoteCallback)
  proc onUserSwitchComplete*(newUserId: jint)
  proc onForegroundProfileSwitch*(newProfileId: jint)
  proc onLockedBootComplete*(newUserId: jint)

