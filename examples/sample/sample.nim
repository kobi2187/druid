## The native half of android/sample: a plain Java Activity that calls into
## Nim through JNI, the way any existing Android app can use Druid.
##
## Built by tools/build_ndk.sh (NDK clang, every ABI) into the sample's
## jniLibs, and by tools/build_host_harness.sh for the host, so the sample's
## Robolectric test runs the same code.

import std/[strutils]
import druid

proc report(): string =
  let d = device()
  let m = display().metrics
  var lines = @[
    "Druid " & DruidVersion,
    "Android " & d.release & " (API " & $d.apiLevel & "), " & d.manufacturer & " " & d.model,
    "App " & appInfo().packageName & " " & appInfo().versionName,
    "Screen " & $m.widthPx & "x" & $m.heightPx & " @ " & $m.dpi & " dpi",
    "Network " & $connectivity().networkType & (if connectivity().isConnected: " (online)" else: " (offline)"),
    "Battery " & $power().batteryLevel & "%",
    "Camera permission " & (if permissions().check(apCamera): "granted" else: "not granted"),
    "NDK API level " & $ndkApiLevel()]
  lines.join("\n")

var cameraRequest: PermissionRequest

proc Java_dev_druid_sample_MainActivity_nativeStart(env: JNIEnvPtr, thiz: jobject, activity: jobject) {.exportc, dynlib, cdecl.} =
  startDruid(env, activity)
  logInfo "sample started on API ", device().apiLevel

proc Java_dev_druid_sample_MainActivity_nativeReport(env: JNIEnvPtr, thiz: jobject): jstring {.exportc, dynlib, cdecl.} =
  newJString(env, try: report() except CatchableError as e: "error: " & e.msg)

proc Java_dev_druid_sample_MainActivity_nativeAskCamera(env: JNIEnvPtr, thiz: jobject) {.exportc, dynlib, cdecl.} =
  cameraRequest = permissions().request(apCamera)

proc Java_dev_druid_sample_MainActivity_nativePoll(env: JNIEnvPtr, thiz: jobject): jstring {.exportc, dynlib, cdecl.} =
  ## What happened since the last poll, one line per event.
  var lines: seq[string]
  for ev in pollEvents():
    case ev.kind
    of ekPermission:
      if ev.requestId == cameraRequest.id:
        lines.add "camera: " & $permissions().status(cameraRequest)
    of ekLifecycle: lines.add "lifecycle: " & ev.state
    else: lines.add $ev.kind
  newJString(env, lines.join("\n"))
