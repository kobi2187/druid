# location.nim - Location services

import android, options, times

type
  LocationMode* = enum
    ## Balance between accuracy and power consumption
    BatterySaving,    # Cell and WiFi only
    Balanced,         # Mix of providers based on conditions
    HighAccuracy      # Forced GPS usage
    
  LocationAccuracy* = enum
    ## Granularity of location data
    Low,      # >500m accuracy
    Medium,   # ~100m accuracy 
    High,     # ~10m accuracy
    Precise   # <5m accuracy, highest power consumption
  
  LocationUpdateFrequency* = object
    ## Controls timing of location updates
    interval*: Duration     # Time between updates
    fastestInterval*: Duration  # Fastest updates from other apps
    maxWaitTime*: Duration  # For batching updates (API 24+)
    minDistance*: float     # Min movement distance to trigger update
    
  LocationRequest* = ref object
    ## Internal configuration for location requests
    id*: string
    priority*: int  # Maps to Android constants
    updateFrequency*: LocationUpdateFrequency
    
  Location* = object
    ## Location data structure
    latitude*, longitude*: float
    accuracy*: float
    altitude*: Option[float]
    speed*: Option[float]
    bearing*: Option[float]
    time*: Time
    provider*: string
    
  LocationListener* = proc(location: Location)
  
  GeofenceType* = enum
    Enter, Exit, Dwell
    
  GeofenceRequest* = object
    id*: string
    lat*, lng*: float
    radius*: float
    expirationDuration*: Option[Duration]
    loiteringDelay*: Option[int]  # In milliseconds
    types*: set[GeofenceType]
    
  GeofenceListener* = proc(geofenceId: string, transitionType: GeofenceType)
  
  LocationManager* = ref object of Manager
    locationListeners: Table[string, LocationListener]
    geofenceListeners: Table[string, GeofenceListener]
    activeRequests: Table[string, LocationRequest]
    geofences: HashSet[string]
    locationMode: LocationMode
    fusedLocationClient: pointer  # JNI reference
    geofencingClient: pointer     # JNI reference

# Constructor
proc newLocationManager*(context: Context): LocationManager
  ## Creates a new location manager
  ## Under API 28, uses legacy LocationManager
  ## API 28+ uses FusedLocationProviderClient

# Core location APIs
proc setLocationMode*(m: LocationManager, mode: LocationMode): bool
  ## Sets location mode system-wide
  ## Requires ACCESS_FINE_LOCATION permission
  ## On API 28+, changes need WRITE_SECURE_SETTINGS

proc getLastKnownLocation*(m: LocationManager): Option[Location]
  ## Gets last known location from best provider
  ## API 30+ requires location permissions to be granted

proc requestLocationUpdates*(m: LocationManager, 
                            requestId: string,
                            accuracy: LocationAccuracy,
                            frequency: LocationUpdateFrequency,
                            listener: LocationListener): bool
  ## Requests continuous location updates
  ## Pre-API 26: Uses legacy LocationManager
  ## API 26-28: Uses FusedLocationProviderClient
  ## API 29+: Requires foreground service for background updates

proc requestBackgroundLocationUpdates*(m: LocationManager,
                                     requestId: string,
                                     accuracy: LocationAccuracy,
                                     frequency: LocationUpdateFrequency,
                                     notificationInfo: NotificationInfo,
                                     listener: LocationListener): bool
  ## Automatically creates foreground service for background location
  ## API 29+: Requires ACCESS_BACKGROUND_LOCATION
  ## API 31+: Requires specific foreground service type declaration

proc cancelLocationUpdates*(m: LocationManager, requestId: string)
  ## Cancels location updates for the given request ID

# Geofencing APIs
proc addGeofence*(m: LocationManager,
                 request: GeofenceRequest,
                 listener: GeofenceListener): bool
  ## Adds a geofence
  ## API 26+: Recommended minimum for reliability
  ## API 29+: Requires location permissions to be granted
  ## API 31+: May require background location permission
    
proc removeGeofence*(m: LocationManager, geofenceId: string)
  ## Removes a specific geofence

proc removeAllGeofences*(m: LocationManager)
  ## Removes all active geofences

# Low-level configuration for power optimization
proc setLocationPowerSaveMode*(m: LocationManager, enabled: bool)
  ## Enables/disables location power saving mode
  ## API 28+: Maps to LocationRequest.setPriority with PRIORITY_LOW_POWER