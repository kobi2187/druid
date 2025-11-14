import jnim

jclass android.app.ResourcesManager* of JVMObject:
  proc getRegisteredResourcePaths*(): ArrayMap[string, SharedLibraryAssets]
  proc registerResourcePaths*(uniqueId: string, appInfo: ApplicationInfo)
  proc updateResourceImplAssetsWithRegisteredLibs*(assets: AssetManager, reuseAssets: jboolean): Pair[AssetManager, Integer]
  proc setInstance*(resourcesManager: ResourcesManager): ResourcesManager {.`static`.}
  proc getInstance*(): ResourcesManager {.`static`.}
  proc invalidatePath*(path: string)
  proc getConfiguration*(): Configuration
  proc getDisplayMetrics*(): DisplayMetrics
  proc getDisplayMetrics*(displayId: jint, da: DisplayAdjustments): DisplayMetrics
  proc applyCompatConfiguration*(displayDensity: jint, compatConfiguration: Configuration): jboolean
  proc getAdjustedDisplay*(displayId: jint, resources: Resources): Display
  proc initializeApplicationPaths*(sourceDir: string, splitDirs: seq[string])
  proc loadApkAssets*(key: ApkKey): ApkAssets
  proc dump*(prefix: string, printWriter: PrintWriter)
  proc isSameResourcesOverrideConfig*(activityToken: IBinder, overrideConfig: Configuration): jboolean
  proc createBaseTokenResources*(token: IBinder, resDir: string, splitResDirs: seq[string], legacyOverlayDirs: seq[string], overlayPaths: seq[string], libDirs: seq[string], displayId: jint, overrideConfig: Configuration, compatInfo: CompatibilityInfo, classLoader: ClassLoader, loaders: List[ResourcesLoader]): Resources
  proc getResources*(activityToken: IBinder, resDir: string, splitResDirs: seq[string], legacyOverlayDirs: seq[string], overlayPaths: seq[string], libDirs: seq[string], overrideDisplayId: Integer, overrideConfig: Configuration, compatInfo: CompatibilityInfo, classLoader: ClassLoader, loaders: List[ResourcesLoader]): Resources
  proc updateResourcesForActivity*(activityToken: IBinder, overrideConfig: Configuration, displayId: jint)
  proc appendPendingAppInfoUpdate*(oldSourceDirs: seq[string], appInfo: ApplicationInfo)
  proc applyAllPendingAppInfoUpdates*()
  proc applyConfigurationToResources*(config: Configuration, compat: CompatibilityInfo): jboolean
  proc appendLibAssetForMainAssetPath*(assetPath: string, libAsset: string)
  proc appendLibAssetsForMainAssetPath*(assetPath: string, libAssets: seq[string])
  proc getLocaleConfig*(): LocaleConfig
  proc setLocaleConfig*(localeConfig: LocaleConfig)
  proc registerAllResourcesReference*(resources: Resources)
  RESOURCE_CACHE_DIR*: string {.`static`.}

jclass android.app.ResourcesManager.ApkKey* of JVMObject:
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string

jclass android.app.ResourcesManager.SharedLibraryAssets* of JVMObject:
  proc getResourcesKey*(): ResourcesKey

jclass android.app.ApkKey* of JVMObject:
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  path*: string
  sharedLib*: jboolean
  overlay*: jboolean

jclass android.app.SharedLibraryAssets* of JVMObject:
  proc getResourcesKey*(): ResourcesKey

