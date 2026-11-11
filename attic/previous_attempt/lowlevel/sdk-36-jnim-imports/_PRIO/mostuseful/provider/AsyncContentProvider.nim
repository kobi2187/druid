import jnim

jclass android.provider.AsyncContentProvider* of JVMObject:
  proc openMedia*(uri: Uri, mode: string): ParcelFileDescriptor

