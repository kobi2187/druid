## Push messages with Firebase Cloud Messaging, from the optional druid-fcm
## Android module (android/druid-fcm; it brings Firebase into the app).
##
## ```nim
## if push().isAvailable:
##   push().requestToken()                # an ekPush pkToken event: send it to your server
## for ev in pollEvents():
##   if ev.kind == ekPush and ev.push.kind == pkMessage:
##     echo ev.push.title, ": ", ev.push.data
## ```
##
## A message that arrives while the app is closed waits until it next polls.
## A message with a notification part is shown by the system when the app is
## in the background, and reaches the app only when the user taps it. On
## Android 13+ notifications need POST_NOTIFICATIONS. On the desktop the
## token is "simulated-token" and `simulator().pushMessage` sends messages.

import bridge, simulator, events

type Push* = object
proc push*(): Push = discard

proc isAvailable*(_: Push): bool =
  ## Whether the druid-fcm module is in the app (and so Firebase).
  if not druidStarted(): return true
  try: callStatic(bool, "Push", "isAvailable")
  except DruidError: false

proc requestToken*(_: Push) =
  ## Fetches this install's token: a pkToken event brings it (and again when
  ## Firebase changes it).
  if druidStarted():
    callStatic(void, "Push", "requestToken")
  else:
    simPushToken() = "simulated-token"
    postLocal encodeEvent("push", "token", "simulated-token")

proc deleteToken*(_: Push) =
  ## Stops messages to this install until a new token is requested.
  if druidStarted(): callStatic(void, "Push", "deleteToken") else: simPushToken() = ""

proc subscribe*(_: Push, topic: string) =
  ## Messages sent to `topic` reach this install.
  if druidStarted(): callStatic(void, "Push", "subscribe", topic)

proc unsubscribe*(_: Push, topic: string) =
  if druidStarted(): callStatic(void, "Push", "unsubscribe", topic)
