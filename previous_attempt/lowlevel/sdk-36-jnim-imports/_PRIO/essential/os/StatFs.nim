import jnim

jclass android.os.StatFs* of JVMObject:
  proc restat*(path: string)
  proc getBlockSize*(): jint
  proc getBlockSizeLong*(): jlong
  proc getBlockCount*(): jint
  proc getBlockCountLong*(): jlong
  proc getFreeBlocks*(): jint
  proc getFreeBlocksLong*(): jlong
  proc getFreeBytes*(): jlong
  proc getAvailableBlocks*(): jint
  proc getAvailableBlocksLong*(): jlong
  proc getAvailableBytes*(): jlong
  proc getTotalBytes*(): jlong

