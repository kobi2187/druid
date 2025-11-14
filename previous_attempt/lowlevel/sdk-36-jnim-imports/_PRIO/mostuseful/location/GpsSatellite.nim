import jnim

jclass android.location.GpsSatellite* of JVMObject:
  proc getPrn*(): jint
  proc getSnr*(): jfloat
  proc getElevation*(): jfloat
  proc getAzimuth*(): jfloat
  proc hasEphemeris*(): jboolean
  proc hasAlmanac*(): jboolean
  proc usedInFix*(): jboolean

