import jnim

jclass android.os.HidlMemoryUtil* of JVMObject:
  proc byteArrayToHidlMemory*(input: seq[jbyte]): HidlMemory {.`static`.}
  proc byteArrayToHidlMemory*(input: seq[jbyte], name: string): HidlMemory {.`static`.}
  proc byteListToHidlMemory*(input: List[Byte]): HidlMemory {.`static`.}
  proc byteListToHidlMemory*(input: List[Byte], name: string): HidlMemory {.`static`.}
  proc hidlMemoryToByteArray*(mem: HidlMemory): seq[jbyte] {.`static`.}
  proc hidlMemoryToByteList*(mem: HidlMemory): ArrayList[Byte] {.`static`.}
  proc sharedMemoryToHidlMemory*(shmem: SharedMemory): HidlMemory {.`static`.}
  proc fileDescriptorToHidlMemory*(fd: FileDescriptor, size: jint): HidlMemory {.`static`.}

