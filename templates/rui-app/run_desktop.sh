#!/bin/bash
# run_desktop.sh -- build and run app.nim on this machine.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
prop() { sed -n "s/^$1=//p" "$HERE/android/gradle.properties"; }
export DRUID_DIR="${DRUID_DIR:-$(prop druid.dir)}" RUI_DIR="${RUI_DIR:-$(prop rui.dir)}"
ROOT="$DRUID_DIR" source "$DRUID_DIR/tools/rui_paths.sh"
mkdir -p "$HERE/build"
nim c --hints:off --warnings:off -d:useGraphics $RUI_PATHS --nimcache:"$HERE/build/nimcache" \
  -o:"$HERE/build/__APP_ID__" "$HERE/app.nim"
exec "$HERE/build/__APP_ID__" "$@"
