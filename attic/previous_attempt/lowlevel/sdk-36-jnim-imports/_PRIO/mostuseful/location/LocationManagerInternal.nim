import jnim

jclass android.location.LocationManagerInternal* of JVMObject:
  proc isProviderEnabledForUser*(provider: string, userId: jint): jboolean
  proc addProviderEnabledListener*(provider: string, listener: ProviderEnabledListener)
  proc removeProviderEnabledListener*(provider: string, listener: ProviderEnabledListener)
  proc isProvider*(provider: string, identity: CallerIdentity): jboolean
  proc getGnssTimeMillis*(): LocationTime
  proc setLocationPackageTagsListener*(listener: LocationPackageTagsListener)


