import jnim

jclass android.os.ParcelFileDescriptor* of JVMObject:
  proc open*(file: File, mode: jint): ParcelFileDescriptor {.`static`.}
  proc open*(file: File, mode: jint, handler: Handler, listener: OnCloseListener): ParcelFileDescriptor {.`static`.}
  proc wrap*(pfd: ParcelFileDescriptor, handler: Handler, listener: OnCloseListener): ParcelFileDescriptor {.`static`.}
  proc fromFd*(fd: FileDescriptor, handler: Handler, listener: OnCloseListener): ParcelFileDescriptor {.`static`.}
  proc dup*(orig: FileDescriptor): ParcelFileDescriptor {.`static`.}
  proc dup*(): ParcelFileDescriptor
  proc fromFd*(fd: jint): ParcelFileDescriptor {.`static`.}
  proc adoptFd*(fd: jint): ParcelFileDescriptor {.`static`.}
  proc fromSocket*(socket: Socket): ParcelFileDescriptor {.`static`.}
  proc fromDatagramSocket*(datagramSocket: DatagramSocket): ParcelFileDescriptor {.`static`.}
  proc createPipe*(): seq[ParcelFileDescriptor] {.`static`.}
  proc createReliablePipe*(): seq[ParcelFileDescriptor] {.`static`.}
  proc createSocketPair*(): seq[ParcelFileDescriptor] {.`static`.}
  proc createSocketPair*(type: jint): seq[ParcelFileDescriptor] {.`static`.}
  proc createReliableSocketPair*(): seq[ParcelFileDescriptor] {.`static`.}
  proc createReliableSocketPair*(type: jint): seq[ParcelFileDescriptor] {.`static`.}
  proc fromData*(data: seq[jbyte], name: string): ParcelFileDescriptor {.`static`.}
  proc parseMode*(mode: string): jint {.`static`.}
  proc getFile*(fd: FileDescriptor): File {.`static`.}
  proc getFileDescriptor*(): FileDescriptor
  proc getStatSize*(): jlong
  proc seekTo*(pos: jlong): jlong
  proc getFd*(): jint
  proc detachFd*(): jint
  proc close*()
  proc closeWithError*(msg: string)
  proc releaseResources*()
  proc canDetectErrors*(): jboolean
  proc checkError*()
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  MODE_WORLD_READABLE*: jint {.`static`.}
  MODE_WORLD_WRITEABLE*: jint {.`static`.}
  MODE_READ_ONLY*: jint {.`static`.}
  MODE_WRITE_ONLY*: jint {.`static`.}
  MODE_READ_WRITE*: jint {.`static`.}
  MODE_CREATE*: jint {.`static`.}
  MODE_TRUNCATE*: jint {.`static`.}
  MODE_APPEND*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[ParcelFileDescriptor] {.`static`.}

jclass android.os.ParcelFileDescriptor.AutoCloseInputStream* of JVMObject:
  proc close*()
  proc read*(): jint
  proc read*(b: seq[jbyte]): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint

jclass android.os.ParcelFileDescriptor.AutoCloseOutputStream* of JVMObject:
  proc close*()

jclass android.os.ParcelFileDescriptor.OnCloseListener* of JVMObject:
  proc onClose*(e: IOException)

jclass android.os.AutoCloseInputStream* of FileInputStream:
  proc close*()
  proc read*(): jint
  proc read*(b: seq[jbyte]): jint
  proc read*(b: seq[jbyte], off: jint, len: jint): jint

jclass android.os.AutoCloseOutputStream* of FileOutputStream:
  proc close*()

jclass android.os.OnCloseListener* of JVMObject:
  proc onClose*(e: IOException)

jclass android.os.FileDescriptorDetachedException* of IOException:

