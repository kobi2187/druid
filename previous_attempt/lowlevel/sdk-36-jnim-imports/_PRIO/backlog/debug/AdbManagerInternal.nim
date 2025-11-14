import jnim

jclass android.debug.AdbManagerInternal* of JVMObject:
  proc registerTransport*(transport: IAdbTransport)
  proc unregisterTransport*(transport: IAdbTransport)
  proc isAdbEnabled*(transportType: jbyte): jboolean
  proc getAdbKeysFile*(): File
  proc getAdbTempKeysFile*(): File
  proc notifyKeyFilesUpdated*()
  proc startAdbdForTransport*(transportType: jbyte)
  proc stopAdbdForTransport*(transportType: jbyte)

