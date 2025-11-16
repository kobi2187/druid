## SDK Input Method Manager - Keyboard and input control
##
## Uses Android SDK InputMethodManager API (Java)
##
## Provides:
## - Show/hide soft keyboard
## - Check keyboard visibility
## - Input method selection
##
## Useful for:
## - Showing keyboard when EditText gains focus
## - Hiding keyboard programmatically
## - Managing keyboard state in dialogs/fragments

import ../../../core
import ../../../art  # For API level detection
import jnim
import options

# jnimport:
#   import android.content.Context
#   import android.view.View
#   import android.view.inputmethod.InputMethodManager as JIMM
# 
type
  SdkInputMethodManager* = ref object
    context: jobject
    inputMethodManager: jobject
    apiLevel: int

proc init*(_: typedesc[SdkInputMethodManager]): SdkInputMethodManager =
  ## Initialize SdkInputMethodManager
  result = SdkInputMethodManager()
  result.context = getContext()
  result.apiLevel = detectApiLevel()

  # Get InputMethodManager system service
  let serviceName = "input_method".toJString
  result.inputMethodManager = result.context.getSystemService(serviceName)

proc showSoftKeyboard*(imm: SdkInputMethodManager, view: jobject, flags: int = 1) =
  ## Show soft keyboard for a view
  ##
  ## Args:
  ##   view: View to show keyboard for (typically an EditText)
  ##   flags: Show flags (1 = SHOW_IMPLICIT, 2 = SHOW_FORCED)
  ##
  ## Example:
  ##   # Assuming you have editText view from Activity
  ##   inputMethod().showSoftKeyboard(editText)
  ##
  ## Note: Requires Activity context and View reference.
  ## This is primarily for use when you have access to Android Views.

  imm.inputMethodManager.call("showSoftInput", view, flags.jint)

proc hideSoftKeyboard*(imm: SdkInputMethodManager, view: jobject, flags: int = 0) =
  ## Hide soft keyboard from a view
  ##
  ## Args:
  ##   view: View to hide keyboard from
  ##   flags: Hide flags (0 = default)
  ##
  ## Example:
  ##   # Hide keyboard when user presses "Done"
  ##   inputMethod().hideSoftKeyboard(editText)

  let windowToken = view.call("getWindowToken")
  imm.inputMethodManager.call("hideSoftInputFromWindow",
    windowToken,
    flags.jint)

proc toggleSoftKeyboard*(imm: SdkInputMethodManager, showFlags: int = 1, hideFlags: int = 0) =
  ## Toggle soft keyboard visibility
  ##
  ## Args:
  ##   showFlags: Flags to use if showing keyboard
  ##   hideFlags: Flags to use if hiding keyboard
  ##
  ## Example:
  ##   # Toggle keyboard when button is pressed
  ##   inputMethod().toggleSoftKeyboard()

  imm.inputMethodManager.call("toggleSoftInput",
    showFlags.jint,
    hideFlags.jint)

proc isActive*(imm: SdkInputMethodManager): bool =
  ## Check if input method is active
  ##
  ## Returns:
  ##   true if any input method is active
  ##
  ## Example:
  ##   if inputMethod().isActive():
  ##     echo "Keyboard is active"

  return imm.inputMethodManager.call("isActive").boolVal

proc isAcceptingText*(imm: SdkInputMethodManager): bool =
  ## Check if input method is currently accepting text
  ##
  ## Returns:
  ##   true if keyboard is shown and accepting text
  ##
  ## Example:
  ##   if inputMethod().isAcceptingText():
  ##     echo "Keyboard is visible and accepting input"

  return imm.inputMethodManager.call("isAcceptingText").boolVal

# Lazy accessor for AndroidRuntime
proc sdkInputMethodManager*(runtime: AndroidRuntime): SdkInputMethodManager =
  ## Get or create SdkInputMethodManager instance
  if runtime.sdkInputMethodManager.isNone:
    runtime.sdkInputMethodManager = some(SdkInputMethodManager.init())
  return runtime.sdkInputMethodManager.get()

# Convenience global accessor
proc inputMethod*(): SdkInputMethodManager =
  ## Global accessor for SdkInputMethodManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   # Show keyboard (requires View reference from Activity)
  ##   inputMethod().showSoftKeyboard(editTextView)
  ##
  ##   # Hide keyboard
  ##   inputMethod().hideSoftKeyboard(editTextView)
  ##
  ##   # Toggle keyboard
  ##   inputMethod().toggleSoftKeyboard()
  ##
  ##   # Check state
  ##   if inputMethod().isAcceptingText():
  ##     echo "Keyboard is visible"
  ##
  ## Note: Most methods require View references which come from
  ## your GUI framework. Druid provides service access, your GUI
  ## framework provides the Views.
  return runtime().sdkInputMethodManager()
