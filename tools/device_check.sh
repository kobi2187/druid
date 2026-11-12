#!/bin/bash
# device_check.sh -- Druid on a real device or emulator (whatever `adb` sees).
#
#   1. the instrumented tests: the Nim harness built with the NDK, run against
#      real ART and real system services (android/druid/src/androidTest)
#   2. the sample app (Java Activity -> Nim): launch, read its screen, press
#      "Ask for the camera", answer the real system dialog, read the result
#   3. the RUI demo (RuiActivity running RUI + Druid in libmain.so): launch,
#      tap "Ask for the camera", allow, check the screen and logcat
#
# Screenshots and logs go to build/device/. Build first:
#   tools/build_ndk.sh x86_64          (sample) and the harness:
#   DRUID_NDK_MAIN=tests/robolectric/harness.nim DRUID_NDK_LIB=libdruid_harness.so \
#     DRUID_NDK_OUT=android/druid/src/androidTest/jniLibs tools/build_ndk.sh x86_64
#   RUI_DIR=... tools/build_rui_android.sh x86_64
#   (cd android && ./gradlew :druid:assembleDebugAndroidTest :sample:assembleDebug :rui-demo:assembleDebug)
#
# Slow emulators (no KVM) are fine: every wait polls with a long deadline.
set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/build/device"
mkdir -p "$OUT"
export ANDROID_HOME="${ANDROID_HOME:-$HOME/android-sdk}"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
A="$ROOT/android"
FAIL=0
pass() { echo "  PASS  $*"; }
fail() { echo "  FAIL  $*"; FAIL=$((FAIL + 1)); }

adb wait-for-device
until [ "$(adb shell getprop sys.boot_completed | tr -d '\r')" = 1 ]; do sleep 5; done
echo "device: $(adb shell getprop ro.product.model | tr -d '\r'), API $(adb shell getprop ro.build.version.sdk | tr -d '\r'), $(adb shell getprop ro.product.cpu.abi | tr -d '\r')"
# Slow (software) emulators: system ANR dialogs would cover the apps, adb
# install verification times out, and the emulated Bluetooth stack
# crash-loops; none of it is under test.
adb shell settings put global hide_error_dialogs 1 >/dev/null 2>&1
adb shell settings put global verifier_verify_adb_installs 0 >/dev/null 2>&1
if [ "$(adb shell getprop ro.kernel.qemu | tr -d '\r')" = 1 ] || adb shell getprop ro.product.model | grep -qi "sdk\|emulator"; then
  adb shell pm disable-user --user 0 com.android.bluetooth >/dev/null 2>&1
fi
adb shell settings put global window_animation_scale 0 >/dev/null 2>&1
adb shell settings put global transition_animation_scale 0 >/dev/null 2>&1
adb shell settings put global animator_duration_scale 0 >/dev/null 2>&1
adb shell input keyevent KEYCODE_WAKEUP >/dev/null 2>&1
adb shell wm dismiss-keyguard >/dev/null 2>&1

# The UI as XML; `ui_has TEXT` and `tap_text TEXT` work on it.
ui_dump() { adb shell uiautomator dump /sdcard/ui.xml >/dev/null 2>&1; adb shell cat /sdcard/ui.xml 2>/dev/null; }
ui_has() { ui_dump | grep -q "$1"; }
wait_ui() {  # wait_ui TEXT [seconds]
  local deadline=$(( $(date +%s) + ${2:-300} ))
  while [ "$(date +%s)" -lt "$deadline" ]; do ui_has "$1" && return 0; sleep 3; done
  return 1
}
tap_text() {  # the centre of the first node whose text matches (case-insensitive)
  local b
  b="$(ui_dump | tr '>' '\n' | grep -i "text=\"$1\"" | head -1 | sed -n 's/.*bounds="\[\([0-9]*\),\([0-9]*\)\]\[\([0-9]*\),\([0-9]*\)\]".*/\1 \2 \3 \4/p')"
  [ -n "$b" ] || return 1
  set -- $b
  adb shell input tap $(( ($1 + $3) / 2 )) $(( ($2 + $4) / 2 ))
}
allow_dialog() {  # answer the system permission dialog with "Allow"/"While using the app"
  local deadline=$(( $(date +%s) + 300 ))
  while [ "$(date +%s)" -lt "$deadline" ]; do
    for t in "While using the app" "Allow" "ALLOW" "Only this time"; do tap_text "$t" && return 0; done
    sleep 3
  done
  return 1
}
shot() { adb exec-out screencap -p > "$OUT/$1.png"; }
install() {  # right after boot the package manager can still refuse: retry
  local k
  for k in 1 2 3 4 5; do
    adb install -r -t "$1" 2>&1 | grep -q '^Success' && return 0
    sleep 20
  done
  return 1
}

# Let the system finish settling after boot before installing.
until adb shell cmd package list packages >/dev/null 2>&1; do sleep 5; done

# ---- 1. instrumented tests ----
echo "== instrumented tests (Nim harness on ART)"
install "$A/druid/build/outputs/apk/androidTest/debug/druid-debug-androidTest.apk" || fail "install test apk"
adb shell am instrument -w -r dev.druid.test/androidx.test.runner.AndroidJUnitRunner > "$OUT/instrument.txt" 2>&1
ok="$(grep -c '^INSTRUMENTATION_STATUS_CODE: 0' "$OUT/instrument.txt")"
bad="$(grep -c '^INSTRUMENTATION_STATUS_CODE: -2' "$OUT/instrument.txt")"
if grep -q '^OK (' "$OUT/instrument.txt"; then pass "instrumented: $(grep '^OK (' "$OUT/instrument.txt")"
else fail "instrumented: $ok passed, $bad failed (build/device/instrument.txt)"; grep -A3 'stack=' "$OUT/instrument.txt" | head -30; fi

# ---- 2. sample app ----
echo "== sample app (Java Activity calling Nim)"
install "$A/sample/build/outputs/apk/debug/sample-debug.apk" || fail "install sample"
adb shell pm revoke dev.druid.sample android.permission.CAMERA >/dev/null 2>&1
adb logcat -c
adb shell am start -W -n dev.druid.sample/.MainActivity >/dev/null
if wait_ui "Druid 1.0.0" 300; then pass "sample shows the Nim report"; else fail "sample report"; fi
ui_has "Camera permission not granted" && pass "sample: camera not granted at start" || fail "sample: initial camera state"
shot sample_start
tap_text "Ask for the camera" || tap_text "ASK FOR THE CAMERA" || fail "sample: no button"
if allow_dialog; then pass "sample: system permission dialog answered"; else fail "sample: no permission dialog"; fi
sleep 5
adb shell am start -W -n dev.druid.sample/.MainActivity >/dev/null     # onResume re-reads the report
if wait_ui "camera: psGranted" 120; then pass "sample: Nim saw the grant (psGranted)"; else fail "sample: grant not reported"; fi
ui_has "Camera permission granted" && pass "sample: report updated" || fail "sample: report not updated"
shot sample_granted
adb logcat -d -s druid > "$OUT/sample_logcat.txt"
grep -q "sample started on API" "$OUT/sample_logcat.txt" && pass "sample: logInfo reached logcat" || fail "sample: no druid log in logcat"

# ---- 3. RUI demo ----
if [ -f "$A/rui-demo/build/outputs/apk/debug/rui-demo-debug.apk" ]; then
  echo "== RUI demo (RuiActivity: RUI + Druid in libmain.so)"
  install "$A/rui-demo/build/outputs/apk/debug/rui-demo-debug.apk" || fail "install rui-demo"
  adb shell pm revoke dev.druid.ruidemo android.permission.CAMERA >/dev/null 2>&1
  adb logcat -c
  adb shell am start -W -n dev.druid.ruidemo/.Launcher >/dev/null
  # RUI draws with GL: nothing for uiautomator to read. Wait for its first frame in logcat.
  deadline=$(( $(date +%s) + 600 ))
  until adb logcat -d | grep -q "RUI Application Started\|TEXTURE: \[ID" || [ "$(date +%s)" -gt "$deadline" ]; do sleep 5; done
  sleep 20
  shot rui_start
  adb logcat -d | grep -E "druid|raylib|RUI|FATAL|AndroidRuntime" > "$OUT/rui_logcat_start.txt"
  if adb logcat -d | grep -q "FATAL EXCEPTION\|Fatal signal"; then fail "rui-demo crashed (build/device/rui_logcat_start.txt)"; else pass "rui-demo running"; fi
  # Tap "Ask for the camera": the last of five buttons. RUI lays out in dp;
  # its rows are at y = 56 (app bar) + labels + buttons, see build/rui_demo/layout.txt.
  read -r W H < <(adb shell wm size | sed -n 's/.*: \([0-9]*\)x\([0-9]*\).*/\1 \2/p' | tail -1)
  D="$(adb shell wm density | sed -n 's/.*: \([0-9]*\).*/\1/p' | tail -1)"
  y_dp="$(awk '/Button/{n++; if (n==5) {split($3,a,","); split($4,b,"x"); print a[2]+b[2]/2}}' "$ROOT/build/rui_demo/layout.txt")"
  scale="$(echo "$D / 160" | bc -l)"
  adb shell input tap $(( W / 2 )) "$(printf '%.0f' "$(echo "$y_dp * $scale" | bc -l)")"
  if allow_dialog; then pass "rui-demo: Druid's permission dialog over RuiActivity answered"; else fail "rui-demo: no permission dialog"; fi
  deadline=$(( $(date +%s) + 300 ))
  until adb logcat -d -s druid | grep -q "event: camera granted" || [ "$(date +%s)" -gt "$deadline" ]; do sleep 5; done
  sleep 10
  shot rui_granted
  adb logcat -d -s druid > "$OUT/rui_logcat.txt"
  grep -q "event: camera granted" "$OUT/rui_logcat.txt" && pass "rui-demo: the answer reached RUI (attachDruid)" || fail "rui-demo: no grant event"
  [ "$(adb shell pm dump dev.druid.ruidemo | grep -c 'android.permission.CAMERA: granted=true')" -ge 1 ] && pass "rui-demo: camera granted in the system" || fail "rui-demo: not granted"
fi

echo "== $FAIL failed; screenshots and logs in build/device/"
exit $(( FAIL > 0 ))
