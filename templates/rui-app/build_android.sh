#!/bin/bash
# build_android.sh [abi...] -- app.nim (RUI + Druid) into android/app/src/main/jniLibs/<abi>/libmain.so.
# DRUID_DIR and RUI_DIR come from android/gradle.properties unless set.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
prop() { sed -n "s/^$1=//p" "$HERE/android/gradle.properties"; }
export DRUID_DIR="${DRUID_DIR:-$(prop druid.dir)}" RUI_DIR="${RUI_DIR:-$(prop rui.dir)}"
DRUID_RUI_MAIN="$HERE/app.nim" DRUID_RUI_OUT="$HERE/android/app/src/main/jniLibs" \
  "$DRUID_DIR/tools/build_rui_android.sh" "$@"
