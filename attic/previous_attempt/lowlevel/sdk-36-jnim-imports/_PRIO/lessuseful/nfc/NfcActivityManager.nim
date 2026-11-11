import jnim

jclass android.nfc.NfcActivityManager* of Stub:
  proc findAppState*(app: Application): NfcApplicationState
  proc registerApplication*(app: Application)
  proc unregisterApplication*(app: Application)
  proc findActivityState*(activity: Activity): NfcActivityState
  proc getActivityState*(activity: Activity): NfcActivityState
  proc findResumedActivityState*(): NfcActivityState
  proc destroyActivityState*(activity: Activity)
  proc enableReaderMode*(activity: Activity, callback: ReaderCallback, flags: jint, extras: Bundle)
  proc disableReaderMode*(activity: Activity)
  proc setReaderMode*(token: Binder, flags: jint, extras: Bundle)
  proc onTagDiscovered*(tag: Tag)
  proc onActivityCreated*(activity: Activity, savedInstanceState: Bundle)
  proc onActivityStarted*(activity: Activity)
  proc onActivityResumed*(activity: Activity)
  proc onActivityPaused*(activity: Activity)
  proc onActivityStopped*(activity: Activity)
  proc onActivitySaveInstanceState*(activity: Activity, outState: Bundle)
  proc onActivityDestroyed*(activity: Activity)
  proc setDiscoveryTech*(activity: Activity, pollTech: jint, listenTech: jint)
  proc resetDiscoveryTech*(activity: Activity)

