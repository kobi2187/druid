import jnim

jclass android.content.EventLogTags* of JVMObject:
  proc writeContentQuerySample*(uri: string, projection: string, selection: string, sortorder: string, time: jint, blockingPackage: string, samplePercent: jint) {.`static`.}
  proc writeContentUpdateSample*(uri: string, operation: string, selection: string, time: jint, blockingPackage: string, samplePercent: jint) {.`static`.}
  proc writeBinderSample*(descriptor: string, methodNum: jint, time: jint, blockingPackage: string, samplePercent: jint) {.`static`.}
  CONTENT_QUERY_SAMPLE*: jint {.`static`.}
  CONTENT_UPDATE_SAMPLE*: jint {.`static`.}
  BINDER_SAMPLE*: jint {.`static`.}

