import jnim

jclass android.system.UnixSocketAddress* of SocketAddress:
  proc createAbstract*(name: string): UnixSocketAddress {.`static`.}
  proc createFileSystem*(pathName: string): UnixSocketAddress {.`static`.}
  proc createUnnamed*(): UnixSocketAddress {.`static`.}
  proc getSunPath*(): seq[jbyte]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

