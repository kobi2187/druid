import jnim

jclass android.app.TaskStackBuilder* of JVMObject:
  proc create*(context: Context): TaskStackBuilder {.`static`.}
  proc addNextIntent*(nextIntent: Intent): TaskStackBuilder
  proc addNextIntentWithParentStack*(nextIntent: Intent): TaskStackBuilder
  proc addParentStack*(sourceActivity: Activity): TaskStackBuilder
  proc addParentStack*(sourceActivityClass: Class[?]): TaskStackBuilder
  proc addParentStack*(sourceActivityName: ComponentName): TaskStackBuilder
  proc getIntentCount*(): jint
  proc editIntentAt*(index: jint): Intent
  proc startActivities*()
  proc startActivities*(options: Bundle, userHandle: UserHandle): jint
  proc startActivities*(options: Bundle)
  proc getPendingIntent*(requestCode: jint, flags: jint): PendingIntent
  proc getPendingIntent*(requestCode: jint, flags: jint, options: Bundle): PendingIntent
  proc getPendingIntent*(requestCode: jint, flags: jint, options: Bundle, user: UserHandle): PendingIntent
  proc getIntents*(): seq[Intent]

