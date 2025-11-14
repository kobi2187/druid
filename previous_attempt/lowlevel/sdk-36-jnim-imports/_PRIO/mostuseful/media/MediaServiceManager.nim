import jnim

jclass android.media.MediaServiceManager* of JVMObject:
  proc getMediaSessionServiceRegisterer*(): ServiceRegisterer
  proc getMediaTranscodingServiceRegisterer*(): ServiceRegisterer
  proc getMediaCommunicationServiceRegisterer*(): ServiceRegisterer

jclass android.media.MediaServiceManager.ServiceRegisterer* of JVMObject:
  proc get*(): IBinder

jclass android.media.ServiceRegisterer* of JVMObject:
  proc get*(): IBinder

