import jnim

jclass android.app.PackageInstallObserver* of JVMObject:
  proc getBinder*(): IPackageInstallObserver2
  proc onUserActionRequired*(intent: Intent)
  proc onPackageInstalled*(basePackageName: string, returnCode: jint, msg: string, extras: Bundle)

