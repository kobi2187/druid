## What other apps hand to this one: text, links and files shared with it
## (the share sheet), and links or files opened with it.
##
## ```nim
## for ev in pollEvents():
##   if ev.kind == ekIncoming:
##     case ev.incomingAction
##     of "send":
##       for path in ev.incomingFiles: importPhoto(path)   # copies, the app's to keep
##       if ev.incomingText.len > 0: addNote(ev.incomingText)
##     of "view": openLink(ev.incomingUrl)
## ```
##
## Android sends only what the app's manifest asks for, with intent filters on
## its Activity (the RUI template has them, commented out, for text, images
## and links). An app started by a share sees it at its first poll; a share
## while it runs needs `Druid.newIntent(this, intent)` in the Activity's
## onNewIntent (the template does it).
##
## On the desktop `simulator().share(...)` and `simulator().openLink(url)` play
## the other app.

import std/os
import bridge

type Incoming* = object
proc incoming*(): Incoming = discard

proc copiesDir*(_: Incoming): string =
  ## Where shared files are copied: the cache's druid_incoming directory.
  if druidStarted(): callStatic(string, "Storage", "cacheDir") / "druid_incoming"
  else: getTempDir() / "druid_incoming"

proc clearCopies*(i: Incoming) =
  ## Deletes the copies of shared files (move the ones to keep first).
  if druidStarted(): callStatic(void, "Incoming", "clearCopies")
  else:
    for f in walkFiles(i.copiesDir / "*"): removeFile(f)
