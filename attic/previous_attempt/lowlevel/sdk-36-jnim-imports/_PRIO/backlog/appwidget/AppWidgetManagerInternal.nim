import jnim

jclass android.appwidget.AppWidgetManagerInternal* of JVMObject:
  proc getHostedWidgetPackages*(uid: jint): ArraySet[string]
  proc unlockUser*(userId: jint)
  proc applyResourceOverlaysToWidgets*(packageNames: Set[string], userId: jint, updateFrameworkRes: jboolean)

