import jnim

jclass android.content.ContentUris* of JVMObject:
  proc parseId*(contentUri: Uri): jlong {.`static`.}
  proc appendId*(builder: Uri.Builder, id: jlong): Uri.Builder {.`static`.}
  proc withAppendedId*(contentUri: Uri, id: jlong): Uri {.`static`.}
  proc removeId*(contentUri: Uri): Uri {.`static`.}

