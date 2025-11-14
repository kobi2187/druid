import jnim

jclass android.app.ActivityGroup* of Activity:
  proc onRetainNonConfigurationChildInstances*(): HashMap[string, JObject]
  proc getCurrentActivity*(): Activity
  proc getLocalActivityManager*(): LocalActivityManager

