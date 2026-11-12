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

## Not in this patch: blurry text on phones

RUI lays out the window it was given (`newApp(..., 360, 800)`). On Android,
raylib renders that size and stretches it to the screen, about 3x on a
1080x2340 phone, so text is soft. This is item 2 in RUI's
`mobile/README.md`. The fix is to render at the physical size:

- lay out in dp, scaling by `displayDpi() / 160`;
- rasterize glyphs and textures at the scaled size.

Rendering at the physical size and stretching the result would not help.
