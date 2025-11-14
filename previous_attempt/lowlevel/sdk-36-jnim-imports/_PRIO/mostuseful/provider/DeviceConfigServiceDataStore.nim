import jnim

jclass android.provider.DeviceConfigServiceDataStore* of JVMObject:
  proc getProperties*(namespace: string, names: string): DeviceConfig.Properties
  proc setProperties*(properties: DeviceConfig.Properties): jboolean
  proc setProperty*(namespace: string, name: string, value: string, makeDefault: jboolean): jboolean
  proc deleteProperty*(namespace: string, name: string): jboolean
  proc resetToDefaults*(resetMode: jint, namespace: string)
  proc setSyncDisabledMode*(syncDisabledMode: jint)
  proc getSyncDisabledMode*(): jint
  proc setMonitorCallback*(resolver: ContentResolver, executor: Executor, callback: DeviceConfig.MonitorCallback)
  proc clearMonitorCallback*(resolver: ContentResolver)
  proc registerContentObserver*(namespace: string, notifyForDescendants: jboolean, contentObserver: ContentObserver)
  proc unregisterContentObserver*(contentObserver: ContentObserver)

