import jnim

jclass android.media.AudioDeviceCallback* of JVMObject:
  proc onAudioDevicesAdded*(addedDevices: seq[AudioDeviceInfo])
  proc onAudioDevicesRemoved*(removedDevices: seq[AudioDeviceInfo])

