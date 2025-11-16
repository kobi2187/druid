## SDK Location Manager - GPS and network location
##
## Uses Android SDK LocationManager API (Java)
##
## Provides:
## - Current location (GPS/Network)
## - Location updates with callbacks
## - Last known location
## - Provider status checking
## - Distance calculations
##
## TODO: FusedLocationProvider support (requires Google Play Services bindings)
## TODO: Geofencing support (requires additional Java APIs)
## TODO: Geocoding (address ↔ coordinates)

import ../../../core
import ../../../art  # For API level detection
import jnim
import asyncdispatch
import options
import times
import tables

# jnimport:
#   import android.content.Context
#   import android.location.LocationManager as JLM
#   import android.location.Location as JLocation
#   import android.location.LocationListener
#   import android.location.Criteria
#   import android.os.Bundle
#   import android.os.Looper
# 
type
  LocationAccuracy* = enum
    ## Location accuracy levels
    laCoarse = 0      ## City level (~2km) - COARSE permission
    laFine = 1        ## Street level (~100m) - FINE permission
    laHigh = 2        ## High accuracy (~10m) - GPS preferred
    laPrecise = 3     ## Precise GPS (~3m) - GPS only

  LocationProvider* = enum
    ## Location providers
    lpGps = 0         ## GPS provider (high accuracy, outdoor)
    lpNetwork = 1     ## Network provider (cell/WiFi, faster)
    lpPassive = 2     ## Passive provider (other apps' locations)
    lpFused = 3       ## Fused provider (Google Play Services)

  Location* = object
    ## Location data
    latitude*: float64
    longitude*: float64
    accuracy*: float32        ## Accuracy in meters
    altitude*: Option[float64]
    speed*: Option[float32]   ## Speed in m/s
    bearing*: Option[float32] ## Bearing in degrees
    timestamp*: Time
    provider*: string

  LocationCallback* = proc(location: Location) {.closure.}

  SdkLocationManager* = ref object
    context: jobject
    locationManager: jobject
    apiLevel: int
    activeCallbacks: Table[string, LocationCallback]
    # TODO: Add systemPrefs when implementing preference system
    # systemPrefs*: LocationSystemPrefs

# Helper to convert Java Location to Nim Location
proc toLocation(jloc: jobject): Location =
  ## Convert Java android.location.Location to Nim Location
  result.latitude = jloc.call("getLatitude").doubleVal
  result.longitude = jloc.call("getLongitude").doubleVal
  result.accuracy = jloc.call("getAccuracy").floatVal
  result.provider = jloc.call("getProvider").toStringRaw()
  result.timestamp = fromUnix(jloc.call("getTime").longVal div 1000)

  # Optional fields
  if jloc.call("hasAltitude").boolVal:
    result.altitude = some(jloc.call("getAltitude").doubleVal)

  if jloc.call("hasSpeed").boolVal:
    result.speed = some(jloc.call("getSpeed").floatVal)

  if jloc.call("hasBearing").boolVal:
    result.bearing = some(jloc.call("getBearing").floatVal)

proc init*(_: typedesc[SdkLocationManager]): SdkLocationManager =
  ## Initialize SdkLocationManager
  result = SdkLocationManager()
  result.context = getContext()
  result.apiLevel = detectApiLevel()
  result.activeCallbacks = initTable[string, LocationCallback]()

  # Get LocationManager system service
  let serviceName = "location".toJString
  result.locationManager = result.context.getSystemService(serviceName)

proc isLocationEnabled*(lm: SdkLocationManager): bool =
  ## Check if location services are enabled on device
  ##
  ## Returns:
  ##   true if location is enabled, false otherwise
  ##
  ## Example:
  ##   if not location().isLocationEnabled():
  ##     showEnableLocationDialog()

  if lm.apiLevel >= 28:
    # Modern API (API 28+)
    return lm.locationManager.call("isLocationEnabled").boolVal
  else:
    # Legacy: Check if any provider is enabled
    let gpsEnabled = lm.locationManager.call("isProviderEnabled",
      "gps".toJString).boolVal
    let networkEnabled = lm.locationManager.call("isProviderEnabled",
      "network".toJString).boolVal
    return gpsEnabled or networkEnabled

proc getProviders*(lm: SdkLocationManager, enabledOnly: bool = false): seq[string] =
  ## Get available location providers
  ##
  ## Args:
  ##   enabledOnly: If true, only return enabled providers
  ##
  ## Returns:
  ##   List of provider names (e.g., "gps", "network")
  ##
  ## Example:
  ##   let providers = location().getProviders(enabledOnly = true)
  ##   echo "Available: ", providers

  let jproviders = lm.locationManager.call("getProviders", enabledOnly.jboolean)
  let size = jproviders.call("size").intVal

  result = newSeq[string]()
  for i in 0..<size:
    let provider = jproviders.call("get", i.jint)
    result.add(provider.toStringRaw())

proc isProviderEnabled*(lm: SdkLocationManager, provider: string): bool =
  ## Check if specific provider is enabled
  ##
  ## Args:
  ##   provider: Provider name ("gps", "network", "passive")
  ##
  ## Returns:
  ##   true if provider is enabled
  ##
  ## Example:
  ##   if location().isProviderEnabled("gps"):
  ##     useGpsLocation()

  return lm.locationManager.call("isProviderEnabled",
    provider.toJString).boolVal

proc getLastKnownLocation*(lm: SdkLocationManager, provider: string = "gps"): Option[Location] =
  ## Get last known location from provider (no network request)
  ##
  ## This is fast but may be outdated. No permissions check performed.
  ##
  ## Args:
  ##   provider: Provider to query ("gps", "network", "passive")
  ##
  ## Returns:
  ##   Last known location, or None if unavailable
  ##
  ## Example:
  ##   let lastLoc = location().getLastKnownLocation("gps")
  ##   if lastLoc.isSome:
  ##     echo "Last GPS: ", lastLoc.get().latitude
  ##
  ## NOTE: Requires ACCESS_FINE_LOCATION or ACCESS_COARSE_LOCATION permission

  let jloc = lm.locationManager.call("getLastKnownLocation",
    provider.toJString)

  if jloc.isNil:
    return none(Location)

  return some(toLocation(jloc))

proc getBestLastKnownLocation*(lm: SdkLocationManager): Option[Location] =
  ## Get best available last known location from any provider
  ##
  ## Tries GPS first, then network, then passive.
  ##
  ## Returns:
  ##   Best last known location, or None if unavailable
  ##
  ## Example:
  ##   let loc = location().getBestLastKnownLocation()
  ##   if loc.isSome:
  ##     showLocationOnMap(loc.get())

  # Try GPS first (most accurate)
  var best = lm.getLastKnownLocation("gps")
  if best.isSome:
    return best

  # Try network
  best = lm.getLastKnownLocation("network")
  if best.isSome:
    return best

  # Try passive as last resort
  return lm.getLastKnownLocation("passive")

proc getCurrentLocation*(lm: SdkLocationManager,
                        provider: string = "gps",
                        timeoutMs: int = 10000): Future[Option[Location]] {.async.} =
  ## Get current location asynchronously
  ##
  ## Requests a fresh location from the provider with timeout.
  ##
  ## Args:
  ##   provider: Provider to use ("gps", "network")
  ##   timeoutMs: Timeout in milliseconds (default 10 seconds)
  ##
  ## Returns:
  ##   Current location, or None if timeout/unavailable
  ##
  ## Example:
  ##   let loc = await location().getCurrentLocation("gps")
  ##   if loc.isSome:
  ##     echo "Current position: ", loc.get().latitude, ", ", loc.get().longitude
  ##
  ## NOTE: Requires ACCESS_FINE_LOCATION permission for GPS
  ## NOTE: Requires ACCESS_COARSE_LOCATION permission for network

  # TODO: This is a simplified implementation
  # Full implementation would use requestSingleUpdate with a timeout
  # For now, return last known location as fallback

  # Try to get last known location
  let lastLoc = lm.getLastKnownLocation(provider)
  return lastLoc

  # TODO: Implement proper single location update with timeout
  # Would require creating a LocationListener in Java/Kotlin and bridging it
  # This needs additional JNI infrastructure for callback handling

proc distanceBetween*(loc1, loc2: Location): float32 =
  ## Calculate distance between two locations in meters
  ##
  ## Uses Haversine formula for great-circle distance.
  ##
  ## Args:
  ##   loc1, loc2: Two locations
  ##
  ## Returns:
  ##   Distance in meters
  ##
  ## Example:
  ##   let dist = distanceBetween(startLoc, endLoc)
  ##   echo "Distance: ", dist / 1000.0, " km"

  const EarthRadius = 6371000.0  # meters

  let lat1Rad = loc1.latitude * PI / 180.0
  let lat2Rad = loc2.latitude * PI / 180.0
  let deltaLat = (loc2.latitude - loc1.latitude) * PI / 180.0
  let deltaLon = (loc2.longitude - loc1.longitude) * PI / 180.0

  let a = sin(deltaLat / 2.0) * sin(deltaLat / 2.0) +
          cos(lat1Rad) * cos(lat2Rad) *
          sin(deltaLon / 2.0) * sin(deltaLon / 2.0)

  let c = 2.0 * arctan2(sqrt(a), sqrt(1.0 - a))

  return (EarthRadius * c).float32

proc bearingTo*(fromLoc, toLoc: Location): float32 =
  ## Calculate bearing from one location to another
  ##
  ## Returns bearing in degrees (0-360), where:
  ##   0/360 = North, 90 = East, 180 = South, 270 = West
  ##
  ## Args:
  ##   fromLoc: Starting location
  ##   toLoc: Destination location
  ##
  ## Returns:
  ##   Bearing in degrees
  ##
  ## Example:
  ##   let bearing = bearingTo(currentLoc, destinationLoc)
  ##   echo "Head ", bearing, "° to reach destination"

  let lat1 = fromLoc.latitude * PI / 180.0
  let lat2 = toLoc.latitude * PI / 180.0
  let deltaLon = (toLoc.longitude - fromLoc.longitude) * PI / 180.0

  let y = sin(deltaLon) * cos(lat2)
  let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(deltaLon)

  var bearing = arctan2(y, x) * 180.0 / PI
  bearing = (bearing + 360.0).mod(360.0)  # Normalize to 0-360

  return bearing.float32

# TODO: Implement location update callbacks
# This requires creating a Java LocationListener and bridging callbacks to Nim
# Needs additional JNI infrastructure
#
# proc startLocationUpdates*(lm: SdkLocationManager,
#                           provider: string = "gps",
#                           minTimeMs: int64 = 1000,
#                           minDistanceM: float32 = 0.0,
#                           callback: LocationCallback) =
#   ## Start receiving location updates
#   ##
#   ## Args:
#   ##   provider: Provider to use ("gps", "network")
#   ##   minTimeMs: Minimum time between updates (milliseconds)
#   ##   minDistanceM: Minimum distance between updates (meters)
#   ##   callback: Callback to receive location updates
#   ##
#   ## Example:
#   ##   location().startLocationUpdates("gps", 5000, 10.0) do (loc: Location):
#   ##     echo "New location: ", loc.latitude, ", ", loc.longitude
#
# proc stopLocationUpdates*(lm: SdkLocationManager) =
#   ## Stop receiving location updates

# Lazy accessor for AndroidRuntime
proc sdkLocationManager*(runtime: AndroidRuntime): SdkLocationManager =
  ## Get or create SdkLocationManager instance
  if runtime.sdkLocationManager.isNone:
    runtime.sdkLocationManager = some(SdkLocationManager.init())
  return runtime.sdkLocationManager.get()

# Convenience global accessor
proc location*(): SdkLocationManager =
  ## Global accessor for SdkLocationManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   # Check if location is enabled
  ##   if location().isLocationEnabled():
  ##     let loc = location().getBestLastKnownLocation()
  ##     if loc.isSome:
  ##       showOnMap(loc.get())
  ##
  ##   # Get current location
  ##   let current = await location().getCurrentLocation("gps")
  ##   if current.isSome:
  ##     let pos = current.get()
  ##     echo "You are at: ", pos.latitude, ", ", pos.longitude
  ##
  ##   # Calculate distance
  ##   if startLoc.isSome and endLoc.isSome:
  ##     let dist = distanceBetween(startLoc.get(), endLoc.get())
  ##     echo "Distance: ", dist / 1000.0, " km"
  return runtime().sdkLocationManager()
