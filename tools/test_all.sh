#!/bin/bash
# test_all.sh [stage...] -- everything that checks Druid, in stages:
#
#   host     tests/test_host.nim: the Nim API on the desktop (no JVM)
#   android  the Nim harness and the sample's Nim built for the host, run in
#            Robolectric (android/druid, android/sample); the sample built with
#            the NDK for four ABIs and packaged into an APK
#   rui      Druid inside RUI: tests/test_rui.nim through RUI's UI harness, the
#            demo laid out headless, built for Android into libmain.so, and
#            android/rui-demo's Robolectric tests and APK. Needs an RUI
#            checkout (RUI_DIR, default ../rui2); skipped without one.
#
# No stage: all of them. Needs nim (2.x) and jnim; android needs a JDK and
# ANDROID_HOME with platform 36 and an NDK; rui needs naylib 25.x and yaml.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
STAGES=("$@"); [ ${#STAGES[@]} -gt 0 ] || STAGES=(host android rui)
export ANDROID_HOME="${ANDROID_HOME:-$HOME/android-sdk}"
GRADLE=(./gradlew --no-daemon -q -Pdruid.requireHarness=true)

for stage in "${STAGES[@]}"; do
  echo "== $stage"
  case "$stage" in
    host)
      nim c -r --hints:off --nimcache:"$ROOT/build/nimcache/test_host" \
        -o:"$ROOT/build/tests/test_host" "$ROOT/tests/test_host.nim" ;;
    android)
      "$ROOT/tools/build_host_harness.sh"
      "$ROOT/tools/build_ndk.sh"
      (cd "$ROOT/android" && "${GRADLE[@]}" :druid:testDebugUnitTest :sample:testDebugUnitTest :sample:assembleDebug) ;;
    rui)
      RUI_DIR="${RUI_DIR:-$ROOT/../rui2}"
      if [ ! -d "$RUI_DIR/packages/rui/src" ]; then
        echo "   skipped: no RUI checkout at $RUI_DIR (set RUI_DIR)"; continue
      fi
      export RUI_DIR
      "$ROOT/tools/test_rui.sh"
      "$ROOT/tools/build_rui_demo.sh"
      "$ROOT/tools/build_rui_android.sh"
      (cd "$ROOT/android" && "${GRADLE[@]}" :rui-demo:testDebugUnitTest :rui-demo:assembleDebug) ;;
    *) echo "unknown stage $stage (host, android, rui)"; exit 2 ;;
  esac
done
echo "== all passed"
