## Where the device is, from the platform's LocationManager (no Play Services).
##
## ```nim
## let req = permissions().request(pgLocation)
## # once granted:
## location().start(providerGps, minTimeMs = 1000)
## # each frame, after pollEvents():
## let fix = location().latest
## if fix.isSome: echo fix.get.latitude, ", ", fix.get.longitude
## ```
##
## Needs ACCESS_FINE_LOCATION or ACCESS_COARSE_LOCATION in the manifest and
## granted; without it calls raise `DruidPermissionError`. On the desktop
## there are no providers.

import std/[options, math]
import bridge, events
export LocationFix

type Location* = object

const
  providerGps* = "gps"
  providerNetwork* = "network"
  providerPassive* = "passive"
  providerFused* = "fused"      ## Android 12+

proc location*(): Location = discard

proc providers*(_: Location, enabledOnly = true): seq[string] =
  bridged(newSeq[string]()): callStatic(seq[string], "Location", "providers", enabledOnly)
proc isProviderEnabled*(_: Location, provider: string): bool =
  bridged(false): callStatic(bool, "Location", "isProviderEnabled", provider)
proc isLocationEnabled*(_: Location): bool =
  ## The system-wide location switch.
  bridged(false): callStatic(bool, "Location", "isLocationEnabled")

proc fixOf(provider: string, v: seq[float64]): LocationFix =
  LocationFix(provider: provider, latitude: v[0], longitude: v[1], altitude: v[2], accuracy: v[3],
              timeMs: int64(v[4]), speed: v[5], bearing: v[6])

proc lastKnown*(_: Location, provider = providerGps): Option[LocationFix] =
  ## The provider's cached fix, possibly old (check `timeMs`), without starting it.
  if not druidStarted(): return none(LocationFix)
  let v = callStatic(seq[float64], "Location", "lastKnown", provider)
  if v.len < 7: none(LocationFix) else: some(fixOf(provider, v))

proc start*(_: Location, provider = providerGps, minTimeMs = 1000, minDistanceM = 0.0) =
  ## Fixes from `provider` arrive as `ekLocation` events (and in `latest`),
  ## at most every `minTimeMs` and `minDistanceM`. Restarts it if running.
  if druidStarted():
    callStatic(void, "Location", "start", provider, int64(minTimeMs), float32(minDistanceM))

proc stop*(_: Location, provider = providerGps) =
  if druidStarted(): callStatic(void, "Location", "stop", provider)
proc stopAll*(_: Location) =
  if druidStarted(): callStatic(void, "Location", "stopAll")
proc isRunning*(_: Location, provider = providerGps): bool =
  bridged(false): callStatic(bool, "Location", "isRunning", provider)

proc latest*(_: Location): Option[LocationFix] =
  ## The newest fix `pollEvents` has seen, from any provider.
  latestFix()

proc haversine*(lat1, lon1, lat2, lon2: float64): float64 =
  ## Great-circle distance in metres on a sphere of the Earth's mean radius.
  const r = 6_371_008.8
  let p1 = degToRad(lat1)
  let p2 = degToRad(lat2)
  let dp = degToRad(lat2 - lat1)
  let dl = degToRad(lon2 - lon1)
  let a = sin(dp / 2) ^ 2 + cos(p1) * cos(p2) * sin(dl / 2) ^ 2
  2 * r * arcsin(min(1.0, sqrt(a)))

proc distanceBetween*(_: Location, lat1, lon1, lat2, lon2: float64): float64 =
  ## Metres between two points: Android's (WGS84 ellipsoid) when started, else `haversine`.
  bridged(haversine(lat1, lon1, lat2, lon2)):
    float64(callStatic(float32, "Location", "distanceBetween", lat1, lon1, lat2, lon2))

proc distanceTo*(a, b: LocationFix): float64 =
  haversine(a.latitude, a.longitude, b.latitude, b.longitude)
