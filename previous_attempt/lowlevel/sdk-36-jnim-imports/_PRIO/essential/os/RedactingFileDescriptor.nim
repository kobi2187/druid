import jnim

jclass android.os.RedactingFileDescriptor* of JVMObject:
  proc open*(context: Context, file: File, mode: jint, redactRanges: seq[jlong], freePositions: seq[jlong]): ParcelFileDescriptor {.`static`.}
  proc removeRange*(ranges: seq[jlong], start: jlong, end: jlong): seq[jlong] {.`static`.}

