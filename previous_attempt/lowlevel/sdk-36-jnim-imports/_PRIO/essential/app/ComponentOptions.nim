import jnim

jclass android.app.ComponentOptions* of JVMObject:
  proc setPendingIntentBackgroundActivityLaunchAllowed*(allowed: jboolean)
  proc isPendingIntentBackgroundActivityLaunchAllowed*(): jboolean
  proc setPendingIntentBackgroundActivityStartMode*(state: jint): ComponentOptions
  proc getPendingIntentBackgroundActivityStartMode*(): jint
  proc toBundle*(): Bundle
  proc fromBundle*(options: Bundle): ComponentOptions {.`static`.}
  KEY_PENDING_INTENT_BACKGROUND_ACTIVITY_ALLOWED*: string {.`static`.}

