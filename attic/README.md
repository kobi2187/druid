# Attic

Material from before Druid 1.0, kept for reference. None of it is built,
tested or imported.

- `previous_attempt/` -- the android-for-nim project Druid grew out of.
- `lowlevel/ndk_bindings.nim` -- broad NDK bindings (sensors, camera2ndk,
  AAudio, ...) from that project; Druid 1.0 uses the NDK only where it needs to
  (`src/druid/ndk.nim`, `src/druid/log.nim`).
- `whole discussion.md`, `mappings.txt`, `niceapi.txt`, `managers.txt` -- the
  original design discussion and API sketches.

The 0.x Nim modules (`managers/`, `core.nim`, ...) were written against a jnim
API that does not exist and never compiled; Druid 1.0 replaced them (see the
git history for their text).
