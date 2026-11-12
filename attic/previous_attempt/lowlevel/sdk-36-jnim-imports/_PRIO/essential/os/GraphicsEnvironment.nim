import jnim

jclass android.os.GraphicsEnvironment* of JVMObject:
  proc getInstance*(): GraphicsEnvironment {.`static`.}
  proc setup*(context: Context, coreSettings: Bundle)
  proc toggleAngleAsSystemDriver*(enabled: jboolean)
  proc setLayerPaths*(classLoader: ClassLoader, searchPaths: string, permittedPaths: string)
  proc getDebugLayerPathsFromSettings*(coreSettings: Bundle, pm: IPackageManager, packageName: string, ai: ApplicationInfo): string
  proc showAngleInUseDialogBox*(context: Context)
  proc hintActivityLaunch*() {.`static`.}

