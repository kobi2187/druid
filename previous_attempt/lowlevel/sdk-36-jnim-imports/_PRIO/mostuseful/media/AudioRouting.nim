import jnim

jclass android.media.AudioRouting* of JVMObject:
  proc setPreferredDevice*(deviceInfo: AudioDeviceInfo): jboolean
  proc getPreferredDevice*(): AudioDeviceInfo
  proc getRoutedDevice*(): AudioDeviceInfo
  proc addOnRoutingChangedListener*(listener: OnRoutingChangedListener, handler: Handler)
  proc removeOnRoutingChangedListener*(listener: OnRoutingChangedListener)

jclass android.media.AudioRouting.OnRoutingChangedListener* of JVMObject:
  proc onRoutingChanged*(router: AudioRouting)

jclass android.media.OnRoutingChangedListener* of JVMObject:
  proc onRoutingChanged*(router: AudioRouting)

