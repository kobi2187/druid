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
## On the desktop the same program builds and runs: Druid answers with its
## desktop stand-ins and `attachDruid` only polls Druid's own local events.
##
## The Android app must contain both the `rui` and the `druid` Android
## libraries (DruidPermissionActivity comes with `druid`'s manifest).

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

proc attachDruid*(app: App, onEvent: proc(ev: DruidEvent) {.closure.} = nil) =
  ## Start Druid (on Android), and from now on poll its events once per frame,
  ## before RUI handles input; each goes to `onEvent`. The latest values
  ## (`permissions().status`, `location().latest`, `sensors().latest`) are
  ## current whether or not `onEvent` is given. Chains any `onFrame` already set.
  discard startDruidForRui()
  setWakeHook(wakeRui)
  let previous = app.onFrame
  app.onFrame = proc() =
    if previous != nil: previous()
    for ev in pollEvents():
      if onEvent != nil: onEvent(ev)
