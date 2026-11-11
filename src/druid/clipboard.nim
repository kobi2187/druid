## Copy and paste plain text.
##
## ```nim
## clipboard().setText("Copied!")
## let t = clipboard().text        # Option[string]
## ```
##
## On the desktop a process-local clipboard stands in.

import std/[options]
import bridge

type Clipboard* = object
proc clipboard*(): Clipboard = discard

var desktopClip {.threadvar.}: Option[string]

proc setText*(_: Clipboard, text: string, label = "text") =
  ## `label` is shown by some keyboards' clipboard UIs.
  if druidStarted(): callStatic(void, "Clipboard", "setText", label, text)
  else: desktopClip = some(text)

proc text*(_: Clipboard): Option[string] =
  ## The clipboard's text; none when it is empty or holds something else.
  if druidStarted(): callStatic(Option[string], "Clipboard", "getText")
  else: desktopClip

proc hasText*(_: Clipboard): bool =
  bridged(desktopClip.isSome): callStatic(bool, "Clipboard", "hasText")

proc clear*(_: Clipboard) =
  if druidStarted(): callStatic(void, "Clipboard", "clear")
  else: desktopClip = none(string)
