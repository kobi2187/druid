import jnim

jclass android.adservices.AdServicesFrameworkHelper* of JVMObject:
  proc getExceptionStackTraceString*(e: Throwable): string {.`static`.}

