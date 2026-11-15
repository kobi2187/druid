## tests/conformance.nim on the desktop simulator. The same scenarios run on
## Robolectric (NimHarnessTest.conformance); both must say "ok".

import std/[unittest, strutils, tables]
import ../src/druid
import conformance

proc simArrange(what: string) =
  let w = what.splitWhitespace
  case w[0]
  of "deny": simulator().revoke("android.permission." & w[1])          # not granted, not yet asked
  of "grant": simulator().grant("android.permission." & w[1])
  of "ask": simulator().setPermissionPolicy(ppAsk)
  of "answer": simulator().answer(granted = w[1] == "allow")
  of "network": simulator().setNetwork(w[1], connected = w[2] == "1", metered = w[3] == "1")
  of "battery": simulator().setBattery(parseInt(w[1]), charging = w[2] == "1", plugged = w[3])
  of "sensor":
    if w[1] == "add": simulator().addSensor(parseInt(w[2]))
    else:
      var vs: seq[float32]
      for v in w[2 .. ^1]: vs.add parseFloat(v).float32
      simulator().setSensor(parseInt(w[1]), vs)
  of "provider": simulator().setProviderEnabled(w[1], w[2] == "on")
  of "fix": simulator().setLocation(parseFloat(w[1]), parseFloat(w[2]), accuracy = parseFloat(w[3]))
  of "idle", "disk", "camera": discard
  of "tap": simulator().tapNotification(parseInt(w[1]))
  of "press": simulator().pressAction(parseInt(w[1]), w[2])
  of "dismiss": simulator().dismissNotification(parseInt(w[1]))
  of "reply": simulator().reply(parseInt(w[1]), w[2 .. ^1].join(" "))
  of "share": simulator().share(text = w[1 .. ^1].join(" "))
  of "link": simulator().openLink(w[1])
  of "fire": simulator().fireAlarm(parseInt(w[1]))
  of "run": simulator().runJob(parseInt(w[1]))
  of "exact": simulator().setExactAlarmsAllowed(w[1] == "on")
  of "bluetooth": simulator().setBluetoothEnabled(w[1] == "on")
  of "ble": simulator().addBleDevice(w[1], rssi = parseInt(w[2]))
  else: raise newException(ValueError, "unknown arrangement " & what)

suite "conformance (desktop simulator)":
  for name in scenarios.keys:
    test name:
      simulator().useProfile("phone")
      check runScenario(name, simArrange) == "ok"
