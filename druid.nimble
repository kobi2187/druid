# Package

version       = "0.1.0"
author        = "Kobi"
description   = "Android wrapper library for Nim - idiomatic service APIs"
license       = "MIT"
srcDir        = "."
skipDirs      = @["docs", "examples", "tests", "android"]

# Dependencies
requires "nim >= 2.0.0"
requires "jnim >= 0.5.2"

# Tasks
task build, "Build Druid library for ARM64":
  exec "nim c -c --app:lib --os:android --cpu:arm64 druid.nim"

task buildArmv7, "Build for ARMv7":
  exec "nim c -c --app:lib --os:android --cpu:arm druid.nim"

task buildx86, "Build for x86 (emulator)":
  exec "nim c -c --app:lib --os:android --cpu:i386 druid.nim"

task buildx86_64, "Build for x86_64 (emulator)":
  exec "nim c -c --app:lib --os:android --cpu:amd64 druid.nim"

task buildAll, "Build for all architectures":
  exec "nimble buildArmv7"
  exec "nimble build"
  exec "nimble buildx86"
  exec "nimble buildx86_64"

task test, "Run tests":
  exec "nim c -r tests/test_all.nim"

task docs, "Generate documentation":
  exec "nim doc --project --index:on src/druid.nim"
