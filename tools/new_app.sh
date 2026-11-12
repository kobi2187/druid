#!/bin/bash
# new_app.sh DIR PACKAGE [NAME] -- a new RUI + Druid Android app from
# templates/rui-app: app.nim, a Kotlin MainActivity (extends RUI's
# RuiActivity), the Gradle project with RUI's and Druid's libraries, build
# scripts and Robolectric tests.
#
#   RUI_DIR=~/rui2 tools/new_app.sh ~/hello com.example.hello "Hello"
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
[ $# -ge 2 ] || { echo "usage: new_app.sh DIR PACKAGE [NAME]"; exit 2; }
DEST="$1"; PKG="$2"; NAME="${3:-$(basename "$DEST")}"
[[ "$PKG" =~ ^[a-z][a-z0-9_]*(\.[a-z][a-z0-9_]*)+$ ]] || { echo "PACKAGE must look like com.example.app"; exit 2; }
[ ! -e "$DEST" ] || { echo "$DEST exists"; exit 2; }
RUI_DIR="$(cd "${RUI_DIR:-$ROOT/../rui2}" 2>/dev/null && pwd)" || { echo "no RUI checkout: set RUI_DIR"; exit 2; }
[ -d "$RUI_DIR/mobile/android/rui" ] || { echo "$RUI_DIR is not an RUI checkout"; exit 2; }
ID="$(basename "$DEST" | tr -c 'a-zA-Z0-9_\n' '_')"
PKGPATH="${PKG//.//}"

cp -r "$ROOT/templates/rui-app" "$DEST"
for d in main test; do
  mkdir -p "$DEST/android/app/src/$d/kotlin/$PKGPATH"
  mv "$DEST/android/app/src/$d/kotlin/PKGPATH/"* "$DEST/android/app/src/$d/kotlin/$PKGPATH/"
  rmdir "$DEST/android/app/src/$d/kotlin/PKGPATH"
done
grep -rl '__' "$DEST" | while read -r f; do
  sed -i "s|__APP_NAME__|$NAME|g; s|__APP_ID__|$ID|g; s|__PACKAGE__|$PKG|g; s|__RUI_DIR__|$RUI_DIR|g; s|__DRUID_DIR__|$ROOT|g" "$f"
done
cp "$ROOT/android/gradlew" "$ROOT/android/gradlew.bat" "$DEST/android/"
mkdir -p "$DEST/android/gradle/wrapper" && cp "$ROOT/android/gradle/wrapper/"* "$DEST/android/gradle/wrapper/"
chmod +x "$DEST/android/gradlew" "$DEST/build_android.sh" "$DEST/run_desktop.sh"
[ -n "${ANDROID_HOME:-}" ] && echo "sdk.dir=$ANDROID_HOME" > "$DEST/android/local.properties"
echo "created $DEST ($PKG): see $DEST/README.md"
