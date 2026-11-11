import jnim

jclass android.view.DisplayAdjustments* of JVMObject:
  proc setCompatibilityInfo*(compatInfo: CompatibilityInfo)
  proc getCompatibilityInfo*(): CompatibilityInfo
  proc setConfiguration*(configuration: Configuration)
  proc getConfiguration*(): Configuration
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  DEFAULT_DISPLAY_ADJUSTMENTS*: DisplayAdjustments {.`static`.}

