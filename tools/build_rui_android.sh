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
for abi in "${ABIS[@]}"; do
  case "$abi" in
    arm64-v8a)   cpu=arm64; triple=aarch64-linux-android ;;
    armeabi-v7a) cpu=arm;   triple=armv7a-linux-androideabi ;;
    x86_64)      cpu=amd64; triple=x86_64-linux-android ;;
    *) echo "unknown ABI $abi"; exit 2 ;;
  esac
  CC="$TC/$triple$API-clang"
  mkdir -p "$OUT/$abi"
  nim c --hints:off --warnings:off -d:release \
    --os:android --cpu:$cpu --app:lib --noMain -d:useGraphics \
    -d:AndroidNdk="$ANDROID_NDK_HOME" \
    --cc:clang --clang.exe:"$CC" --clang.linkerexe:"$CC" \
    --passL:"-Wl,-z,max-page-size=16384" \
    $RUI_PATHS --nimcache:"$ROOT/build/nimcache/rui_android_$abi" \
    -o:"$OUT/$abi/libmain.so" "$MAIN"
  # NativeActivity's entry, raylib's glue calling the program, and Druid's hook into it.
  syms="$("$TC/llvm-nm" -D --defined-only "$OUT/$abi/libmain.so" | grep -c ' T \(ANativeActivity_onCreate\|android_main\|druid_rui_activity\)$' || true)"
  [ "$syms" = 3 ] || { echo "  $abi: libmain.so lacks ANativeActivity_onCreate, android_main or druid_rui_activity"; exit 1; }
  echo "  $abi: $OUT/$abi/libmain.so ($(du -h "$OUT/$abi/libmain.so" | cut -f1)), needs: $("$TC/llvm-readelf" -d "$OUT/$abi/libmain.so" | sed -n 's/.*Shared library: \[\(.*\)\]/\1/p' | tr '\n' ' ')"
done
# RUI's text engine looks for fonts in the APK's assets/fonts first.
FONTS="$(dirname "$OUT")/assets/fonts"
mkdir -p "$FONTS"
ROBOTO="${RUI_ROBOTO_DIR:-/usr/share/fonts/truetype/roboto/unhinted/RobotoTTF}"
for w in Regular Bold Italic BoldItalic Medium; do
  [ -f "$ROBOTO/Roboto-$w.ttf" ] && cp "$ROBOTO/Roboto-$w.ttf" "$FONTS/"
done
