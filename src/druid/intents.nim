## Handing things to other apps: links, sharing, the dialer, mail, maps,
## settings; and toasts.
##
## ```nim
## discard intents().openUrl("https://nim-lang.org")
## discard intents().shareText("Look at this", subject = "Nim")
## intents().toast("Saved")
## ```
##
## Each returns false when no app can handle it. On the desktop `openUrl` uses
## the default browser and `toast` prints to stderr; the rest return false.

import std/[browsers, uri]
import bridge

type Intents* = object
proc intents*(): Intents = discard

proc openUrl*(_: Intents, url: string): bool {.discardable.} =
  if druidStarted(): callStatic(bool, "Intents", "openUrl", url)
  else:
    openDefaultBrowser(url)
    true
proc shareText*(_: Intents, text: string, subject = "", chooserTitle = ""): bool {.discardable.} =
  ## The system share sheet.
  bridged(false): callStatic(bool, "Intents", "shareText", text, subject, chooserTitle)
proc dial*(_: Intents, number: string): bool {.discardable.} =
  ## Opens the dialer with `number` (the user presses call; no permission needed).
  bridged(false): callStatic(bool, "Intents", "dial", number)
proc sendEmail*(_: Intents, to, subject, body: string): bool {.discardable.} =
  if druidStarted(): callStatic(bool, "Intents", "sendEmail", to, subject, body)
  else:
    openDefaultBrowser("mailto:" & to & "?subject=" & encodeUrl(subject, false) &
                       "&body=" & encodeUrl(body, false))
    true
proc sendSms*(_: Intents, number, body: string): bool {.discardable.} =
  bridged(false): callStatic(bool, "Intents", "sendSms", number, body)
proc openMap*(_: Intents, query: string): bool {.discardable.} =
  ## A maps app searching for `query` (an address, "coffee", "48.85,2.35").
  bridged(false): callStatic(bool, "Intents", "openMap", query)
proc openAppSettings*(_: Intents): bool {.discardable.} =
  bridged(false): callStatic(bool, "Intents", "openAppSettings")
proc openSettings*(_: Intents, action: string): bool {.discardable.} =
  ## A system settings screen: Settings.ACTION_* ("android.settings.WIFI_SETTINGS").
  bridged(false): callStatic(bool, "Intents", "openSettings", action)
proc canOpen*(_: Intents, url: string): bool =
  bridged(false): callStatic(bool, "Intents", "canOpen", url)
proc toast*(_: Intents, text: string, long = false) =
  ## A short message at the bottom of the screen.
  if druidStarted(): callStatic(void, "Intents", "toast", text, long)
  else: stderr.writeLine "[toast] ", text
