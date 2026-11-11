## The device: Android version, maker and model, locale.
##
## ```nim
## echo device().model, " on Android ", device().release, " (API ", device().apiLevel, ")"
## ```
##
## On the desktop: API level 0 and the host's names.

import std/[os, strutils]
import bridge

type Device* = object
proc device*(): Device = discard

proc apiLevel*(_: Device): int =
  ## Build.VERSION.SDK_INT (24 is Android 7, 34 is Android 14); 0 on the desktop.
  bridged(0): callStatic(int, "Druid", "apiLevel")
proc release*(_: Device): string =
  ## "14", "15", ... (Build.VERSION.RELEASE); "" on the desktop.
  bridged(""): callStatic(string, "Druid", "release")
proc manufacturer*(_: Device): string = bridged(""): callStatic(string, "Druid", "manufacturer")
proc brand*(_: Device): string = bridged(""): callStatic(string, "Druid", "brand")
proc model*(_: Device): string = bridged(hostOS): callStatic(string, "Druid", "model")
proc codename*(_: Device): string =
  ## Build.DEVICE.
  bridged(""): callStatic(string, "Druid", "device")
proc abis*(_: Device): seq[string] =
  ## Supported ABIs, preferred first ("arm64-v8a", ...).
  bridged(@[hostCPU]): callStatic(seq[string], "Druid", "supportedAbis")
proc locale*(_: Device): string =
  ## BCP 47 tag of the default locale ("en-US").
  bridged(getEnv("LANG", "en-US").split('.')[0].replace('_', '-')):
    callStatic(string, "Druid", "locale")
proc timeZone*(_: Device): string =
  ## IANA zone ("Europe/Paris").
  bridged(getEnv("TZ", "UTC")): callStatic(string, "Druid", "timeZone")
proc isNightMode*(_: Device): bool = bridged(false): callStatic(bool, "Druid", "isNightMode")
proc isEmulator*(_: Device): bool = bridged(false): callStatic(bool, "Druid", "isEmulator")
proc lifecycleState*(_: Device): string =
  ## What last happened to an Activity of the app ("resumed", "paused", ...).
  bridged(""): callStatic(string, "Druid", "lifecycleState")
proc isAndroid*(_: Device): bool =
  ## Whether Druid runs against Android (a started JVM), rather than the desktop stand-ins.
  druidStarted()
