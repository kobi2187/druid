import jnim

jclass android.accounts.AccountManagerInternal* of JVMObject:
  proc requestAccountAccess*(account: Account, packageName: string, userId: jint, callback: RemoteCallback)
  proc hasAccountAccess*(account: Account, uid: jint): jboolean
  proc addOnAppPermissionChangeListener*(listener: OnAppPermissionChangeListener)
  proc backupAccountAccessPermissions*(userId: jint): seq[jbyte]
  proc restoreAccountAccessPermissions*(data: seq[jbyte], userId: jint)

jclass android.accounts.AccountManagerInternal.OnAppPermissionChangeListener* of JVMObject:
  proc onAppPermissionChanged*(account: Account, uid: jint)

jclass android.accounts.OnAppPermissionChangeListener* of JVMObject:
  proc onAppPermissionChanged*(account: Account, uid: jint)

