import jnim

jclass android.inputmethodservice.ImsConfigurationTracker* of JVMObject:
  proc onInitialize*(handledConfigChanges: jint)
  proc onBindInput*(resources: Resources)
  proc setHandledConfigChanges*(configChanges: jint)
  proc onConfigurationChanged*(newConfig: Configuration, resetStateForNewConfigurationRunner: Runnable)

