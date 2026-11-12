## Accelerometer, gyroscope, light, proximity, steps, ...
##
## ```nim
## if sensors().has(stAccelerometer):
##   discard sensors().start(stAccelerometer, sdGame)
## # each frame, after pollEvents():
## let r = sensors().latest(stAccelerometer)
## if r.isSome: tilt(r.get.values[0], r.get.values[1])
## ```
##
## Readings arrive as `ekSensor` events; `latest` keeps the newest per type.
## Stop sensors you do not need: they cost battery. On the desktop the
## simulated device has its profile's sensors, fed by `simulator().setSensor`.

import std/[options]
import bridge, events, simulator
export SensorReading

type
  Sensors* = object
  SensorType* = enum
    ## Sensor.TYPE_*.
    stAccelerometer = 1, stMagneticField = 2, stGyroscope = 4, stLight = 5,
    stPressure = 6, stProximity = 8, stGravity = 9, stLinearAcceleration = 10,
    stRotationVector = 11, stRelativeHumidity = 12, stAmbientTemperature = 13,
    stGameRotationVector = 15, stSignificantMotion = 17, stStepDetector = 18,
    stStepCounter = 19, stHeartRate = 21
  SensorDelay* = enum
    ## SensorManager.SENSOR_DELAY_*: how often readings come.
    sdFastest = 0, sdGame = 1, sdUi = 2, sdNormal = 3
  SensorInfo* = object
    name*, vendor*: string
    maxRange*, resolution*: float32
    powerMa*: float32
    minDelayUs*: int

proc sensors*(): Sensors = discard

proc has*(_: Sensors, t: SensorType): bool =
  bridged(ord(t) in simulator().profile.sensors): callStatic(bool, "Sensors", "has", ord(t))

proc info*(_: Sensors, t: SensorType): Option[SensorInfo] =
  if not druidStarted():
    if ord(t) notin simulator().profile.sensors: return none(SensorInfo)
    return some(SensorInfo(name: "Simulated " & ($t)[2 .. ^1], vendor: "Druid simulator",
                           maxRange: 1000, resolution: 0.01, powerMa: 0.5, minDelayUs: 10_000))
  let d = callStatic(seq[string], "Sensors", "describe", ord(t))
  let s = callStatic(seq[float32], "Sensors", "specs", ord(t))
  if d.len < 2 or s.len < 4: return none(SensorInfo)
  some(SensorInfo(name: d[0], vendor: d[1], maxRange: s[0], resolution: s[1],
                  powerMa: s[2], minDelayUs: int(s[3])))

proc types*(_: Sensors): seq[int] =
  ## Sensor.TYPE_* of every sensor on the device (some have no `SensorType`).
  bridged(simulator().profile.sensors): callStatic(seq[int], "Sensors", "types")

proc start*(_: Sensors, t: SensorType, delay: SensorDelay = sdUi): bool {.discardable.} =
  ## Start readings; false when the device has no such sensor.
  bridged(simStartSensor(ord(t))): callStatic(bool, "Sensors", "start", ord(t), ord(delay))

proc start*(_: Sensors, t: SensorType, periodUs: int): bool {.discardable.} =
  ## Start readings about every `periodUs` microseconds (more than 3).
  if periodUs <= 3: raise newException(ValueError, "periodUs must be > 3; use a SensorDelay")
  bridged(simStartSensor(ord(t))): callStatic(bool, "Sensors", "start", ord(t), periodUs)

proc stop*(_: Sensors, t: SensorType) =
  if druidStarted(): callStatic(void, "Sensors", "stop", ord(t))
  else: simStopSensor(ord(t))
proc stopAll*(_: Sensors) =
  if druidStarted(): callStatic(void, "Sensors", "stopAll")
  else: simStopAllSensors()
proc isRunning*(_: Sensors, t: SensorType): bool =
  bridged(simSensorRunning(ord(t))): callStatic(bool, "Sensors", "isRunning", ord(t))

proc latest*(_: Sensors, t: SensorType): Option[SensorReading] =
  ## The newest reading `pollEvents` has seen.
  latestReading(ord(t))
