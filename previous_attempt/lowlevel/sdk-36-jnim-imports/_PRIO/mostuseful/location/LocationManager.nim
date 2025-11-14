import jnim

jclass android.location.LocationManager* of JVMObject:
  proc getBackgroundThrottlingWhitelist*(): seq[string]
  proc getIgnoreSettingsWhitelist*(): seq[string]
  proc getIgnoreSettingsAllowlist*(): PackageTagsList
  proc getAdasAllowlist*(): PackageTagsList
  proc getExtraLocationControllerPackage*(): string
  proc setExtraLocationControllerPackage*(packageName: string)
  proc setExtraLocationControllerPackageEnabled*(enabled: jboolean)
  proc isExtraLocationControllerPackageEnabled*(): jboolean
  proc setLocationControllerExtraPackage*(packageName: string)
  proc setLocationControllerExtraPackageEnabled*(enabled: jboolean)
  proc isLocationEnabled*(): jboolean
  proc isLocationEnabledForUser*(userHandle: UserHandle): jboolean
  proc setLocationEnabledForUser*(enabled: jboolean, userHandle: UserHandle)
  proc isAdasGnssLocationEnabled*(): jboolean
  proc setAdasGnssLocationEnabled*(enabled: jboolean)
  proc isProviderEnabled*(provider: string): jboolean
  proc isProviderEnabledForUser*(provider: string, userHandle: UserHandle): jboolean
  proc setProviderEnabledForUser*(provider: string, enabled: jboolean, userHandle: UserHandle): jboolean
  proc setAutomotiveGnssSuspended*(suspended: jboolean)
  proc isAutomotiveGnssSuspended*(): jboolean
  proc getLastLocation*(): Location
  proc getLastKnownLocation*(provider: string): Location
  proc getLastKnownLocation*(provider: string, lastLocationRequest: LastLocationRequest): Location
  proc getCurrentLocation*(provider: string, cancellationSignal: CancellationSignal, executor: Executor, consumer: Consumer[Location])
  proc getCurrentLocation*(locationRequest: LocationRequest, cancellationSignal: CancellationSignal, executor: Executor, consumer: Consumer[Location])
  proc getCurrentLocation*(provider: string, locationRequest: LocationRequest, cancellationSignal: CancellationSignal, executor: Executor, consumer: Consumer[Location])
  proc requestSingleUpdate*(provider: string, listener: LocationListener, looper: Looper)
  proc requestSingleUpdate*(criteria: Criteria, listener: LocationListener, looper: Looper)
  proc requestSingleUpdate*(provider: string, pendingIntent: PendingIntent)
  proc requestSingleUpdate*(criteria: Criteria, pendingIntent: PendingIntent)
  proc requestLocationUpdates*(provider: string, minTimeMs: jlong, minDistanceM: jfloat, listener: LocationListener)
  proc requestLocationUpdates*(provider: string, minTimeMs: jlong, minDistanceM: jfloat, listener: LocationListener, looper: Looper)
  proc requestLocationUpdates*(provider: string, minTimeMs: jlong, minDistanceM: jfloat, executor: Executor, listener: LocationListener)
  proc requestLocationUpdates*(minTimeMs: jlong, minDistanceM: jfloat, criteria: Criteria, listener: LocationListener, looper: Looper)
  proc requestLocationUpdates*(minTimeMs: jlong, minDistanceM: jfloat, criteria: Criteria, executor: Executor, listener: LocationListener)
  proc requestLocationUpdates*(provider: string, minTimeMs: jlong, minDistanceM: jfloat, pendingIntent: PendingIntent)
  proc requestLocationUpdates*(minTimeMs: jlong, minDistanceM: jfloat, criteria: Criteria, pendingIntent: PendingIntent)
  proc requestLocationUpdates*(locationRequest: LocationRequest, listener: LocationListener, looper: Looper)
  proc requestLocationUpdates*(locationRequest: LocationRequest, executor: Executor, listener: LocationListener)
  proc requestLocationUpdates*(locationRequest: LocationRequest, pendingIntent: PendingIntent)
  proc requestLocationUpdates*(provider: string, locationRequest: LocationRequest, executor: Executor, listener: LocationListener)
  proc requestLocationUpdates*(provider: string, locationRequest: LocationRequest, pendingIntent: PendingIntent)
  proc injectLocation*(location: Location): jboolean
  proc requestFlush*(provider: string, listener: LocationListener, requestCode: jint)
  proc requestFlush*(provider: string, pendingIntent: PendingIntent, requestCode: jint)
  proc removeUpdates*(listener: LocationListener)
  proc removeUpdates*(pendingIntent: PendingIntent)
  proc hasProvider*(provider: string): jboolean
  proc getAllProviders*(): List[string]
  proc getProviders*(enabledOnly: jboolean): List[string]
  proc getProviders*(criteria: Criteria, enabledOnly: jboolean): List[string]
  proc getBestProvider*(criteria: Criteria, enabledOnly: jboolean): string
  proc getProvider*(provider: string): LocationProvider
  proc getProviderProperties*(provider: string): ProviderProperties
  proc isProviderPackage*(packageName: string): jboolean
  proc isProviderPackage*(provider: string, packageName: string): jboolean
  proc isProviderPackage*(provider: string, packageName: string, attributionTag: string): jboolean
  proc getProviderPackages*(provider: string): List[string]
  proc sendExtraCommand*(provider: string, command: string, extras: Bundle): jboolean
  proc addTestProvider*(provider: string, requiresNetwork: jboolean, requiresSatellite: jboolean, requiresCell: jboolean, hasMonetaryCost: jboolean, supportsAltitude: jboolean, supportsSpeed: jboolean, supportsBearing: jboolean, powerUsage: jint, accuracy: jint)
  proc addTestProvider*(provider: string, properties: ProviderProperties)
  proc addTestProvider*(provider: string, properties: ProviderProperties, extraAttributionTags: Set[string])
  proc removeTestProvider*(provider: string)
  proc setTestProviderLocation*(provider: string, location: Location)
  proc clearTestProviderLocation*(provider: string)
  proc setTestProviderEnabled*(provider: string, enabled: jboolean)
  proc clearTestProviderEnabled*(provider: string)
  proc setTestProviderStatus*(provider: string, status: jint, extras: Bundle, updateTime: jlong)
  proc clearTestProviderStatus*(provider: string)
  proc addProximityAlert*(latitude: jdouble, longitude: jdouble, radius: jfloat, expiration: jlong, pendingIntent: PendingIntent)
  proc removeProximityAlert*(intent: PendingIntent)
  proc getGnssCapabilities*(): GnssCapabilities
  proc getGnssYearOfHardware*(): jint
  proc getGnssHardwareModelName*(): string
  proc getGnssAntennaInfos*(): List[GnssAntennaInfo]
  proc getGpsStatus*(status: GpsStatus): GpsStatus
  proc addGpsStatusListener*(listener: GpsStatus.Listener): jboolean
  proc removeGpsStatusListener*(listener: GpsStatus.Listener)
  proc registerGnssStatusCallback*(callback: GnssStatus.Callback): jboolean
  proc registerGnssStatusCallback*(callback: GnssStatus.Callback, handler: Handler): jboolean
  proc registerGnssStatusCallback*(executor: Executor, callback: GnssStatus.Callback): jboolean
  proc unregisterGnssStatusCallback*(callback: GnssStatus.Callback)
  proc addNmeaListener*(listener: GpsStatus.NmeaListener): jboolean
  proc removeNmeaListener*(listener: GpsStatus.NmeaListener)
  proc addNmeaListener*(listener: OnNmeaMessageListener): jboolean
  proc addNmeaListener*(listener: OnNmeaMessageListener, handler: Handler): jboolean
  proc addNmeaListener*(executor: Executor, listener: OnNmeaMessageListener): jboolean
  proc removeNmeaListener*(listener: OnNmeaMessageListener)
  proc addGpsMeasurementListener*(listener: GpsMeasurementsEvent.Listener): jboolean
  proc removeGpsMeasurementListener*(listener: GpsMeasurementsEvent.Listener)
  proc registerGnssMeasurementsCallback*(callback: GnssMeasurementsEvent.Callback): jboolean
  proc registerGnssMeasurementsCallback*(callback: GnssMeasurementsEvent.Callback, handler: Handler): jboolean
  proc registerGnssMeasurementsCallback*(executor: Executor, callback: GnssMeasurementsEvent.Callback): jboolean
  proc registerGnssMeasurementsCallback*(request: GnssRequest, executor: Executor, callback: GnssMeasurementsEvent.Callback): jboolean
  proc registerGnssMeasurementsCallback*(request: GnssMeasurementRequest, executor: Executor, callback: GnssMeasurementsEvent.Callback): jboolean
  proc injectGnssMeasurementCorrections*(measurementCorrections: GnssMeasurementCorrections)
  proc unregisterGnssMeasurementsCallback*(callback: GnssMeasurementsEvent.Callback)
  proc registerAntennaInfoListener*(executor: Executor, listener: GnssAntennaInfo.Listener): jboolean
  proc unregisterAntennaInfoListener*(listener: GnssAntennaInfo.Listener)
  proc addGpsNavigationMessageListener*(listener: GpsNavigationMessageEvent.Listener): jboolean
  proc removeGpsNavigationMessageListener*(listener: GpsNavigationMessageEvent.Listener)
  proc registerGnssNavigationMessageCallback*(callback: GnssNavigationMessage.Callback): jboolean
  proc registerGnssNavigationMessageCallback*(callback: GnssNavigationMessage.Callback, handler: Handler): jboolean
  proc registerGnssNavigationMessageCallback*(executor: Executor, callback: GnssNavigationMessage.Callback): jboolean
  proc unregisterGnssNavigationMessageCallback*(callback: GnssNavigationMessage.Callback)
  proc addProviderRequestChangedListener*(executor: Executor, listener: ChangedListener)
  proc removeProviderRequestChangedListener*(listener: ProviderRequest.ChangedListener)
  proc getGnssBatchSize*(): jint
  proc registerGnssBatchedLocationCallback*(periodNanos: jlong, wakeOnFifoFull: jboolean, callback: BatchedLocationCallback, handler: Handler): jboolean
  proc flushGnssBatch*()
  proc unregisterGnssBatchedLocationCallback*(callback: BatchedLocationCallback): jboolean
  proc invalidateLocalLocationEnabledCaches*() {.`static`.}
  proc disableLocalLocationEnabledCaches*() {.`static`.}
  BLOCK_IMMUTABLE_PENDING_INTENTS*: jlong {.`static`.}
  BLOCK_PENDING_INTENT_SYSTEM_API_USAGE*: jlong {.`static`.}
  DELIVER_HISTORICAL_LOCATIONS*: jlong {.`static`.}
  GET_PROVIDER_SECURITY_EXCEPTIONS*: jlong {.`static`.}
  BLOCK_UNTARGETED_PENDING_INTENTS*: jlong {.`static`.}
  BLOCK_INCOMPLETE_LOCATIONS*: jlong {.`static`.}
  BLOCK_GPS_STATUS_USAGE*: jlong {.`static`.}
  NETWORK_PROVIDER*: string {.`static`.}
  GPS_PROVIDER*: string {.`static`.}
  GPS_HARDWARE_PROVIDER*: string {.`static`.}
  PASSIVE_PROVIDER*: string {.`static`.}
  FUSED_PROVIDER*: string {.`static`.}
  KEY_PROXIMITY_ENTERING*: string {.`static`.}
  KEY_STATUS_CHANGED*: string {.`static`.}
  KEY_PROVIDER_ENABLED*: string {.`static`.}
  KEY_LOCATION_CHANGED*: string {.`static`.}
  KEY_LOCATIONS*: string {.`static`.}
  KEY_FLUSH_COMPLETE*: string {.`static`.}
  PROVIDERS_CHANGED_ACTION*: string {.`static`.}
  EXTRA_PROVIDER_NAME*: string {.`static`.}
  EXTRA_PROVIDER_ENABLED*: string {.`static`.}
  MODE_CHANGED_ACTION*: string {.`static`.}
  EXTRA_LOCATION_ENABLED*: string {.`static`.}
  ACTION_ADAS_GNSS_ENABLED_CHANGED*: string {.`static`.}
  EXTRA_ADAS_GNSS_ENABLED*: string {.`static`.}
  HIGH_POWER_REQUEST_CHANGE_ACTION*: string {.`static`.}
  ACTION_GNSS_CAPABILITIES_CHANGED*: string {.`static`.}
  EXTRA_GNSS_CAPABILITIES*: string {.`static`.}
  SETTINGS_FOOTER_DISPLAYED_ACTION*: string {.`static`.}
  METADATA_SETTINGS_FOOTER_STRING*: string {.`static`.}
  METADATA_SETTINGS_FOOTER_HTML*: string {.`static`.}

