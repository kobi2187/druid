# Patches for RUI

Found while running RUI and Druid on an Android emulator. Apply in an RUI
checkout with `git apply 0001-android-sqlite-and-logcat.patch`.

## 0001: RUI apps start on Android; start-up failures reach logcat

**SQLite.** `rui_widgets/sources/readers.nim` imports `db_connector/db_sqlite`.
Nim loads its functions from `libsqlite3.so` while `NimMain` initializes the
modules. Android gives apps no such library, because SQLite is not a public
NDK library. So every RUI program on Android, the mockups in kotlin-host
included, printed `could not load: libsqlite3.so(|.0)` and exited with
status 1 before its first line ran. RUI's mobile checks render on the host
(Xvfb) and so never met this.

`mobile/android/build_rui.sh` now does three things:
- downloads the SQLite amalgamation once;
- compiles it per ABI with the NDK, with `SQLITE_ENABLE_COLUMN_METADATA`,
  which db_connector needs;
- links it in with `--dynlibOverride:sqlite3`.

It then checks that nothing is left to `dlopen` it. The SQLite source works
on Android as a result.

**Silent failures.** Android discards stdout and stderr, so all anyone saw of
the SQLite failure was `Zygote: Process N exited cleanly (1)`.
`packages/rui/src/android_stdio.c`, compiled from `android_host.nim`, sends
both streams to logcat (tags `stdout` and `stderr`) from the moment
`libmain.so` loads, and flushes them at exit. The flush matters because a
failing start-up ends with `exit()` before a reader thread would get to the
last lines. `-d:ruiKeepStdio` turns it off.

Druid does the same and both set `NIM_STDIO_LOGCAT`, so an app with RUI and
Druid redirects once.

## 0002: sharp text and edges on phones (density-aware rendering)

Before this patch, RUI laid out the window it was given (`newApp(..., 360, 800)`).
On Android, raylib rendered that size and stretched it to the screen, about 3x
on a 1080x2400 phone, so text and edges were soft. Now:

- **Two kinds of pixel.** Layout, widget bounds, events and font sizes are in
  logical pixels (Android's dp). The window, the widget textures and the glyph
  rasters are in physical pixels. `pixelScale` (in the new
  `rui_core/pixel_density.nim`) relates the two:
  - Android: the display's density, `displayDpi() / 160`; the window opens at
    the display's native size.
  - Desktop: `RUI_SCALE`, 1 by default, so a desktop window can show a phone's
    layout at the phone's sharpness.
- **Rendering at full resolution:**
  - widget textures are allocated at their bounds × scale and painted under a
    scale transform;
  - glyphs are rasterized from the font scaled by `pixelScale`;
  - every blit lands 1:1 on physical pixels.
- **Input.** Pointer, touch and GLFW button positions are divided by the scale,
  as are the window size the layout fills and the visual probe's rectangles.

At scale 1 nothing changes. Tested:
- RUI's unit tests (2094), GL checks, scripted UI tests and the 59 layout
  snapshots, all unchanged;
- RUI's scripted UI tests also pass at `RUI_SCALE=2`;
- clicks land correctly at 1, 3 and 2.625;
- new `tests/gl/pixel_density.nim` (at 2x: window size, logical layout, the
  exact physical pixels a square covers, textures and glyphs at 2x, logical hit
  testing) and `tests/test_pixel_density.nim`.

Applies on its own or after 0001.
