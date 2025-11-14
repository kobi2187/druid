import jnim

jclass android.os.DdmSyncState* of JVMObject:
  proc getStage*(): Stage {.`static`.}
  proc reset*() {.`static`.}
  proc next*(nextStage: Stage) {.`static`.}

