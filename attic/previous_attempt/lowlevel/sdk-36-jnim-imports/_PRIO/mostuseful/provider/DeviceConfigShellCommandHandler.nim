import jnim

jclass android.provider.DeviceConfigShellCommandHandler* of JVMObject:
  proc handleShellCommand*(inPfd: ParcelFileDescriptor, outPfd: ParcelFileDescriptor, errPfd: ParcelFileDescriptor, args: seq[string]): jint {.`static`.}

