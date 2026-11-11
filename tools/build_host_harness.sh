#!/bin/bash
# build_host_harness.sh -- compile tests/robolectric/harness.nim for this
# machine (not for Android) as build/host/libdruid_harness.so, the library
# android/druid's NimHarnessTest loads into Robolectric's JVM.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$ROOT/build/host"
# -d:noSignalHandler: the JVM uses SIGSEGV itself (null checks, safepoints);
# a Nim handler would take those signals and kill it.
nim c --hints:off --app:lib -d:noSignalHandler --debugger:native \
  --nimcache:"$ROOT/build/nimcache/host_harness" \
  -o:"$ROOT/build/host/libdruid_harness.so" "$ROOT/tests/robolectric/harness.nim"
echo "built $ROOT/build/host/libdruid_harness.so"
