## Work that happens when the app is not in front: alarms at a time, and jobs
## the system runs when their conditions hold.
##
## ```nim
## # A reminder in an hour, shown even if the app was closed:
## alarms().set(1, nowMs() + 3_600_000, "Stretch", "Time to get up")
##
## # A sync every hour on Wi-Fi:
## jobs().schedule(1, periodMinutes = 60, network = jnUnmetered)
##
## for ev in pollEvents():
##   case ev.kind
##   of ekAlarm: echo "alarm ", ev.alarm.id
##   of ekJob: sync()
##   else: discard
## ```
##
## The events wait (kept on disk) until the app's Nim code polls: an alarm
## that went off while the app was closed is reported when it next starts. Its
## notification, when it has a title, shows at the time.
##
## On the desktop the simulator fires alarms and runs jobs at the poll after
## they come due (its clock: `simulator().nowMs`, `advanceClock`), and only
## while their conditions hold (`setNetwork`, `setBattery(charging = true)`);
## `fireAlarm` and `runJob` force them.

import std/[times, tables, algorithm]
import bridge, simulator, events

type
  Alarms* = object
  Jobs* = object
  JobNetwork* = enum
    jnNone = 0        ## no network needed
    jnAny = 1         ## any network
    jnUnmetered = 2   ## Wi-Fi (not metered)

proc alarms*(): Alarms = discard
proc jobs*(): Jobs = discard

proc nowMs*(): int64 =
  ## The device's clock, Unix ms (the simulator's on the desktop).
  if druidStarted(): int64(epochTime() * 1000) else: simulator().nowMs

# ---- alarms ----

proc canBeExact*(_: Alarms): bool =
  ## Whether exact alarms are allowed: on Android 12+ only once the user
  ## grants "Alarms & reminders" (SCHEDULE_EXACT_ALARM) in Settings.
  bridged(simExactAlarms()): callStatic(bool, "Alarms", "canBeExact")

proc set*(_: Alarms, id: int, atMs: int64, title = "", text = "", channel = "",
          exact = false): bool {.discardable.} =
  ## At `atMs` (Unix ms): an `ekAlarm` event, and notification `id` showing
  ## `title` and `text` unless `title` is empty. Replaces alarm `id`. Inexact
  ## alarms may come some minutes late (Android saves battery); `exact` asks
  ## for the minute and returns whether it was granted (`canBeExact`).
  if druidStarted():
    return callStatic(bool, "Alarms", "set", id, atMs, title, text, channel, exact)
  let asExact = exact and simExactAlarms()
  simAlarms()[id] = SimAlarm(id: id, atMs: atMs, title: title, text: text, channel: channel, exact: asExact)
  asExact

proc cancel*(_: Alarms, id: int) =
  if druidStarted(): callStatic(void, "Alarms", "cancel", id)
  else: simAlarms().del(id)

proc pending*(_: Alarms): seq[int] =
  ## Ids of the alarms set and not yet fired, ascending.
  if druidStarted(): return callStatic(seq[int], "Alarms", "pending")
  for id in simAlarms().keys: result.add id
  result.sort

# ---- jobs ----

proc schedule*(_: Jobs, id: int, periodMinutes = 0, delayMs = 0'i64, network = jnNone,
               charging = false, persisted = true): bool {.discardable.} =
  ## Job `id` (replacing one with that id): once, not before `delayMs` from now,
  ## or every `periodMinutes` (at least 15, Android's minimum) -- whenever
  ## `network` and `charging` allow, the system's choice of when. Each run is
  ## an `ekJob` event. `persisted` keeps it across reboots.
  if druidStarted():
    return callStatic(bool, "Jobs", "schedule", id, int64(periodMinutes), delayMs, ord(network),
                      charging, persisted)
  let period = if periodMinutes > 0: max(15, periodMinutes) else: 0
  let first = simulator().nowMs + (if period > 0: int64(period) * 60_000 else: delayMs)
  simJobs()[id] = SimJob(id: id, periodMinutes: period, notBeforeMs: first, network: ord(network),
                         charging: charging)
  true

proc cancel*(_: Jobs, id: int) =
  if druidStarted(): callStatic(void, "Jobs", "cancel", id)
  else: simJobs().del(id)

proc cancelAll*(_: Jobs) =
  if druidStarted(): callStatic(void, "Jobs", "cancelAll")
  else: simJobs().clear()

proc scheduled*(_: Jobs): seq[int] =
  ## Ids of the jobs waiting to run, ascending.
  if druidStarted(): return callStatic(seq[int], "Jobs", "scheduled")
  for id in simJobs().keys: result.add id
  result.sort

# ---- the foreground service ----

type
  Foreground* = object
  ForegroundType* = enum
    ## The kind of work (ServiceInfo.FOREGROUND_SERVICE_TYPE_*). Android 14+
    ## requires it, declared on DruidForegroundService in the app's manifest,
    ## with its permission (FOREGROUND_SERVICE_LOCATION, ...).
    ftDataSync = 0, ftMediaPlayback = 1, ftPhoneCall = 2, ftLocation = 3,
    ftConnectedDevice = 4, ftMediaProjection = 5, ftCamera = 6, ftMicrophone = 7,
    ftHealth = 8, ftRemoteMessaging = 9, ftSystemExempted = 10, ftShortService = 11,
    ftSpecialUse = 30

proc foreground*(): Foreground = discard

proc start*(_: Foreground, title, text: string, channel = "", types: set[ForegroundType] = {}) =
  ## Keeps the app's process alive in the background, showing an ongoing
  ## notification, until `stop`: for music, a route being tracked, an
  ## upload. An `ekForeground` event says "started" -- or "error" (Android
  ## 14+ without its type and permission). Raises DruidError when Android 12+
  ## does not allow it now (the app is not in front). Called again while it
  ## runs: its notification changes.
  var bits = 0
  for t in types: bits = bits or (1 shl ord(t))
  if druidStarted():
    callStatic(void, "Foreground", "start", title, text, channel, bits)
    return
  let api = simulator().profile.apiLevel
  if api >= 31 and simLifecycle() in ["paused", "stopped", "destroyed"]:
    raise newException(DruidError, "Foreground.start (simulated): android.app.ForegroundServiceStartNotAllowedException: " &
                       "the app is not in front")
  let fg = addr simForeground()
  if api >= 34 and types.len == 0:
    postLocal encodeEvent("foreground", "error",
      "android.app.MissingForegroundServiceTypeException: Starting FGS without a type")
    return
  if simPermissionGranted("android.permission.POST_NOTIFICATIONS"):
    discard simNotify(SimNotification(id: 0x0D0F_0001, channel: (if channel.len > 0: channel else: "druid_default"),
                                      title: title, text: text, ongoing: true, progress: -1))
  if not fg.running: postLocal encodeEvent("foreground", "started", "")
  fg[] = (true, title, text)

proc update*(_: Foreground, title, text: string, progress = -1) =
  ## Changes the running service's notification; `progress` 0..100, -1 for none.
  if druidStarted():
    callStatic(void, "Foreground", "update", title, text, progress)
    return
  let fg = addr simForeground()
  if not fg.running:
    raise newException(DruidError, "Foreground.update (simulated): java.lang.IllegalStateException: not running")
  fg[] = (true, title, text)
  if simPermissionGranted("android.permission.POST_NOTIFICATIONS"):
    discard simNotify(SimNotification(id: 0x0D0F_0001, channel: "druid_default", title: title, text: text,
                                      ongoing: true, progress: min(progress, 100)))

proc stop*(_: Foreground) =
  if druidStarted():
    callStatic(void, "Foreground", "stop")
    return
  let fg = addr simForeground()
  if fg.running:
    fg.running = false
    simCancelNotification(0x0D0F_0001)
    postLocal encodeEvent("foreground", "stopped", "")

proc isRunning*(_: Foreground): bool =
  bridged(simForeground().running): callStatic(bool, "Foreground", "isRunning")
