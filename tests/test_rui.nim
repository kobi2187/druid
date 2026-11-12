## Druid inside RUI, on the desktop: the demo screen driven through RUI's real
## event router (RUI's tests/ui_harness.nim), with Druid's events reaching the
## UI through `attachDruid`'s per-frame poll.
##
##   RUI_DIR=/path/to/rui2 tools/test_rui.sh

import std/[unittest, options, strutils, os]
import rui
import ui_harness              # from RUI's tests/
import druid, druid/ruiapp
import ../examples/rui/druid_demo

putEnv("DRUID_OPEN_LINKS", "0")

proc buttons(w: Widget, into: var seq[Button]) =
  if w of Button: into.add Button(w)
  for c in w.children: buttons(c, into)

proc button(root: Widget, text: string): Button =
  var all: seq[Button]
  buttons(root, all)
  for b in all:
    if b.text == text: return b
  raise newException(KeyError, "no button " & text)

suite "Druid in an RUI app":
  setup:
    resetEventState()
    clipboard().clear()

  test "buttons call Druid":
    state:
      status: string = "Tap a button"
    let rig = newRig(druidDemo(status), 360, 800)
    rig.app.wireDemo(status)
    simulator().reset()
    rig.click(rig.root.button("Copy device info"))
    check clipboard().text == some(infoText())
    check status.value.startsWith("Copied ")
    rig.click(rig.root.button("Vibrate"))
    check status.value == "Buzz"                     # the simulated phone has one
    check simulator().vibrations == @["effect 0"]
    rig.click(rig.root.button("Share"))
    check simulator().opened.len == 1 and simulator().opened[0].startsWith("share ")

  test "a permission answer reaches the screen through attachDruid":
    simulator().setPermissionPolicy(ppGrant)
    putEnv("DRUID_PERMISSIONS", "grant")
    state:
      status: string = "Tap a button"
    let rig = newRig(druidDemo(status), 360, 800)
    rig.app.wireDemo(status)
    rig.click(rig.root.button("Ask for the camera"))
    # The click asked; the answer is an event, polled by the next frame's onFrame.
    rig.frame()
    check status.value == "camera granted"

  test "on the desktop a permission request asks in the app, like the phone":
    delEnv("DRUID_PERMISSIONS")
    simulator().reset()
    state:
      status: string = ""
    let rig = newRig(druidDemo(status), 360, 800)
    rig.app.wireDemo(status)                          # policy: ask
    rig.click(rig.root.button("Ask for the camera"))
    rig.frame(2)
    var box: MessageBox
    for c in rig.root.children:
      if c of MessageBox: box = MessageBox(c)
    check box != nil and box.message.contains("camera")
    check status.value == "Asking..."                 # still waiting for the answer
    check not permissions().check(apCamera)
    box.onClose(mrYes)                                # the developer says yes
    rig.frame(2)
    check status.value == "camera granted"
    check permissions().check(apCamera)
    putEnv("DRUID_PERMISSIONS", "grant")

  test "newDruidApp is the simulated phone's size in dp":
    let app = newDruidApp("t")
    check app.window.width == 411 and app.window.height == 914

  test "attachDruid keeps an onFrame that was already set":
    state:
      status: string = ""
    let rig = newRig(druidDemo(status), 360, 800)
    var frames = 0
    rig.app.onFrame = proc() = inc frames
    var seen: seq[DruidEventKind]
    rig.app.attachDruid(proc(ev: DruidEvent) = seen.add ev.kind)
    postLocal encodeEvent("memory", "15")
    rig.frame(3)
    check frames >= 3
    check seen == @[ekMemory]

  test "the demo describes events":
    check describe(parseEvent(encodeEvent("permission", "1", $apCamera, "0"))) == "camera denied"
    check describe(parseEvent(encodeEvent("connectivity", "wifi", "0", "0"))) == "Network: wifi (offline)"
    check infoLines().len == 3
    check not startDruidForRui()                    # no NativeActivity here
