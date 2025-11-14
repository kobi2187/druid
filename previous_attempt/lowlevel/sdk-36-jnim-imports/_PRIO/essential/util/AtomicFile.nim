import jnim

jclass android.util.AtomicFile* of JVMObject:
  proc getBaseFile*(): File
  proc delete*()
  proc startWrite*(): FileOutputStream
  proc startWrite*(startTime: jlong): FileOutputStream
  proc finishWrite*(str: FileOutputStream)
  proc failWrite*(str: FileOutputStream)
  proc truncate*()
  proc openAppend*(): FileOutputStream
  proc openRead*(): FileInputStream
  proc exists*(): jboolean
  proc getLastModifiedTime*(): jlong
  proc readFully*(): seq[jbyte]
  proc write*(writeContent: Consumer[FileOutputStream])
  proc toString*(): string

