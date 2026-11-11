import jnim

jclass android.provider.SyncStateContract.Helpers* of JVMObject:
  proc get*(provider: ContentProviderClient, uri: Uri, account: Account): seq[jbyte] {.`static`.}
  proc set*(provider: ContentProviderClient, uri: Uri, account: Account, data: seq[jbyte]) {.`static`.}
  proc insert*(provider: ContentProviderClient, uri: Uri, account: Account, data: seq[jbyte]): Uri {.`static`.}
  proc update*(provider: ContentProviderClient, uri: Uri, data: seq[jbyte]) {.`static`.}
  proc getWithUri*(provider: ContentProviderClient, uri: Uri, account: Account): Pair[Uri, seq[jbyte]] {.`static`.}
  proc newSetOperation*(uri: Uri, account: Account, data: seq[jbyte]): ContentProviderOperation {.`static`.}
  proc newUpdateOperation*(uri: Uri, data: seq[jbyte]): ContentProviderOperation {.`static`.}

jclass android.provider.Columns* of BaseColumns:
  ACCOUNT_NAME*: string {.`static`.}
  ACCOUNT_TYPE*: string {.`static`.}
  DATA*: string {.`static`.}

jclass android.provider.Constants* of JVMObject:
  CONTENT_DIRECTORY*: string {.`static`.}

jclass android.provider.Helpers* of JVMObject:
  proc get*(provider: ContentProviderClient, uri: Uri, account: Account): seq[jbyte] {.`static`.}
  proc set*(provider: ContentProviderClient, uri: Uri, account: Account, data: seq[jbyte]) {.`static`.}
  proc insert*(provider: ContentProviderClient, uri: Uri, account: Account, data: seq[jbyte]): Uri {.`static`.}
  proc update*(provider: ContentProviderClient, uri: Uri, data: seq[jbyte]) {.`static`.}
  proc getWithUri*(provider: ContentProviderClient, uri: Uri, account: Account): Pair[Uri, seq[jbyte]] {.`static`.}
  proc newSetOperation*(uri: Uri, account: Account, data: seq[jbyte]): ContentProviderOperation {.`static`.}
  proc newUpdateOperation*(uri: Uri, data: seq[jbyte]): ContentProviderOperation {.`static`.}

