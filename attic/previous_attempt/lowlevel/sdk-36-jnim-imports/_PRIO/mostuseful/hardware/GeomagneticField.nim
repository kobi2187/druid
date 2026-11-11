import jnim

jclass android.hardware.GeomagneticField* of JVMObject:
  proc getX*(): jfloat
  proc getY*(): jfloat
  proc getZ*(): jfloat
  proc getDeclination*(): jfloat
  proc getInclination*(): jfloat
  proc getHorizontalStrength*(): jfloat
  proc getFieldStrength*(): jfloat

