import jnim

jclass android.app.GameManager* of JVMObject:
  proc getGameMode*(): jint
  proc getGameMode*(packageName: string): jint
  proc getGameModeInfo*(packageName: string): GameModeInfo
  proc setGameMode*(packageName: string, gameMode: jint)
  proc getAvailableGameModes*(packageName: string): seq[jint]
  proc isAngleEnabled*(packageName: string): jboolean
  proc notifyGraphicsEnvironmentSetup*()
  proc setGameState*(gameState: GameState)
  proc setGameServiceProvider*(packageName: string)
  proc updateCustomGameModeConfiguration*(packageName: string, gameModeConfig: GameModeConfiguration)
  GAME_MODE_UNSUPPORTED*: jint {.`static`.}
  GAME_MODE_STANDARD*: jint {.`static`.}
  GAME_MODE_PERFORMANCE*: jint {.`static`.}
  GAME_MODE_BATTERY*: jint {.`static`.}
  GAME_MODE_CUSTOM*: jint {.`static`.}

