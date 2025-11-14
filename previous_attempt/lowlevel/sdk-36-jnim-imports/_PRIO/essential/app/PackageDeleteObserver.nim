import jnim

jclass android.app.PackageDeleteObserver* of JVMObject:
  proc getBinder*(): IPackageDeleteObserver2
  proc onUserActionRequired*(intent: Intent)
  proc onPackageDeleted*(basePackageName: string, returnCode: jint, msg: string)

