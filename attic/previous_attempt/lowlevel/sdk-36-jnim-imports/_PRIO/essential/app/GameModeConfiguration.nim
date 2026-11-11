import jnim

jclass android.app.GameModeConfiguration* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getScalingFactor*(): jfloat
  proc getFpsOverride*(): jint
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  FPS_OVERRIDE_NONE*: jint {.`static`.}
  CREATOR*: Creator[GameModeConfiguration] {.`static`.}

jclass android.app.GameModeConfiguration.Builder* of JVMObject:
  proc setScalingFactor*(scalingFactor: jfloat): GameModeConfiguration.Builder
  proc setFpsOverride*(fpsOverride: jint): GameModeConfiguration.Builder
  proc build*(): GameModeConfiguration

jclass android.app.Builder* of JVMObject:
  proc setScalingFactor*(scalingFactor: jfloat): GameModeConfiguration.Builder
  proc setFpsOverride*(fpsOverride: jint): GameModeConfiguration.Builder
  proc build*(): GameModeConfiguration

