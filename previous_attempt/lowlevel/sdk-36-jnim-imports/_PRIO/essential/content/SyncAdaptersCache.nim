import jnim

jclass android.content.SyncAdaptersCache* of RegisteredServicesCache:
  proc parseServiceAttributes*(res: Resources, packageName: string, attrs: AttributeSet): SyncAdapterType
  proc getSyncAdapterPackagesForAuthority*(authority: string, userId: jint): seq[string]

