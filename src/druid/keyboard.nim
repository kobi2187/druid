## The soft keyboard, for apps that draw their own text fields (RUI does).
##
## ```nim
## if field.focused: keyboard().show() else: keyboard().hide()
## ```
##
## On a NativeActivity (RUI) the keys typed then arrive as native key events.
## Does nothing on the desktop.

import bridge

type Keyboard* = object
proc keyboard*(): Keyboard = discard

proc show*(_: Keyboard): bool {.discardable.} =
  ## False when there is no Activity window to show it over.
  bridged(false): callStatic(bool, "Keyboard", "show")
proc hide*(_: Keyboard): bool {.discardable.} =
  bridged(false): callStatic(bool, "Keyboard", "hide")
proc isActive*(_: Keyboard): bool = bridged(false): callStatic(bool, "Keyboard", "isActive")
