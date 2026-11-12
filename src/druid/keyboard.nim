## The soft keyboard, for apps that draw their own text fields (RUI does).
##
## ```nim
## if field.focused: keyboard().show() else: keyboard().hide()
## ```
##
## On a NativeActivity (RUI) the keys typed then arrive as native key events.
## On the desktop the simulator only remembers whether it would be showing
## (`simulator().keyboardVisible`): the real keyboard is already there.

import bridge, simulator

type Keyboard* = object
proc keyboard*(): Keyboard = discard

proc show*(_: Keyboard): bool {.discardable.} =
  ## False when there is no Activity window to show it over.
  if druidStarted(): return callStatic(bool, "Keyboard", "show")
  simKeyboard(true)
  true
proc hide*(_: Keyboard): bool {.discardable.} =
  if druidStarted(): return callStatic(bool, "Keyboard", "hide")
  result = simulator().keyboardVisible
  simKeyboard(false)
proc isActive*(_: Keyboard): bool =
  bridged(simulator().keyboardVisible): callStatic(bool, "Keyboard", "isActive")
