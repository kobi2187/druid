## Druid: Android's services for Nim programs, without its GUI.
##
## Druid gives a Nim program (an RUI app, a game, anything on the NDK) the
## parts of Android that live in Java: permissions, notifications, clipboard,
## vibration, sensors, location, network state, battery, storage paths,
## preferences, sharing and links, the soft keyboard, and more.
##
## ```nim
## import druid
##
## # Once, with the JVM and a Context (see druid/rui for RUI apps):
## startDruid(env, activity)
##
## echo device().model, " API ", device().apiLevel
## clipboard().setText("Copied!")
## vibration().vibrate(30)
## let req = permissions().request(pgLocation)
##
## # Each frame:
## for ev in pollEvents(): ...
## ```
##
## The Java half is the `druid` Android library (android/druid in this
## repository); add it to the app. On the desktop every call goes to a
## simulated Android device with the same rules (druid/simulator), so what
## works on the desktop works on the phone.

import druid/[bridge, events, log, ndk, simulator, device, app, permissions, clipboard, vibration,
              notifications, connectivity, power, storage, display, audio, location,
              sensors, keyboard, intents, prefs, crypto, hardware, media]
export bridge, events, log, ndk, simulator, device, app, permissions, clipboard, vibration,
       notifications, connectivity, power, storage, display, audio, location,
       sensors, keyboard, intents, prefs, crypto, hardware, media

const
  DruidVersionMajor* = 1
  DruidVersionMinor* = 0
  DruidVersionPatch* = 0
  DruidVersion* = $DruidVersionMajor & "." & $DruidVersionMinor & "." & $DruidVersionPatch
