import jnim

jclass android.app.UriGrantsManager* of JVMObject:
  proc getService*(): IUriGrantsManager {.`static`.}
  proc clearGrantedUriPermissions*(packageName: string)
  proc getGrantedUriPermissions*(packageName: string): ParceledListSlice[GrantedUriPermission]

