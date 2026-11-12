import jnim

jclass android.app.GameManagerInternal* of JVMObject:
  proc getResolutionScalingFactor*(packageName: string, userId: jint): jfloat

