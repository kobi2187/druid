import jnim

jclass android.app.BackgroundInstallControlManager* of JVMObject:
  proc getBackgroundInstalledPackages*(flags: jlong): List[PackageInfo]

