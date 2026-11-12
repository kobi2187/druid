import jnim

jclass android.accessibilityservice.AccessibilityShortcutInfo* of JVMObject:
  proc getActivityInfo*(): ActivityInfo
  proc getComponentName*(): ComponentName
  proc loadSummary*(packageManager: PackageManager): string
  proc loadIntro*(packageManager: PackageManager): string
  proc loadDescription*(packageManager: PackageManager): string
  proc getAnimatedImageRes*(): jint
  proc loadAnimatedImage*(context: Context): Drawable
  proc loadHtmlDescription*(packageManager: PackageManager): string
  proc getSettingsActivityName*(): string
  proc getTileServiceName*(): string
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  META_DATA*: string {.`static`.}

