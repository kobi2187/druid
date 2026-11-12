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

import std/[browsers, uri, os, strutils]
import bridge, simulator

type Intents* = object
proc intents*(): Intents = discard

proc handOver(what: string): bool =
  ## The simulated phone has an app for it: recorded (`simulator().opened`) and printed.
  simOpened(what)
  stderr.writeLine "[intent] ", what
  true

proc reallyOpen(): bool = getEnv("DRUID_OPEN_LINKS", "1") != "0"

proc openUrl*(_: Intents, url: string): bool {.discardable.} =
  ## On the desktop the link opens in the browser (DRUID_OPEN_LINKS=0: only recorded).
  if druidStarted(): return callStatic(bool, "Intents", "openUrl", url)
  if reallyOpen(): openDefaultBrowser(url)
  handOver("url " & url)
proc shareText*(_: Intents, text: string, subject = "", chooserTitle = ""): bool {.discardable.} =
  ## The system share sheet.
  bridged(handOver("share " & text)): callStatic(bool, "Intents", "shareText", text, subject, chooserTitle)
proc dial*(_: Intents, number: string): bool {.discardable.} =
  ## Opens the dialer with `number` (the user presses call; no permission needed).
  bridged(handOver("dial " & number)): callStatic(bool, "Intents", "dial", number)
proc sendEmail*(_: Intents, to, subject, body: string): bool {.discardable.} =
  if druidStarted(): return callStatic(bool, "Intents", "sendEmail", to, subject, body)
  if reallyOpen():
    openDefaultBrowser("mailto:" & to & "?subject=" & encodeUrl(subject, false) &
                       "&body=" & encodeUrl(body, false))
  handOver("email " & to & " " & subject)
proc sendSms*(_: Intents, number, body: string): bool {.discardable.} =
  bridged(handOver("sms " & number & " " & body)): callStatic(bool, "Intents", "sendSms", number, body)
proc openMap*(_: Intents, query: string): bool {.discardable.} =
  ## A maps app searching for `query` (an address, "coffee", "48.85,2.35").
  bridged(handOver("map " & query)): callStatic(bool, "Intents", "openMap", query)
proc openAppSettings*(_: Intents): bool {.discardable.} =
  bridged(handOver("settings app-details")): callStatic(bool, "Intents", "openAppSettings")
proc openSettings*(_: Intents, action: string): bool {.discardable.} =
  ## A system settings screen: Settings.ACTION_* ("android.settings.WIFI_SETTINGS").
  bridged(handOver("settings " & action)): callStatic(bool, "Intents", "openSettings", action)
proc canOpen*(_: Intents, url: string): bool =
  ## On the desktop: what a phone has apps for (web, mail, phone, SMS, maps).
  bridged((block:
      let u = url.toLowerAscii
      var known = false
      for s in ["http:", "https:", "mailto:", "tel:", "sms:", "smsto:", "geo:"]: known = known or u.startsWith(s)
      known)):
    callStatic(bool, "Intents", "canOpen", url)
proc toast*(_: Intents, text: string, long = false) =
  ## A short message at the bottom of the screen.
  if druidStarted(): callStatic(void, "Intents", "toast", text, long)
  else: simToast(text)
