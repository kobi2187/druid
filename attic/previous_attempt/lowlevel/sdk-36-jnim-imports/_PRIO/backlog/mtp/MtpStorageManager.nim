import jnim

jclass android.mtp.MtpStorageManager* of JVMObject:
  proc close*()
  proc setSubdirectories*(subDirs: Set[string])
  proc addMtpStorage*(volume: StorageVolume, isHostWindows: Supplier[Boolean]): MtpStorage
  proc removeMtpStorage*(storage: MtpStorage)
  proc getByPath*(path: string): MtpObject
  proc getObject*(id: jint): MtpObject
  proc getStorageRoot*(id: jint): MtpObject
  proc getObjects*(parent: jint, format: jint, storageId: jint): List[MtpObject]
  proc flushEvents*()
  proc dump*()
  proc checkConsistency*(): jboolean
  proc beginSendObject*(parent: MtpObject, name: string, format: jint): jint
  proc endSendObject*(obj: MtpObject, succeeded: jboolean): jboolean
  proc beginRenameObject*(obj: MtpObject, newName: string): jboolean
  proc endRenameObject*(obj: MtpObject, oldName: string, success: jboolean): jboolean
  proc beginRemoveObject*(obj: MtpObject): jboolean
  proc endRemoveObject*(obj: MtpObject, success: jboolean): jboolean
  proc beginMoveObject*(obj: MtpObject, newParent: MtpObject): jboolean
  proc endMoveObject*(oldParent: MtpObject, newParent: MtpObject, name: string, success: jboolean): jboolean
  proc beginCopyObject*(object: MtpObject, newParent: MtpObject): jint
  proc endCopyObject*(object: MtpObject, success: jboolean): jboolean
  sDebug*: jboolean {.`static`.}

jclass android.mtp.MtpStorageManager.MtpObject* of JVMObject:
  proc getName*(): string
  proc getId*(): jint
  proc isDir*(): jboolean
  proc getFormat*(): jint
  proc getStorageId*(): jint
  proc getModifiedTime*(): jlong
  proc getParent*(): MtpObject
  proc getRoot*(): MtpObject
  proc getSize*(): jlong
  proc getPath*(): Path
  proc isRoot*(): jboolean
  proc getVolumeName*(): string

jclass android.mtp.MtpStorageManager.MtpNotifier* of JVMObject:
  proc sendObjectAdded*(id: jint)
  proc sendObjectRemoved*(id: jint)
  proc sendObjectInfoChanged*(id: jint)

jclass android.mtp.MtpObject* of JVMObject:
  proc getName*(): string
  proc getId*(): jint
  proc isDir*(): jboolean
  proc getFormat*(): jint
  proc getStorageId*(): jint
  proc getModifiedTime*(): jlong
  proc getParent*(): MtpObject
  proc getRoot*(): MtpObject
  proc getSize*(): jlong
  proc getPath*(): Path
  proc isRoot*(): jboolean
  proc getVolumeName*(): string

jclass android.mtp.MtpNotifier* of JVMObject:
  proc sendObjectAdded*(id: jint)
  proc sendObjectRemoved*(id: jint)
  proc sendObjectInfoChanged*(id: jint)

