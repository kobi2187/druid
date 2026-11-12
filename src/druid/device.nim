## The device: Android version, maker and model, locale.
##
## ```nim
## echo device().model, " on Android ", device().release, " (API ", device().apiLevel, ")"
## ```
##
## On the desktop: the simulated device's (simulator.nim; DRUID_DEVICE picks it).

import std/[os, strutils]
import bridge, simulator

type Device* = object
proc device*(): Device = discard

proc apiLevel*(_: Device): int =
  ## Build.VERSION.SDK_INT (24 is Android 7, 34 is Android 14).
  bridged(simulator().profile.apiLevel): callStatic(int, "Druid", "apiLevel")
proc release*(_: Device): string =
  ## "14", "15", ... (Build.VERSION.RELEASE).
  bridged(simulator().profile.release): callStatic(string, "Druid", "release")
proc manufacturer*(_: Device): string =
  bridged(simulator().profile.manufacturer): callStatic(string, "Druid", "manufacturer")
proc brand*(_: Device): string = bridged(simulator().profile.brand): callStatic(string, "Druid", "brand")
proc model*(_: Device): string = bridged(simulator().profile.model): callStatic(string, "Druid", "model")
proc codename*(_: Device): string =
  ## Build.DEVICE.
  bridged(simulator().profile.codename): callStatic(string, "Druid", "device")
proc abis*(_: Device): seq[string] =
  ## Supported ABIs, preferred first ("arm64-v8a", ...).
  bridged(@[(if hostCPU == "amd64": "x86_64" else: "arm64-v8a")]):
    callStatic(seq[string], "Druid", "supportedAbis")
proc locale*(_: Device): string =
  ## BCP 47 tag of the default locale ("en-US").
  bridged(getEnv("LANG", "en-US").split('.')[0].replace('_', '-')):
    callStatic(string, "Druid", "locale")
proc timeZone*(_: Device): string =
  ## IANA zone ("Europe/Paris").
  bridged(getEnv("TZ", "UTC")): callStatic(string, "Druid", "timeZone")
proc isNightMode*(_: Device): bool = bridged(simNightMode()): callStatic(bool, "Druid", "isNightMode")
proc isEmulator*(_: Device): bool =
  ## True in the simulator too: it is not a real phone.
  bridged(true): callStatic(bool, "Druid", "isEmulator")
proc lifecycleState*(_: Device): string =
  ## What last happened to an Activity of the app ("resumed", "paused", ...).
  bridged(simLifecycle()): callStatic(string, "Druid", "lifecycleState")
proc isAndroid*(_: Device): bool =
  ## Whether Druid runs against Android (a started JVM), rather than the desktop simulator.
  druidStarted()
