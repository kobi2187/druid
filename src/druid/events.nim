## What Android tells the app without being asked: permission answers,
## location fixes, sensor readings, network changes, lifecycle, memory pressure.
##
## Android's callbacks do not call into Nim. The Java side queues each as an
## event, and the app drains the queue once per frame:
##
## ```nim
## for ev in pollEvents():
##   case ev.kind
##   of ekPermission: echo "request ", ev.requestId, ": ", ev.results
##   of ekLocation: echo ev.fix.latitude, ", ", ev.fix.longitude
##   else: discard
## ```
##
## `pollEvents` also keeps the latest of each kind, so code that only wants the
## current value reads it (`location().latest`, `sensors().latest(stLight)`,
## `permissions().status(req)`) and ignores the events. With RUI,
## `druid/rui.attachDruid` does the polling.

import std/[strutils, tables, options, deques, math]
import bridge

type
  DruidEventKind* = enum
    ekPermission       ## a permission request was answered
    ekLifecycle        ## an Activity was created / resumed / paused / ...
    ekConnectivity     ## the default network changed (connectivity().startMonitoring)
    ekLocation         ## a location fix (location().start)
    ekLocationProvider ## a location provider was switched on or off
    ekSensor           ## a sensor reading (sensors().start)
    ekMemory           ## onTrimMemory: the system wants memory back
    ekConfiguration    ## orientation, night mode or font scale changed
    ekPlayer           ## a Player was prepared, completed or failed
    ekBiometric        ## a biometric prompt was answered
    ekDownload         ## a download finished
    ekPhoto            ## a photo was taken, or failed (camera().takePhoto)
    ekCamera           ## preview frames started or failed (camera().startFrames)
    ekNotification     ## a notification was tapped, dismissed, its button pressed, replied to
    ekAlarm            ## an alarm went off (alarms().set)
    ekJob              ## a background job ran (jobs().schedule)
    ekIncoming         ## another app shared something with this one, or opened a link with it
    ekBle              ## a Bluetooth LE device was seen (bluetooth().startScan)
    ekUnknown          ## from a newer Java side; `raw` has it

  LocationFix* = object
    provider*: string
    latitude*, longitude*: float64
    altitude*: float64       ## metres; NaN when unknown
    accuracy*: float64       ## metres (68 % radius); NaN when unknown
    timeMs*: int64           ## Unix time in ms
    speed*: float64          ## m/s; NaN when unknown
    bearing*: float64        ## degrees; NaN when unknown

  SensorReading* = object
    sensorType*: int         ## Sensor.TYPE_* (see sensors.SensorType)
    accuracy*: int           ## SensorManager.SENSOR_STATUS_* (0 unreliable .. 3 high)
    timestampNs*: int64      ## nanoseconds, monotonic (SystemClock.elapsedRealtimeNanos)
    values*: seq[float32]

  DruidEvent* = object
    raw*: string             ## the event as the Java side sent it
    case kind*: DruidEventKind
    of ekPermission:
      requestId*: int
      results*: seq[tuple[permission: string, granted: bool]]
    of ekLifecycle:
      state*: string         ## "created", "started", "resumed", "paused", "stopped", "destroyed"
      activity*: string      ## the Activity's class name
    of ekConnectivity:
      networkType*: string   ## "wifi", "cellular", "ethernet", "bluetooth", "vpn", "other", "none"
      connected*, metered*: bool
    of ekLocation:
      fix*: LocationFix
    of ekLocationProvider:
      provider*: string
      enabled*: bool
    of ekSensor:
      reading*: SensorReading
    of ekMemory:
      trimLevel*: int        ## ComponentCallbacks2.TRIM_MEMORY_* (5 .. 80)
    of ekConfiguration:
      orientation*: int      ## 1 portrait, 2 landscape
      nightMode*: bool
      fontScale*: float32
    of ekPlayer:
      playerId*: int
      playerEvent*: string   ## "prepared", "completed", "error"
      playerDetail*: int     ## duration ms when prepared; error code
    of ekBiometric:
      biometricId*: int
      outcome*: string       ## "succeeded", "failed" (one try, prompt stays), "error" (prompt gone)
      errorCode*: int
      message*: string
    of ekDownload:
      downloadId*: int64
      downloadStatus*: int   ## DownloadManager.STATUS_* (8 successful, 16 failed)
      localUri*: string
    of ekPhoto:
      photoId*: int
      photoOk*: bool
      photoPath*: string     ## the JPEG written, when photoOk
      photoError*: string    ## why not, otherwise
    of ekCamera:
      cameraRequestId*: int
      cameraStarted*: bool   ## false: failed (cameraDetail says why)
      frameWidth*, frameHeight*: int
      cameraDetail*: string
    of ekNotification:
      notificationId*: int
      interaction*: string   ## "tap", "dismissed", "action", "reply"
      notificationDetail*: string  ## the action's id, or the reply's text
    of ekAlarm:
      alarmId*: int
      alarmAtMs*: int64      ## when it was set for (Unix ms)
    of ekJob:
      jobId*: int
      jobRanAtMs*: int64
    of ekIncoming:
      incomingAction*: string  ## "send" (shared to the app) or "view" (opened with it)
      incomingMime*: string
      incomingSubject*, incomingText*: string
      incomingUrl*: string     ## a link opened with the app
      incomingFiles*: seq[string]  ## copies in the cache; "!reason" for one that could not be read
    of ekBle:
      bleAddress*, bleName*: string
      bleRssi*: int          ## dBm
      bleServices*: seq[string]   ## advertised service UUIDs
      bleError*: int         ## ScanCallback.SCAN_FAILED_* when the scan failed (bleAddress is "")
    of ekUnknown:
      discard

const eventSep* = '\x1f'

proc num(s: string): float64 =
  case s
  of "NaN", "": NaN
  of "Infinity": Inf
  of "-Infinity": NegInf
  else:
    try: parseFloat(s) except ValueError: NaN

proc int64Of(s: string): int64 =
  ## An integer field; Java may print a whole number as a double ("3.0").
  try: parseBiggestInt(s)
  except ValueError:
    let f = parseFloat(s)                  # raises on garbage: the event is ekUnknown
    if f.isNaN or abs(f) > 9.2e18: raise newException(ValueError, "not an integer: " & s)
    int64(f)

proc intOf(s: string): int = int(int64Of(s))

proc parseEvent*(raw: string): DruidEvent =
  ## One event as the Java side encodes it: kind, then fields, separated by
  ## `eventSep`. Anything malformed becomes `ekUnknown` rather than an error.
  let f = raw.split(eventSep)
  template at(k: int): string = (if k < f.len: f[k] else: "")
  try:
    case f[0]
    of "permission":
      result = DruidEvent(kind: ekPermission, raw: raw, requestId: intOf(at(1)))
      var k = 2
      while k + 1 < f.len:
        result.results.add (permission: f[k], granted: f[k + 1] == "1")
        k += 2
    of "lifecycle":
      result = DruidEvent(kind: ekLifecycle, raw: raw, state: at(1), activity: at(2))
    of "connectivity":
      result = DruidEvent(kind: ekConnectivity, raw: raw, networkType: at(1),
                          connected: at(2) == "1", metered: at(3) == "1")
    of "location":
      if f.len < 9: return DruidEvent(kind: ekUnknown, raw: raw)
      result = DruidEvent(kind: ekLocation, raw: raw, fix: LocationFix(
        provider: f[1], latitude: num(f[2]), longitude: num(f[3]), altitude: num(f[4]),
        accuracy: num(f[5]), timeMs: int64Of(f[6]), speed: num(f[7]), bearing: num(f[8])))
    of "locationProvider":
      result = DruidEvent(kind: ekLocationProvider, raw: raw, provider: at(1), enabled: at(2) == "1")
    of "sensor":
      if f.len < 4: return DruidEvent(kind: ekUnknown, raw: raw)
      var r = SensorReading(sensorType: intOf(f[1]), accuracy: intOf(f[2]), timestampNs: int64Of(f[3]))
      for k in 4 ..< f.len: r.values.add float32(num(f[k]))
      result = DruidEvent(kind: ekSensor, raw: raw, reading: r)
    of "memory":
      result = DruidEvent(kind: ekMemory, raw: raw, trimLevel: intOf(at(1)))
    of "configuration":
      result = DruidEvent(kind: ekConfiguration, raw: raw, orientation: intOf(at(1)),
                          nightMode: at(2) == "32", fontScale: float32(num(at(3))))
    of "player":
      result = DruidEvent(kind: ekPlayer, raw: raw, playerId: intOf(at(1)),
                          playerEvent: at(2), playerDetail: intOf(at(3)))
    of "biometric":
      result = DruidEvent(kind: ekBiometric, raw: raw, biometricId: intOf(at(1)),
                          outcome: at(2), errorCode: intOf(at(3)), message: at(4))
    of "download":
      result = DruidEvent(kind: ekDownload, raw: raw, downloadId: int64Of(at(1)),
                          downloadStatus: intOf(at(2)), localUri: at(3))
    of "photo":
      let ok = at(2) == "ok"
      result = DruidEvent(kind: ekPhoto, raw: raw, photoId: intOf(at(1)), photoOk: ok,
                          photoPath: (if ok: at(3) else: ""), photoError: (if ok: "" else: at(3)))
    of "camera":
      result = DruidEvent(kind: ekCamera, raw: raw, cameraRequestId: intOf(at(1)),
                          cameraStarted: at(2) == "started", cameraDetail: at(3))
      if result.cameraStarted:
        let wh = at(3).split('x')
        if wh.len == 2:
          result.frameWidth = intOf(wh[0])
          result.frameHeight = intOf(wh[1])
    of "notification":
      result = DruidEvent(kind: ekNotification, raw: raw, notificationId: intOf(at(1)),
                          interaction: at(2), notificationDetail: at(3))
    of "alarm":
      result = DruidEvent(kind: ekAlarm, raw: raw, alarmId: intOf(at(1)), alarmAtMs: int64Of(at(2)))
    of "job":
      result = DruidEvent(kind: ekJob, raw: raw, jobId: intOf(at(1)), jobRanAtMs: int64Of(at(2)))
    of "incoming":
      result = DruidEvent(kind: ekIncoming, raw: raw, incomingAction: at(1), incomingMime: at(2),
                          incomingSubject: at(3), incomingText: at(4), incomingUrl: at(5))
      for k in 6 ..< f.len: result.incomingFiles.add f[k]
    of "ble":
      result = DruidEvent(kind: ekBle, raw: raw, bleAddress: at(1), bleName: at(2), bleRssi: intOf(at(3)))
      if at(4).startsWith("error:"): result.bleError = intOf(at(4)[6 .. ^1])
      elif at(4).len > 0: result.bleServices = at(4).split(',')
    else:
      result = DruidEvent(kind: ekUnknown, raw: raw)
  except CatchableError:
    result = DruidEvent(kind: ekUnknown, raw: raw)

proc encodeEvent*(kind: string, fields: varargs[string, `$`]): string =
  ## The Java side's encoding, for events made on the Nim side (the desktop
  ## answers to permission requests, tests).
  result = kind
  for f in fields:
    result.add eventSep
    result.add f

# ---- the latest of each kind ----

type
  EventState = object
    permissionResults: Table[int, seq[tuple[permission: string, granted: bool]]]
    latestFix: Option[LocationFix]
    latestReading: Table[int, SensorReading]
    network: Option[tuple[networkType: string, connected, metered: bool]]
    lifecycle: string
    local: Deque[string]             # events made on the Nim side, not yet polled

var gState {.threadvar.}: EventState

proc applyEvent*(ev: DruidEvent) =
  ## Record `ev` in the latest-value state (`pollEvents` does this for each).
  case ev.kind
  of ekPermission: gState.permissionResults[ev.requestId] = ev.results
  of ekLocation: gState.latestFix = some(ev.fix)
  of ekSensor: gState.latestReading[ev.reading.sensorType] = ev.reading
  of ekConnectivity: gState.network = some((ev.networkType, ev.connected, ev.metered))
  of ekLifecycle: gState.lifecycle = ev.state
  else: discard

proc postLocal*(raw: string) =
  ## Queue an event made on the Nim side; the next `pollEvents` returns it
  ## after Android's.
  gState.local.addLast raw

var beforeLocalPoll*: proc() {.nimcall, gcsafe.}
  ## Run by `pollEvents` before it drains the Nim-side queue: the desktop
  ## simulator answers permission requests there, as a phone's dialog does
  ## after the request returned.

proc pollEvents*(): seq[DruidEvent] =
  ## Every event since the last call, oldest first, each already applied to the
  ## latest-value state. Call it once per frame, on one thread (the UI's).
  ## Cheap when there are none: one JNI call (none on the desktop).
  if druidStarted():
    for raw in callStatic(seq[string], "Druid", "pollEvents"):
      let ev = parseEvent(raw)
      applyEvent(ev)
      result.add ev
  if beforeLocalPoll != nil:
    {.cast(gcsafe).}: beforeLocalPoll()
  while gState.local.len > 0:
    let ev = parseEvent(gState.local.popFirst())
    applyEvent(ev)
    result.add ev

proc pendingEvents*(): int =
  ## How many events wait to be polled.
  result = gState.local.len
  if druidStarted(): result += callStatic(int, "Druid", "pendingEvents")

proc permissionResult*(requestId: int): Option[seq[tuple[permission: string, granted: bool]]] =
  if requestId in gState.permissionResults: some(gState.permissionResults[requestId])
  else: none(seq[tuple[permission: string, granted: bool]])

proc latestFix*(): Option[LocationFix] = gState.latestFix

proc latestReading*(sensorType: int): Option[SensorReading] =
  if sensorType in gState.latestReading: some(gState.latestReading[sensorType])
  else: none(SensorReading)

proc latestNetwork*(): Option[tuple[networkType: string, connected, metered: bool]] = gState.network

proc lastLifecycleEvent*(): string = gState.lifecycle
  ## The last lifecycle state polled ("" before any).

proc resetEventState*() =
  ## Forget every latest value and local event (tests).
  gState = EventState()
