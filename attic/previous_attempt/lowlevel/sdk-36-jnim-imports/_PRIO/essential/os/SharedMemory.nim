import jnim

jclass android.os.SharedMemory* of JVMObject:
  proc create*(name: string, size: jint): SharedMemory {.`static`.}
  proc fromFileDescriptor*(fd: ParcelFileDescriptor): SharedMemory {.`static`.}
  proc setProtect*(prot: jint): jboolean
  proc getFileDescriptor*(): FileDescriptor
  proc getFd*(): jint
  proc getSize*(): jint
  proc mapReadWrite*(): ByteBuffer
  proc mapReadOnly*(): ByteBuffer
  proc map*(prot: jint, offset: jint, length: jint): ByteBuffer
  proc unmap*(buffer: ByteBuffer) {.`static`.}
  proc close*()
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getFdDup*(): ParcelFileDescriptor
  CREATOR*: Parcelable.Creator[SharedMemory] {.`static`.}

