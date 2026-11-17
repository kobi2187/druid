#!/bin/bash
# publish_maven.sh -- build the Android libraries (dev.druid:druid and
# dev.druid:druid-fcm, release AARs with sources) into android/build/maven, a
# Maven repository. Use it from an app's settings.gradle.kts:
#   repositories { maven { url = uri("/path/to/druid/android/build/maven") } }
#   dependencies { implementation("dev.druid:druid:1.1.0") }
# or upload the directory to a Maven host.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
export ANDROID_HOME="${ANDROID_HOME:-$HOME/android-sdk}"
cd "$ROOT/android"
./gradlew --no-daemon -q :druid:publishReleasePublicationToLocalRepository \
  :druid-fcm:publishReleasePublicationToLocalRepository
find build/maven -name "*.aar" -o -name "*.pom" | sort
