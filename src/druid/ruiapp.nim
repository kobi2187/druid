## Druid inside an RUI app (https://github.com/kobi2187/rui2).
##
## RUI runs on Android as a NativeActivity (RUI's `RuiActivity`, with raylib's
## native_app_glue). `attachDruid` starts Druid with that Activity, polls
## Druid's events every frame, and lets Android wake RUI's idle loop when one
## arrives:
##
## ```nim
## import rui, druid, druid/ruiapp
##
## ruiAndroidMain:
##   let app = newApp("Demo", 360, 800)
##   app.attachDruid(proc(ev: DruidEvent) =
##     if ev.kind == ekPermission: echo "answered: ", ev.results)
##   app.setRootWidget(buildScreen())
##   app.run()
## ```
##
## On the desktop the same program builds and runs against Druid's simulated
## phone (druid/simulator): `newDruidApp` gives the window the phone's size
## (in dp, sharp at its density with RUI_SCALE), and a permission request
## shows a dialog in the app for you to answer, as the phone would
## (DRUID_PERMISSIONS=grant or deny answers them without asking).
##
## The Android app must contain both the `rui` and the `druid` Android
## libraries (DruidPermissionActivity comes with `druid`'s manifest).

import std/[os, strutils]
import rui
import idle_wait   # wakeMainLoop (RUI does not re-export it)
import ../druid

when defined(android):
  # raylib's build passes -d:AndroidNdk for its own native_app_glue; RUI's
  # android_host.nim relies on the same include path.
  const AndroidNdk {.strdefine.} = ""
  when AndroidNdk.len > 0:
    {.passC: "-I" & AndroidNdk & "/sources/android/native_app_glue".}
  {.compile: "ruiapp_glue.c".}
  proc druidRuiActivity(vm, activity: ptr pointer): cint {.importc: "druid_rui_activity".}

proc startDruidForRui*(): bool {.discardable.} =
  ## Start Druid with the NativeActivity RUI runs in, from RUI's thread. False
  ## on the desktop, or when there is no Activity yet.
  when defined(android):
    var vm, activity: pointer
    if druidRuiActivity(addr vm, addr activity) == 0: return false
    startDruid(cast[JavaVMPtr](vm), cast[jobject](activity))
    true
  else:
    false

proc wakeRui() {.nimcall, gcsafe.} =
  {.cast(gcsafe).}: wakeMainLoop()

proc newDruidApp*(title: string): App =
  ## An App the size of the phone: on Android the whole screen; on the desktop
  ## the simulated device's screen in dp (1080 x 2400 at 2.625x is 411 x 914).
  ## Set RUI_SCALE to the density to see it at the phone's sharpness.
  let p = simulator().profile
  when defined(android):
    newApp(title, 360, 800)       # RUI opens the display's own size on Android
  else:
    newApp(title, int(p.widthPx.float32 / p.density), int(p.heightPx.float32 / p.density))

proc permissionText(perms: seq[string]): string =
  var names: seq[string]
  for p in perms:
    names.add p.split('.')[^1].replace("_", " ").toLowerAscii
  "Allow this app to use: " & names.join(", ") & "?"

proc askOnDesktop(app: App) =
  ## The phone's permission dialog, on the desktop: when the simulator waits
  ## for an answer (policy ppAsk), ask the developer in the app itself.
  var box: MessageBox
  var showing = false
  let previous = app.onFrame
  app.onFrame = proc() =
    if previous != nil: previous()
    if showing or app.tree.root == nil: return
    let waiting = simulator().pendingRequests
    if waiting.len == 0: return
    if box == nil:
      box = newMessageBox(title = "Permission (simulated phone)", message = "",
                          messageType = mbQuestion, buttons = mbYesNo)
      box.onClose = proc(res: MessageBoxResult) =
        simulator().answer(granted = res == mrYes)
        showing = false
      app.tree.root.addChild(box)
    var perms: seq[string]
    for r in waiting: perms.add r.permissions
    box.message = permissionText(perms)
    showing = true
    box.show()

proc attachDruid*(app: App, onEvent: proc(ev: DruidEvent) {.closure.} = nil) =
  ## Start Druid (on Android), and from now on poll its events once per frame,
  ## before RUI handles input; each goes to `onEvent`. The latest values
  ## (`permissions().status`, `location().latest`, `sensors().latest`) are
  ## current whether or not `onEvent` is given. Chains any `onFrame` already set.
  discard startDruidForRui()
  setWakeHook(wakeRui)
  when not defined(android):
    # A person is at this window: ask them, unless told otherwise.
    if getEnv("DRUID_PERMISSIONS").len == 0:
      simulator().setPermissionPolicy(ppAsk)
    if simulator().permissionPolicy == ppAsk:
      app.askOnDesktop()
  let previous = app.onFrame
  app.onFrame = proc() =
    if previous != nil: previous()
    for ev in pollEvents():
      if onEvent != nil: onEvent(ev)
