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
##   of ekAlarm: echo "alarm ", ev.alarmId
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
import bridge, simulator

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
