#!/bin/bash
# build_rui_demo.sh -- build examples/rui/druid_demo.nim for the desktop, and
# lay its screen out once without a window (RUI_LAYOUT_DUMP) to check it runs.
#   RUI_DIR=/path/to/rui2 tools/build_rui_demo.sh
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
source "$ROOT/tools/rui_paths.sh"
mkdir -p "$ROOT/build/rui_demo"
nim c --hints:off --warnings:off -d:useGraphics $RUI_PATHS \
  --nimcache:"$ROOT/build/nimcache/rui_demo" \
  -o:"$ROOT/build/rui_demo/druid_demo" "$ROOT/examples/rui/druid_demo.nim"
RUI_LAYOUT_DUMP="$ROOT/build/rui_demo/layout.txt" "$ROOT/build/rui_demo/druid_demo"
grep -q "AppBar" "$ROOT/build/rui_demo/layout.txt" || { echo "layout misses the app bar"; exit 1; }
echo "built build/rui_demo/druid_demo; layout in build/rui_demo/layout.txt ($(wc -l < "$ROOT/build/rui_demo/layout.txt") lines)"
