import jnim

jclass android.os.VintfObject* of JVMObject:
  proc report*(): seq[string] {.`static`.}
  proc verifyBuildAtBoot*(): jint {.`static`.}
  proc getHalNamesAndVersions*(): seq[string] {.`static`.}
  proc getSepolicyVersion*(): string {.`static`.}
  proc getPlatformSepolicyVersion*(): string {.`static`.}
  proc getVndkSnapshots*(): Map[string, seq[string]] {.`static`.}
  proc getTargetFrameworkCompatibilityMatrixVersion*(): Long {.`static`.}

