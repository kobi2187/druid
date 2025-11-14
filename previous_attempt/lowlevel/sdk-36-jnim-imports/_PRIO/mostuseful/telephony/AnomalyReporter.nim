import jnim

jclass android.telephony.AnomalyReporter* of JVMObject:
  proc reportAnomaly*(eventId: UUID, description: string) {.`static`.}
  proc reportAnomaly*(eventId: UUID, description: string, carrierId: jint) {.`static`.}
  proc initialize*(context: Context) {.`static`.}
  proc dump*(fd: FileDescriptor, printWriter: PrintWriter, args: seq[string]) {.`static`.}

