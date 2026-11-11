#!/bin/bash
# build_ndk.sh [abi...] -- cross-compile a Nim program that uses Druid into
# an Android shared library with the NDK, for each ABI, into
# android/sample/src/main/jniLibs/<abi>/, then check what it links against.
#
#   tools/build_ndk.sh                       all four ABIs
#   tools/build_ndk.sh arm64-v8a             just one
#   DRUID_NDK_MAIN=app.nim DRUID_NDK_LIB=libapp.so DRUID_NDK_OUT=dir tools/build_ndk.sh
#
# Needs ANDROID_NDK_HOME (or ANDROID_HOME with an ndk/ inside) and nim on PATH.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
if [ -z "${ANDROID_NDK_HOME:-}" ]; then
  ANDROID_HOME="${ANDROID_HOME:-$HOME/android-sdk}"
  ANDROID_NDK_HOME="$(ls -d "$ANDROID_HOME"/ndk/* 2>/dev/null | sort -V | tail -1)"
fi
[ -d "${ANDROID_NDK_HOME:-}" ] || { echo "no NDK: set ANDROID_NDK_HOME"; exit 2; }
MAIN="${DRUID_NDK_MAIN:-$ROOT/examples/sample/sample.nim}"
LIB="${DRUID_NDK_LIB:-libdruidsample.so}"
OUT="${DRUID_NDK_OUT:-$ROOT/android/sample/src/main/jniLibs}"
API=24                                     # minSdk, as in android/*/build.gradle.kts
TC="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin"
ABIS=("$@"); [ ${#ABIS[@]} -gt 0 ] || ABIS=(arm64-v8a armeabi-v7a x86_64 x86)
for abi in "${ABIS[@]}"; do
  case "$abi" in
    arm64-v8a)   cpu=arm64; triple=aarch64-linux-android ;;
    armeabi-v7a) cpu=arm;   triple=armv7a-linux-androideabi ;;
    x86_64)      cpu=amd64; triple=x86_64-linux-android ;;
    x86)         cpu=i386;  triple=i686-linux-android ;;
    *) echo "unknown ABI $abi"; exit 2 ;;
  esac
  CC="$TC/$triple$API-clang"
  mkdir -p "$OUT/$abi"
  nim c --hints:off -d:release --os:android --cpu:$cpu --app:lib \
    --cc:clang --clang.exe:"$CC" --clang.linkerexe:"$CC" \
    --passL:"-Wl,-z,max-page-size=16384" \
    --path:"$ROOT/src" --nimcache:"$ROOT/build/nimcache/ndk_$abi" \
    -o:"$OUT/$abi/$LIB" "$MAIN"
  # What it needs at run time must all be on every device: libc, libm, libdl, liblog.
  needed="$("$TC/llvm-readelf" -d "$OUT/$abi/$LIB" | sed -n 's/.*Shared library: \[\(.*\)\]/\1/p' | sort | tr '\n' ' ')"
  for n in $needed; do
    case "$n" in libc.so|libm.so|libdl.so|liblog.so|libandroid.so) ;; *) echo "  $abi: unexpected dependency $n"; exit 1 ;; esac
  done
  # Android 15 devices with 16 KB pages refuse libraries aligned for 4 KB.
  align="$("$TC/llvm-readelf" -lW "$OUT/$abi/$LIB" | awk '$1=="LOAD"{print $NF}' | sort -u | tr '\n' ' ')"
  case "$align" in *0x1000\ *|*0x1000) echo "  $abi: LOAD segments 4 KB aligned ($align)"; exit 1 ;; esac
  jni="$("$TC/llvm-nm" -D --defined-only "$OUT/$abi/$LIB" | grep -c ' T Java_' || true)"
  echo "  $abi: $LIB $(du -h "$OUT/$abi/$LIB" | cut -f1), needs: $needed| $jni JNI entry points, LOAD align $align"
done
