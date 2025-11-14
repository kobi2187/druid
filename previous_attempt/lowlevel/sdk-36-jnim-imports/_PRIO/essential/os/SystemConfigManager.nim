import jnim

jclass android.os.SystemConfigManager* of JVMObject:
  proc getDisabledUntilUsedPreinstalledCarrierApps*(): Set[string]
  proc getDisabledUntilUsedPreinstalledCarrierAssociatedApps*(): Map[string, List[string]]
  proc getDisabledUntilUsedPreinstalledCarrierAssociatedAppEntries*(): Map[string, List[CarrierAssociatedAppEntry]]
  proc getSystemPermissionUids*(permissionName: string): seq[jint]
  proc getEnabledComponentOverrides*(packageName: string): List[ComponentName]
  proc getDefaultVrComponents*(): List[ComponentName]
  proc getPreventUserDisablePackages*(): List[string]
  proc getEnhancedConfirmationTrustedPackages*(): Set[SignedPackage]
  proc getEnhancedConfirmationTrustedInstallers*(): Set[SignedPackage]

