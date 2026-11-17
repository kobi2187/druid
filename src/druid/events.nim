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
    ekForeground       ## the foreground service started, stopped or failed (foreground().start)
    ekRecording        ## a recording ended (recorder().start)
    ekTts              ## text to speech: ready, an utterance started, done, failed (tts())
    ekSpeech           ## speech recognition: ready, partial, result, error, end (recognizer().start)
    ekGatt             ## a Bluetooth LE connection: connected, services, read, written, changed (bluetooth().connect)
    ekNfc              ## an NFC tag was read (nfc().startReading)
    ekPush             ## a push message or a new push token (push(), the druid-fcm module)
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

  PhotoResult* = object
    id*: int               ## the PhotoRequest's id
    ok*: bool
    path*: string          ## the JPEG written, when ok
    error*: string         ## why not, otherwise

  FrameStream* = object
    id*: int               ## the FrameRequest's id
    started*: bool         ## false: it failed (`error` says why) or stopped
    width*, height*: int   ## the frames' size, when started
    error*: string

  InteractionKind* = enum
    ikTap = "tap"              ## the user tapped it: the app opened
    ikDismissed = "dismissed"  ## swiped away, or cleared
    ikAction = "action"        ## one of its buttons (`actionId`)
    ikReply = "reply"          ## its inline reply (`reply`)

  NotificationInteraction* = object
    id*: int               ## the notification's id
    kind*: InteractionKind
    actionId*: string      ## the button's id (ikAction)
    reply*: string         ## the text typed (ikReply)

  AlarmFired* = object
    id*: int
    atMs*: int64           ## when it was set for (Unix ms)

  JobRun* = object
    id*: int
    atMs*: int64           ## when it ran (Unix ms)

  IncomingAction* = enum
    iaSend = "send"        ## shared with the app (ACTION_SEND / SEND_MULTIPLE)
    iaView = "view"        ## opened with the app (ACTION_VIEW)

  IncomingContent* = object
    action*: IncomingAction
    mime*: string
    subject*, text*: string
    url*: string           ## a link opened with the app (iaView)
    files*: seq[string]    ## copies in the cache; "!reason" for one that could not be read

  BleAdvertisement* = object
    address*, name*: string
    rssi*: int             ## dBm
    services*: seq[string] ## advertised service UUIDs
    error*: int            ## ScanCallback.SCAN_FAILED_* when the scan failed (no address then)

  ForegroundState* = enum
    fsStarted = "started", fsStopped = "stopped", fsError = "error"
  ForegroundChange* = object
    state*: ForegroundState
    error*: string

  RecordingOutcome* = enum
    roStopped = "stopped"  ## recorder().stop
    roLimit = "limit"      ## maxDurationMs was reached
    roError = "error"
  RecordingEnd* = object
    outcome*: RecordingOutcome
    path*: string
    durationMs*: int64
    error*: string

  TtsStep* = enum
    tsReady = "ready"      ## the engine is ready: speak
    tsFailed = "failed"    ## the engine could not start
    tsStart = "start"      ## an utterance began
    tsDone = "done"        ## ... and finished
    tsError = "error"      ## ... failed
    tsStopped = "stopped"  ## ... was cut off (stop, or a flush)
  TtsProgress* = object
    step*: TtsStep
    utteranceId*: string
    code*: int

  SpeechStepKind* = enum
    skReady = "ready", skPartial = "partial", skResult = "result", skError = "error", skEnd = "end"
  SpeechStep* = object
    id*: int               ## the SpeechRequest's id
    kind*: SpeechStepKind
    texts*: seq[string]    ## partial / result: best first, then alternatives
    errorCode*: int        ## SpeechRecognizer.ERROR_* (7: nothing recognised, 6: silence)

  GattStepKind* = enum
    gkConnected = "connected", gkDisconnected = "disconnected", gkServices = "services",
    gkRead = "read", gkWritten = "written", gkChanged = "changed", gkMtu = "mtu"
  GattCharacteristic* = object
    service*, uuid*: string
    properties*: int       ## BluetoothGattCharacteristic.PROPERTY_* bits (2 read, 8 write, 16 notify, ...)
  GattStep* = object
    connection*: int       ## the GattConnection's id
    kind*: GattStepKind
    characteristic*: string
    status*: int           ## 0 success; else BluetoothGatt.GATT_* (133 a generic failure)
    value*: seq[byte]      ## read / changed
    characteristics*: seq[GattCharacteristic]  ## services
    mtu*: int

  NdefEntry* = object
    kind*: string          ## "text:LANG", "uri", a MIME type, or "tnf:N:TYPEHEX"
    value*: string         ## the text or URI; for the others the payload in hex
  NfcTag* = object
    id*: string            ## hex
    techs*: seq[string]    ## "NfcA", "Ndef", "MifareUltralight", ...
    records*: seq[NdefEntry]

  PushKind* = enum
    pkToken = "token"      ## this install's (new) token
    pkMessage = "message"  ## a message arrived
    pkOpened = "opened"    ## the user tapped a message's notification (the system showed it)
    pkError = "error"      ## fetching the token or subscribing failed
  PushMessage* = object
    kind*: PushKind
    token*: string         ## pkToken: the device's new token, for the app's server
    sender*, messageId*: string
    title*, body*: string  ## its notification part, if any
    data*: seq[tuple[key, value: string]]
    error*: string

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
      photo*: PhotoResult
    of ekCamera:
      frames*: FrameStream
    of ekNotification:
      notification*: NotificationInteraction
    of ekAlarm:
      alarm*: AlarmFired
    of ekJob:
      job*: JobRun
    of ekIncoming:
      incoming*: IncomingContent
    of ekBle:
      ble*: BleAdvertisement
    of ekForeground:
      foreground*: ForegroundChange
    of ekRecording:
      recording*: RecordingEnd
    of ekTts:
      tts*: TtsProgress
    of ekSpeech:
      speech*: SpeechStep
    of ekGatt:
      gatt*: GattStep
    of ekNfc:
      nfc*: NfcTag
    of ekPush:
      push*: PushMessage
    of ekUnknown:
      discard

proc detail*(n: NotificationInteraction): string =
  ## The button's id or the reply's text ("" for a tap or a dismissal).
  case n.kind
  of ikAction: n.actionId
  of ikReply: n.reply
  else: ""

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

proc parseHexBytes*(s: string): seq[byte] =
  ## "0aff" -> @[10, 255]: how the Java side sends bytes inside an event.
  if s.len mod 2 != 0: raise newException(ValueError, "odd hex: " & s)
  for k in countup(0, s.len - 2, 2): result.add byte(parseHexInt(s[k .. k + 1]))

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
      result = DruidEvent(kind: ekPhoto, raw: raw, photo: PhotoResult(id: intOf(at(1)), ok: ok,
        path: (if ok: at(3) else: ""), error: (if ok: "" else: at(3))))
    of "camera":
      var fs = FrameStream(id: intOf(at(1)), started: at(2) == "started")
      if fs.started:
        let wh = at(3).split('x')
        if wh.len == 2:
          fs.width = intOf(wh[0])
          fs.height = intOf(wh[1])
      else: fs.error = at(3)
      result = DruidEvent(kind: ekCamera, raw: raw, frames: fs)
    of "notification":
      let k = parseEnum[InteractionKind](at(2))
      result = DruidEvent(kind: ekNotification, raw: raw, notification: NotificationInteraction(
        id: intOf(at(1)), kind: k, actionId: (if k == ikAction: at(3) else: ""),
        reply: (if k == ikReply: at(3) else: "")))
    of "alarm":
      result = DruidEvent(kind: ekAlarm, raw: raw, alarm: AlarmFired(id: intOf(at(1)), atMs: int64Of(at(2))))
    of "job":
      result = DruidEvent(kind: ekJob, raw: raw, job: JobRun(id: intOf(at(1)), atMs: int64Of(at(2))))
    of "incoming":
      var c = IncomingContent(action: parseEnum[IncomingAction](at(1)), mime: at(2), subject: at(3),
                              text: at(4), url: at(5))
      for k in 6 ..< f.len: c.files.add f[k]
      result = DruidEvent(kind: ekIncoming, raw: raw, incoming: c)
    of "ble":
      var a = BleAdvertisement(address: at(1), name: at(2), rssi: intOf(at(3)))
      if at(4).startsWith("error:"): a.error = intOf(at(4)[6 .. ^1])
      elif at(4).len > 0: a.services = at(4).split(',')
      result = DruidEvent(kind: ekBle, raw: raw, ble: a)
    of "foreground":
      result = DruidEvent(kind: ekForeground, raw: raw, foreground: ForegroundChange(
        state: parseEnum[ForegroundState](at(1)), error: at(2)))
    of "recording":
      result = DruidEvent(kind: ekRecording, raw: raw, recording: RecordingEnd(
        outcome: parseEnum[RecordingOutcome](at(1)), path: at(2), durationMs: int64Of(at(3)), error: at(4)))
    of "tts":
      let step = if at(1) == "error" and at(2) == "": tsFailed else: parseEnum[TtsStep](at(1))
      result = DruidEvent(kind: ekTts, raw: raw, tts: TtsProgress(step: step, utteranceId: at(2),
                          code: intOf(at(3))))
    of "speech":
      var st = SpeechStep(id: intOf(at(1)), kind: parseEnum[SpeechStepKind](at(2)))
      if st.kind == skError: st.errorCode = intOf(at(3))
      elif st.kind in {skPartial, skResult}:
        for k in 3 ..< f.len: st.texts.add f[k]
      result = DruidEvent(kind: ekSpeech, raw: raw, speech: st)
    of "gatt":
      var g = GattStep(connection: intOf(at(1)), kind: parseEnum[GattStepKind](at(2)),
                       characteristic: at(3), status: intOf(at(4)))
      case g.kind
      of gkRead, gkChanged: g.value = parseHexBytes(at(5))
      of gkMtu: g.mtu = intOf(at(5))
      of gkServices:
        for k in 6 ..< f.len:
          let p = f[k].split('/')
          if p.len == 3: g.characteristics.add GattCharacteristic(service: p[0], uuid: p[1], properties: intOf(p[2]))
      else: discard
      result = DruidEvent(kind: ekGatt, raw: raw, gatt: g)
    of "nfc":
      var t = NfcTag(id: at(1))
      if at(2).len > 0: t.techs = at(2).split(',')
      var k = 3
      while k + 1 < f.len:
        t.records.add NdefEntry(kind: f[k], value: f[k + 1])
        k += 2
      result = DruidEvent(kind: ekNfc, raw: raw, nfc: t)
    of "push":
      var m = PushMessage(kind: parseEnum[PushKind](at(1)))
      case m.kind
      of pkToken: m.token = at(2)
      of pkError: m.error = at(2)
      else:
        m.sender = at(2)
        m.messageId = at(3)
        m.title = at(4)
        m.body = at(5)
        var k = 6
        while k + 1 < f.len:
          m.data.add (f[k], f[k + 1])
          k += 2
      result = DruidEvent(kind: ekPush, raw: raw, push: m)
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
