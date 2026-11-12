import jnim

jclass android.os.ArtModuleServiceManager* of JVMObject:
  proc getArtdServiceRegisterer*(): ServiceRegisterer
  proc getArtdPreRebootServiceRegisterer*(): ServiceRegisterer
  proc getDexoptChrootSetupServiceRegisterer*(): ServiceRegisterer

jclass android.os.ArtModuleServiceManager.ServiceRegisterer* of JVMObject:
  proc waitForService*(): IBinder

jclass android.os.ServiceRegisterer* of JVMObject:
  proc waitForService*(): IBinder

