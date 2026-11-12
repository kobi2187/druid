## Haptic feedback.
##
## ```nim
## vibration().vibrate(30)                    # a tap
## vibration().effect(heHeavyClick)
## vibration().pattern([0, 100, 50, 100])     # pause, buzz, pause, buzz
## ```
##
## The manifest needs android.permission.VIBRATE (the druid library declares it).
## On the desktop the simulated device records what it would have felt
## (`simulator().vibrations`).

import std/strutils
import bridge, simulator

type
  Vibration* = object
  HapticEffect* = enum
    ## VibrationEffect.EFFECT_*; before Android 10 a short pulse stands in.
    heClick = 0, heDoubleClick = 1, heTick = 2, heHeavyClick = 5

proc vibration*(): Vibration = discard

proc hasVibrator*(_: Vibration): bool =
  bridged(simulator().profile.hasVibrator): callStatic(bool, "Vibration", "hasVibrator")
proc hasAmplitudeControl*(_: Vibration): bool =
  bridged(simulator().profile.amplitudeControl and simulator().profile.apiLevel >= 26):
    callStatic(bool, "Vibration", "hasAmplitudeControl")

proc vibrate*(_: Vibration, millis: int, amplitude = -1) =
  ## Buzz for `millis`; `amplitude` 1..255, or -1 for the device's default.
  if amplitude != -1 and amplitude notin 1..255:
    raise newException(ValueError, "amplitude must be 1..255 or -1, not " & $amplitude)
  if druidStarted(): callStatic(void, "Vibration", "vibrate", int64(millis), amplitude)
  elif millis > 0: simVibrate($millis & "ms")

proc pattern*(_: Vibration, timings: openArray[int], repeat = -1) =
  ## Alternating pause/buzz durations in ms, starting with a pause. `repeat`
  ## -1 plays once; otherwise the index to loop from (until `cancel`).
  if repeat >= timings.len:
    raise newException(ValueError, "repeat index " & $repeat & " outside the pattern")
  var t: seq[int64]
  for x in timings: t.add int64(x)
  if druidStarted(): callStatic(void, "Vibration", "pattern", t, repeat)
  elif t.len > 0: simVibrate("pattern " & t.join(","))

proc effect*(_: Vibration, e: HapticEffect) =
  if druidStarted(): callStatic(void, "Vibration", "effect", ord(e))
  else: simVibrate("effect " & $ord(e))

proc cancel*(_: Vibration) =
  if druidStarted(): callStatic(void, "Vibration", "cancel")
  else: simVibrate("cancel")
