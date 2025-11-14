import jnim

jclass android.provider.DeviceConfigManager* of JVMObject:
  proc getProperties*(namespace: string, names: string): DeviceConfig.Properties
  proc setProperties*(namespace: string, values: Map[string, string]): jboolean
  proc setProperty*(namespace: string, name: string, value: string, makeDefault: jboolean): jboolean
  proc deleteProperty*(namespace: string, name: string): jboolean

