import jnim

jclass android.app.LocalActivityManager* of JVMObject:
  proc startActivity*(id: string, intent: Intent): Window
  proc destroyActivity*(id: string, finish: jboolean): Window
  proc getCurrentActivity*(): Activity
  proc getCurrentId*(): string
  proc getActivity*(id: string): Activity
  proc dispatchCreate*(state: Bundle)
  proc saveInstanceState*(): Bundle
  proc dispatchResume*()
  proc dispatchPause*(finishing: jboolean)
  proc dispatchStop*()
  proc dispatchRetainNonConfigurationInstance*(): HashMap[string, JObject]
  proc removeAllActivities*()
  proc dispatchDestroy*(finishing: jboolean)

