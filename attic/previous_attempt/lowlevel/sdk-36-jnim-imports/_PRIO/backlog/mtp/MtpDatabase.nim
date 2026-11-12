import jnim

jclass android.mtp.MtpDatabase* of JVMObject:
  proc getObjectPropertiesUri*(format: jint, volumeName: string): Uri {.`static`.}
  proc setServer*(server: MtpServer)
  proc getContext*(): Context
  proc close*()
  proc addStorage*(storage: StorageVolume)
  proc removeStorage*(storage: StorageVolume)
  proc beginSendObject*(path: string, format: jint, parent: jint, storageId: jint): jint
  proc getNumObjects*(storageID: jint, format: jint, parent: jint): jint
  proc getThumbnailInfo*(handle: jint, outLongs: seq[jlong]): jboolean
  proc getThumbnailData*(handle: jint): seq[jbyte]

