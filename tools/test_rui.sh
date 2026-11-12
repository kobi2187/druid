#!/bin/bash
# test_rui.sh -- tests/test_rui.nim: Druid inside RUI on the desktop, through
# RUI's own UI test harness. RUI_DIR=/path/to/rui2 (default ../rui2).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
source "$ROOT/tools/rui_paths.sh"
mkdir -p "$ROOT/build/tests"
nim c -r --hints:off --warnings:off -d:useGraphics $RUI_PATHS --path:"$RUI_DIR/tests" \
  --nimcache:"$ROOT/build/nimcache/test_rui" -o:"$ROOT/build/tests/test_rui" "$ROOT/tests/test_rui.nim"
