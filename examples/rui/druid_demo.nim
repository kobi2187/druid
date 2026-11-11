## An RUI app that uses Druid: device facts, haptics, clipboard, a toast,
## sharing, and a runtime permission whose answer updates the screen.
##
##   desktop:  tools/build_rui_demo.sh && build/rui_demo/druid_demo
##   Android:  tools/build_rui_android.sh (libmain.so for RUI's RuiActivity)
##
## The same source runs on both: on the desktop Druid answers with stand-ins
## (no vibrator, permissions granted, toasts on stderr).

import std/[strutils]
import rui
import druid, druid/ruiapp

proc infoLines*(): seq[string] =
  ## What Druid knows about the device, as the screen shows it.
  let d = device()
  let m = display().metrics
  let battery = power().batteryLevel
  @[(if d.isAndroid: d.manufacturer & " " & d.model & ", Android " & d.release & " (API " & $d.apiLevel & ")"
     else: "Desktop (" & d.model & "): Druid stand-ins"),
    $m.widthPx & " x " & $m.heightPx & " px at " & $m.dpi & " dpi",
    "Battery " & (if battery < 0: "unknown" else: $battery & "%") &
      ", network " & $connectivity().networkType]

proc infoText*(): string = infoLines().join("\n")

proc describe*(ev: DruidEvent): string =
  ## One line for an event the demo reports.
  case ev.kind
  of ekPermission:
    var parts: seq[string]
    for r in ev.results:
      parts.add r.permission.split('.')[^1].toLowerAscii & (if r.granted: " granted" else: " denied")
    parts.join(", ")
  of ekLifecycle: "Activity " & ev.state
  of ekConnectivity: "Network: " & ev.networkType & (if ev.connected: "" else: " (offline)")
  else: $ev.kind

proc druidDemo*(status: Link[string]): Widget =
  ui:
    Column(crossAxisAlignment = CrossAxisAlignment.stretch):
      AppBar(title = "Druid on RUI")
      Column(spacing = 12.0, crossAxisAlignment = CrossAxisAlignment.stretch):
        Label(text = infoLines()[0], fontSize = 14.0)
        Label(text = infoLines()[1], fontSize = 14.0)
        Label(text = infoLines()[2], fontSize = 14.0)
        Label(text = status.value, fontSize = 16.0)
        Button(text = "Vibrate", onClick = proc() =
          vibration().effect(heClick)
          status.value = if vibration().hasVibrator: "Buzz" else: "No vibrator here")
        Button(text = "Copy device info", onClick = proc() =
          clipboard().setText(infoText())
          status.value = "Copied " & $clipboard().text.get("").len & " characters")
        Button(text = "Toast", onClick = proc() = intents().toast("Hello from Nim"))
        Button(text = "Share", onClick = proc() =
          if not intents().shareText(infoText(), subject = "My device"):
            status.value = "Nothing to share with")
        Button(text = "Ask for the camera", onClick = proc() =
          discard permissions().request(apCamera)
          status.value = "Asking...")

proc wireDemo*(app: App, status: Link[string]) =
  ## Druid's events onto the screen: permission answers and network changes
  ## replace the status line; everything goes to the log (logcat on Android).
  connectivity().startMonitoring()
  app.attachDruid(proc(ev: DruidEvent) =
    if ev.kind in {ekPermission, ekConnectivity}: status.value = describe(ev)
    logInfo "event: ", describe(ev))

when isMainModule:
  ruiAndroidMain:
    state:
      status: string = "Tap a button"
    let app = newApp("Druid demo", 360, 800)
    app.wireDemo(status)
    app.setRootWidget(druidDemo(status))
    app.run()
