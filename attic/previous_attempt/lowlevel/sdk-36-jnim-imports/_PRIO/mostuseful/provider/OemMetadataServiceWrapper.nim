import jnim

jclass android.provider.OemMetadataServiceWrapper* of JVMObject:
  proc getSupportedMimeTypes*(): Set[string]
  proc getOemCustomData*(pfd: ParcelFileDescriptor): Map[string, string]

