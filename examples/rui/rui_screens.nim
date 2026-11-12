## RUI's own mockup screens (RUI's mobile/mockups/rui/screens), unchanged,
## started the way druid_demo.nim is: Druid first, then RUI, with
## attachDruid. Which screen comes from the Intent's "screen" extra (or the
## command line on the desktop).
##
##   DRUID_RUI_MAIN=examples/rui/rui_screens.nim \
##   DRUID_RUI_FLAGS=--path:$RUI_DIR/mobile/mockups/rui tools/build_rui_android.sh

import std/[os]
import druid
import rui
import druid/ruiapp
import screens/[s01_hello, s02_counter, s03_login, s04_inbox]

proc screen(name: string): Widget =
  case name
  of "02_counter": counterScreen()
  of "03_login": loginScreen()
  of "04_inbox": inboxScreen()
  else: helloScreen()

when isMainModule:
  ruiAndroidMain:
    let name = if paramCount() >= 1: paramStr(1) else: intentExtra("screen", "01_hello")
    logInfo "rui_screens: showing ", name
    let app = newApp("RUI " & name, 360, 800)
    app.setTheme(intentExtra("theme", "material"))
    app.attachDruid()
    app.setRootWidget(screen(name))
    app.run()
