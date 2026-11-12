# Package

version       = "1.0.0"
author        = "Kobi"
description   = "Android's services for Nim programs (RUI apps, games, anything on the NDK), without its GUI"
license       = "MIT"
srcDir        = "src"

# Dependencies

requires "nim >= 2.0.0"
requires "jnim >= 0.5.2"

# The Java half is the Android library in android/druid; see README.md.

task test, "Run the desktop tests (tools/test_all.sh runs every stage)":
  exec "nim c -r --hints:off tests/test_host.nim"
