## Local notifications.
##
## ```nim
## if not permissions().check(apPostNotifications):   # Android 13+
##   discard permissions().request(apPostNotifications)
## notifications().createChannel("news", "News")
## notifications().show(1, "Hello", "From Nim", channel = "news")
## let id = notifications().notify("Done", "Upload finished")   # picks an id
## ```
##
## Tapping a notification opens the app. On the desktop the simulator keeps
## them (`simulator().notificationsShown`) and prints them to stderr -- and, like
## Android 13+, drops them while POST_NOTIFICATIONS is not granted.

import std/sets
import bridge, simulator

type
  Notifications* = object
  Importance* = enum
    ## NotificationManager.IMPORTANCE_*.
    imNone = 0, imMin = 1, imLow = 2, imDefault = 3, imHigh = 4

proc notifications*(): Notifications = discard

proc createChannel*(_: Notifications, id, name: string, importance = imDefault, description = "") =
  ## Android 8+ groups notifications in channels the user can tune; creating
  ## one again updates its name and description. `show` makes a missing one.
  if druidStarted():
    callStatic(void, "Notifications", "createChannel", id, name, ord(importance), description)
  elif simulator().profile.apiLevel >= 26: simChannels().incl id

proc deleteChannel*(_: Notifications, id: string) =
  if druidStarted(): callStatic(void, "Notifications", "deleteChannel", id)
  else: simChannels().excl id

proc hasChannel*(_: Notifications, id: string): bool =
  bridged(simulator().profile.apiLevel < 26 or id in simChannels()):
    callStatic(bool, "Notifications", "hasChannel", id)

proc areEnabled*(_: Notifications): bool =
  ## Whether the user lets this app notify (on 13+, whether POST_NOTIFICATIONS is granted).
  bridged(simPermissionGranted("android.permission.POST_NOTIFICATIONS")):
    callStatic(bool, "Notifications", "areEnabled")

proc show*(_: Notifications, id: int, title, text: string, channel = "",
           ongoing = false, autoCancel = true, progress = -1) =
  ## Shows notification `id`, replacing one with the same id. `ongoing` ones
  ## cannot be swiped away; `progress` 0..100 draws a bar (-1: none).
  if druidStarted():
    callStatic(void, "Notifications", "show", id, channel, title, text, ongoing, autoCancel, progress)
  else:
    let ch = if channel.len > 0: channel else: "druid_default"
    if simulator().profile.apiLevel >= 26: simChannels().incl ch
    discard simNotify(SimNotification(id: id, channel: ch, title: title, text: text,
                                      ongoing: ongoing, progress: min(progress, 100)))

var nextId {.threadvar.}: int

proc notify*(n: Notifications, title, text: string, channel = ""): int {.discardable.} =
  ## Shows a new notification and returns its id (for `cancel`).
  inc nextId
  result = 0x10000 + nextId
  n.show(result, title, text, channel)

proc cancel*(_: Notifications, id: int) =
  if druidStarted(): callStatic(void, "Notifications", "cancel", id)
  else: simCancelNotification(id)

proc cancelAll*(_: Notifications) =
  if druidStarted(): callStatic(void, "Notifications", "cancelAll")
  else: simCancelAll()

proc active*(_: Notifications): seq[int] =
  ## Ids of this app's notifications on screen.
  bridged(simActiveNotifications()): callStatic(seq[int], "Notifications", "active")
