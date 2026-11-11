import jnim

jclass android.app.GameModeInfo* of JVMObject:
  proc getActiveGameMode*(): jint
  proc getAvailableGameModes*(): seq[jint]
  proc getOverriddenGameModes*(): seq[jint]
  proc getGameModeConfiguration*(gameMode: jint): GameModeConfiguration
  proc isDownscalingAllowed*(): jboolean
  proc isFpsOverrideAllowed*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[GameModeInfo] {.`static`.}

jclass android.app.GameModeInfo.Builder* of JVMObject:
  proc setAvailableGameModes*(availableGameModes: seq[jint]): GameModeInfo.Builder
  proc setOverriddenGameModes*(overriddenGameModes: seq[jint]): GameModeInfo.Builder
  proc setActiveGameMode*(activeGameMode: jint): GameModeInfo.Builder
  proc setDownscalingAllowed*(allowed: jboolean): GameModeInfo.Builder
  proc setFpsOverrideAllowed*(allowed: jboolean): GameModeInfo.Builder
  proc setGameModeConfiguration*(gameMode: jint, gameModeConfiguration: GameModeConfiguration): GameModeInfo.Builder
  proc build*(): GameModeInfo

jclass android.app.Builder* of JVMObject:
  proc setAvailableGameModes*(availableGameModes: seq[jint]): GameModeInfo.Builder
  proc setOverriddenGameModes*(overriddenGameModes: seq[jint]): GameModeInfo.Builder
  proc setActiveGameMode*(activeGameMode: jint): GameModeInfo.Builder
  proc setDownscalingAllowed*(allowed: jboolean): GameModeInfo.Builder
  proc setFpsOverrideAllowed*(allowed: jboolean): GameModeInfo.Builder
  proc setGameModeConfiguration*(gameMode: jint, gameModeConfiguration: GameModeConfiguration): GameModeInfo.Builder
  proc build*(): GameModeInfo

