import jnim

jclass android.transparency.BinaryTransparencyManager* of JVMObject:
  proc getSignedImageInfo*(): string
  proc collectAllApexInfo*(includeTestOnly: jboolean): List[IBinaryTransparencyService.ApexInfo]
  proc collectAllUpdatedPreloadInfo*(packagesToSkip: Bundle): List[IBinaryTransparencyService.AppInfo]
  proc collectAllSilentInstalledMbaInfo*(packagesToSkip: Bundle): List[IBinaryTransparencyService.AppInfo]

