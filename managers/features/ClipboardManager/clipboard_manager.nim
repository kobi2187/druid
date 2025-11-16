## SDK Clipboard Manager - Copy and paste text/data
##
## Uses Android SDK ClipboardManager API (Java)
##
## Provides:
## - Copy text to clipboard
## - Paste text from clipboard
## - Check if clipboard has text
## - Clipboard change listeners (API 11+)

import ../../../core
import jnim
import options

# jnimport:
#   import android.content.Context
#   import android.content.ClipboardManager as JCM
#   import android.content.ClipData
#   import android.content.ClipDescription
# 
type
  SdkClipboardManager* = ref object
    context: jobject
    clipboardManager: jobject

proc init*(_: typedesc[SdkClipboardManager]): SdkClipboardManager =
  ## Initialize SdkClipboardManager
  result = SdkClipboardManager()
  result.context = getContext()

  # Get ClipboardManager system service
  let serviceName = "clipboard".toJString
  result.clipboardManager = result.context.getSystemService(serviceName)

proc setText*(cm: SdkClipboardManager, text: string, label: string = "text") =
  ## Copy text to clipboard
  ##
  ## Args:
  ##   text: The text to copy
  ##   label: Optional label for the clip (user-visible in some cases)
  ##
  ## Example:
  ##   clipboard().setText("Hello, World!")

  # Create ClipData
  let clipData = newJVMObject("android/content/ClipData")
  let clip = clipData.callStatic("newPlainText",
    label.toJString,
    text.toJString
  )

  # Set as primary clip
  cm.clipboardManager.call("setPrimaryClip", clip)

proc getText*(cm: SdkClipboardManager): Option[string] =
  ## Get text from clipboard
  ##
  ## Returns:
  ##   Some(text) if clipboard has text, None otherwise
  ##
  ## Example:
  ##   let text = clipboard().getText()
  ##   if text.isSome:
  ##     echo "Clipboard: ", text.get()

  # Check if has primary clip
  let hasPrimary = cm.clipboardManager.call("hasPrimaryClip").boolVal
  if not hasPrimary:
    return none(string)

  # Get primary clip
  let clip = cm.clipboardManager.call("getPrimaryClip")
  if clip.isNil:
    return none(string)

  # Get item count
  let itemCount = clip.call("getItemCount").intVal
  if itemCount == 0:
    return none(string)

  # Get first item
  let item = clip.call("getItemAt", 0.jint)
  if item.isNil:
    return none(string)

  # Get text from item
  let textSeq = item.call("getText")
  if textSeq.isNil:
    return none(string)

  let text = textSeq.toStringRaw()
  return some(text)

proc hasText*(cm: SdkClipboardManager): bool =
  ## Check if clipboard contains text
  ##
  ## Returns:
  ##   true if clipboard has text, false otherwise
  ##
  ## Example:
  ##   if clipboard().hasText():
  ##     echo "Clipboard has content"

  let hasPrimary = cm.clipboardManager.call("hasPrimaryClip").boolVal
  if not hasPrimary:
    return false

  # Get primary clip description
  let desc = cm.clipboardManager.call("getPrimaryClipDescription")
  if desc.isNil:
    return false

  # Check if it has text MIME type
  let mimeTypeText = "text/plain".toJString
  let hasTextType = desc.call("hasMimeType", mimeTypeText).boolVal

  return hasTextType

proc clear*(cm: SdkClipboardManager) =
  ## Clear clipboard contents
  ##
  ## On API 28+, this actually clears the clipboard
  ## On older APIs, sets empty text
  ##
  ## Example:
  ##   clipboard().clear()

  # API 28+ has clearPrimaryClip()
  # For older APIs, just set empty text
  try:
    cm.clipboardManager.call("clearPrimaryClip")
  except:
    # Fallback: set empty clip
    cm.setText("")

# TODO: Add clipboard change listener support
# This requires callback infrastructure which we haven't built yet
# proc onClipboardChanged*(cm: SdkClipboardManager, callback: proc()) =
#   ## Register a callback for clipboard changes
#   let listener = createClipboardChangedListener(callback)
#   cm.clipboardManager.call("addPrimaryClipChangedListener", listener)

# Lazy accessor for AndroidRuntime
proc sdkClipboardManager*(runtime: AndroidRuntime): SdkClipboardManager =
  ## Get or create SdkClipboardManager instance
  if runtime.sdkClipboardManager.isNone:
    runtime.sdkClipboardManager = some(SdkClipboardManager.init())
  return runtime.sdkClipboardManager.get()

# Convenience global accessor
proc clipboard*(): SdkClipboardManager =
  ## Global accessor for SdkClipboardManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   clipboard().setText("Copied!")
  ##   let text = clipboard().getText()
  return runtime().sdkClipboardManager()
