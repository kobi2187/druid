import jnim

jclass android.content.ApexEnvironment* of JVMObject:
  proc getApexEnvironment*(apexModuleName: string): ApexEnvironment {.`static`.}
  proc getDeviceProtectedDataDir*(): File
  proc getDeviceProtectedDataDirForUser*(user: UserHandle): File
  proc getCredentialProtectedDataDirForUser*(user: UserHandle): File

