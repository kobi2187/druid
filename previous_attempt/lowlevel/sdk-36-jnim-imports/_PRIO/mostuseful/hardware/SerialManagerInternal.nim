import jnim

jclass android.hardware.SerialManagerInternal* of JVMObject:
  proc addVirtualSerialPortForTest*(name: string, supplier: Supplier[ParcelFileDescriptor])
  proc removeVirtualSerialPortForTest*(name: string)

