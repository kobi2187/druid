import jnim

jclass android.hardware.SerialPort* of JVMObject:
  proc open*(pfd: ParcelFileDescriptor, speed: jint)
  proc close*()
  proc getName*(): string
  proc read*(buffer: ByteBuffer): jint
  proc write*(buffer: ByteBuffer, length: jint)
  proc sendBreak*()

