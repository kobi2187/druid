import jnim

jclass android.app.AppGlobals* of JVMObject:
  proc getInitialApplication*(): Application {.`static`.}
  proc getInitialPackage*(): string {.`static`.}
  proc getPackageManager*(): IPackageManager {.`static`.}
  proc getPermissionManager*(): IPermissionManager {.`static`.}
  proc getIntCoreSetting*(key: string, defaultValue: jint): jint {.`static`.}
  proc getFloatCoreSetting*(key: string, defaultValue: jfloat): jfloat {.`static`.}

