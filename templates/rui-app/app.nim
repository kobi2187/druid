## __APP_NAME__: an RUI app with Druid's Android services.
##
##   ./run_desktop.sh         on this machine (Druid answers with desktop stand-ins)
##   ./build_android.sh       libmain.so for every ABI, then:
##   (cd android && ./gradlew :app:installDebug)

import druid          # first: on Android, stdout/stderr go to logcat before anything else runs
import rui
import druid/ruiapp

proc mainScreen(status: Link[string]): Widget =
  ui:
    Column(crossAxisAlignment = CrossAxisAlignment.stretch):
      AppBar(title = "__APP_NAME__")
      Column(spacing = 12.0, crossAxisAlignment = CrossAxisAlignment.stretch):
        Label(text = device().model & " (API " & $device().apiLevel & ")", fontSize = 14.0)
        Label(text = status.value, fontSize = 16.0)
        Button(text = "Vibrate", onClick = proc() =
          vibration().effect(heClick))
        Button(text = "Ask for the camera", onClick = proc() =
          discard permissions().request(apCamera)
          status.value = "Asking...")

when isMainModule:
  ruiAndroidMain:
    state:
      status: string = "Hello"
    let app = newDruidApp("__APP_NAME__")      # the phone's size; full screen on Android
    app.attachDruid(proc(ev: DruidEvent) =
      if ev.kind == ekPermission:
        status.value = (if ev.results.len > 0 and ev.results[0].granted: "Camera granted" else: "Camera denied"))
    app.setRootWidget(mainScreen(status))
    app.run()
