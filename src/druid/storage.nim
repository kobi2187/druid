## Where the app keeps files, and how much space there is. Read and write the
## paths with std/os and friends.
##
## ```nim
## writeFile(storage().filesDir / "notes.txt", "hello")
## ```
##
## On the desktop: a directory under the user's data directory, named after the program.

import std/[os]
import bridge

type Storage* = object
proc storage*(): Storage = discard

proc desktopDir(sub: string): string =
  result = getHomeDir() / ".local" / "share" / getAppFilename().extractFilename.changeFileExt("") / sub
  createDir(result)

proc filesDir*(_: Storage): string =
  ## Private files, kept until the app is uninstalled (Context.getFilesDir).
  if druidStarted(): callStatic(string, "Storage", "filesDir") else: desktopDir("files")
proc cacheDir*(_: Storage): string =
  ## Files the system may delete when space runs low.
  if druidStarted(): callStatic(string, "Storage", "cacheDir") else: desktopDir("cache")
proc noBackupDir*(_: Storage): string =
  ## Like filesDir, but excluded from backups.
  if druidStarted(): callStatic(string, "Storage", "noBackupDir") else: desktopDir("nobackup")
proc dataDir*(_: Storage): string =
  if druidStarted(): callStatic(string, "Storage", "dataDir") else: desktopDir("")
proc externalFilesDir*(_: Storage, kind = ""): string =
  ## The app's directory on shared storage (no permission needed); `kind` e.g.
  ## "Pictures", "Music", "Download". "" when not mounted.
  if druidStarted(): callStatic(string, "Storage", "externalFilesDir", kind)
  else: desktopDir("external" / kind)
proc externalCacheDir*(_: Storage): string =
  if druidStarted(): callStatic(string, "Storage", "externalCacheDir") else: desktopDir("external-cache")
proc externalState*(_: Storage): string =
  ## "mounted", "removed", ... (Environment.MEDIA_*).
  bridged("mounted"): callStatic(string, "Storage", "externalState")
proc freeBytes*(_: Storage, path: string): int64 =
  ## Bytes available to the app on the volume of `path`; -1 on the desktop.
  bridged(-1'i64): callStatic(int64, "Storage", "freeBytes", path)
proc totalBytes*(_: Storage, path: string): int64 =
  bridged(-1'i64): callStatic(int64, "Storage", "totalBytes", path)
