#!/bin/bash
# build_rui_android.sh [abi...] -- cross-compile an RUI program that uses Druid
# (default examples/rui/druid_demo.nim) into libmain.so for RUI's RuiActivity,
# the way RUI's own mobile/android/build_rui.sh builds its mockups.
#
#   RUI_DIR=/path/to/rui2 tools/build_rui_android.sh             arm64-v8a and x86_64
#   DRUID_RUI_MAIN=app.nim DRUID_RUI_OUT=dir tools/build_rui_android.sh arm64-v8a
#
# Output: android/rui-demo/src/main/jniLibs/<abi>/libmain.so (or DRUID_RUI_OUT).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
source "$ROOT/tools/rui_paths.sh"
if [ -z "${ANDROID_NDK_HOME:-}" ]; then
  ANDROID_HOME="${ANDROID_HOME:-$HOME/android-sdk}"
  ANDROID_NDK_HOME="$(ls -d "$ANDROID_HOME"/ndk/* 2>/dev/null | sort -V | tail -1)"
fi
[ -d "${ANDROID_NDK_HOME:-}" ] || { echo "no NDK: set ANDROID_NDK_HOME"; exit 2; }
MAIN="${DRUID_RUI_MAIN:-$ROOT/examples/rui/druid_demo.nim}"
OUT="${DRUID_RUI_OUT:-$ROOT/android/rui-demo/src/main/jniLibs}"
API=24
TC="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"
ABIS=("$@"); [ ${#ABIS[@]} -gt 0 ] || ABIS=(arm64-v8a x86_64)
# RUI's data sources import db_connector/db_sqlite, whose functions Nim loads
# from libsqlite3.so when the program starts. Android gives apps no such
# library (SQLite is not a public NDK library), so the program would print
# "could not load: libsqlite3.so" and exit before its first line. Link SQLite
# in instead: the amalgamation, built by the NDK, and --dynlibOverride.
SQLITE_VERSION=3500400; SQLITE_YEAR=2025
SQLITE_DIR="$ROOT/build/sqlite/sqlite-amalgamation-$SQLITE_VERSION"
if [ ! -f "$SQLITE_DIR/sqlite3.c" ]; then
  mkdir -p "$ROOT/build/sqlite"
  curl -fsSL --retry 4 -o "$ROOT/build/sqlite/sqlite.zip" \
    "https://www.sqlite.org/$SQLITE_YEAR/sqlite-amalgamation-$SQLITE_VERSION.zip"
  (cd "$ROOT/build/sqlite" && unzip -qo sqlite.zip)
fi
for abi in "${ABIS[@]}"; do
  case "$abi" in
    arm64-v8a)   cpu=arm64; triple=aarch64-linux-android ;;
    armeabi-v7a) cpu=arm;   triple=armv7a-linux-androideabi ;;
    x86_64)      cpu=amd64; triple=x86_64-linux-android ;;
    *) echo "unknown ABI $abi"; exit 2 ;;
  esac
  CC="$TC/$triple$API-clang"
  mkdir -p "$OUT/$abi" "$ROOT/build/sqlite/$abi"
  SQLITE_O="$ROOT/build/sqlite/$abi/sqlite3-meta.o"
  [ -f "$SQLITE_O" ] || "$CC" -c -O2 -fPIC -DSQLITE_THREADSAFE=1 -DSQLITE_OMIT_LOAD_EXTENSION -DSQLITE_ENABLE_COLUMN_METADATA \
    -o "$SQLITE_O" "$SQLITE_DIR/sqlite3.c"
  nim c --hints:off --warnings:off -d:release \
    --os:android --cpu:$cpu --app:lib --noMain -d:useGraphics \
    -d:AndroidNdk="$ANDROID_NDK_HOME" ${DRUID_RUI_FLAGS:-} \
    --cc:clang --clang.exe:"$CC" --clang.linkerexe:"$CC" \
    --passL:"-Wl,-z,max-page-size=16384" \
    --dynlibOverride:sqlite3 --passL:"$SQLITE_O" \
    $RUI_PATHS --nimcache:"$ROOT/build/nimcache/rui_android_$abi" \
    -o:"$OUT/$abi/libmain.so" "$MAIN"
  # NativeActivity's entry, raylib's glue calling the program, and Druid's hook into it.
  # Nothing may be left to dlopen at start-up but the system's own libraries.
  if strings "$OUT/$abi/libmain.so" | grep -q 'libsqlite3.so'; then
    echo "  $abi: libmain.so still loads libsqlite3.so at run time"; exit 1
  fi
  syms="$("$TC/llvm-nm" -D --defined-only "$OUT/$abi/libmain.so" | grep -c ' T \(ANativeActivity_onCreate\|android_main\)$' || true)"
  [ "$syms" = 2 ] || { echo "  $abi: libmain.so lacks ANativeActivity_onCreate or android_main"; exit 1; }
  echo "  $abi: $OUT/$abi/libmain.so ($(du -h "$OUT/$abi/libmain.so" | cut -f1)), needs: $("$TC/llvm-readelf" -d "$OUT/$abi/libmain.so" | sed -n 's/.*Shared library: \[\(.*\)\]/\1/p' | tr '\n' ' ')"
done
# RUI's text engine looks for fonts in the APK's assets/fonts first.
FONTS="$(dirname "$OUT")/assets/fonts"
mkdir -p "$FONTS"
ROBOTO="${RUI_ROBOTO_DIR:-/usr/share/fonts/truetype/roboto/unhinted/RobotoTTF}"
for w in Regular Bold Italic BoldItalic Medium; do
  [ -f "$ROBOTO/Roboto-$w.ttf" ] && cp "$ROBOTO/Roboto-$w.ttf" "$FONTS/"
done
