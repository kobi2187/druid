import jnim

jclass android.window.WindowMetricsController* of JVMObject:
  proc getCurrentWindowMetrics*(): WindowMetrics
  proc getMaximumWindowMetrics*(): WindowMetrics
  proc getPossibleMaximumWindowMetrics*(displayId: jint): Set[WindowMetrics]

