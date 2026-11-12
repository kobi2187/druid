import jnim

jclass android.window.WindowMetricsHelper* of JVMObject:
  proc getBoundsExcludingNavigationBarAndCutout*(windowMetrics: WindowMetrics): Rect {.`static`.}

