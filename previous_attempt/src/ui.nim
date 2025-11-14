# ui.nim - Basic UI utilities

import android, options

type
  Gravity* = enum
    Top, Bottom, Left, Right, Center,
    TopLeft, TopRight, BottomLeft, BottomRight
    
  DurationMs* = distinct int
    
  ToastLength* = enum
    Short, Long
    
  VibrationType* = enum
    Click, DoubleClick, Tick, HeavyClick, TextHandleMove
    
  DialogButton* = enum
    Positive, Negative, Neutral
    
  DialogButtonListener* = proc(button: DialogButton)
  
  ItemSelectedListener* = proc(position: int, text: string)
  
  UiManager* = ref object of Manager
    toastQueue: seq[string]
    vibrator: pointer    # JNI reference
    alertDialogBuilder: pointer  # JNI reference

# Constants
const
  Toast_DurationShort* = 2000
  Toast_DurationLong* = 3500

# Constructor
proc newUiManager*(context: Context): UiManager
  ## Creates a new UI manager

# Toast notifications
proc showToast*(m: UiManager, 
              message: string, 
              length: ToastLength = Short,
              gravity: Option[Gravity] = none(Gravity)): bool
  ## Shows toast notification
  ## API 26+: Uses Toast.makeText with modern handling
  ## API 30+: Toast customization restricted
  
proc cancelToasts*(m: UiManager)
  ## Cancels all active toasts

# Haptic feedback
proc vibrate*(m: UiManager, durationMs: int): bool
  ## Triggers vibration
  ## API 26+: Uses VibrationEffect
  ## Requires VIBRATE permission
  
proc vibratePattern*(m: UiManager, pattern: seq[int64], repeat: bool = false): bool
  ## Triggers vibration pattern
  ## API 26+: Uses VibrationEffect.createWaveform
  ## Requires VIBRATE permission
  
proc performHapticFeedback*(m: UiManager, type: VibrationType): bool
  ## Performs system haptic feedback
  ## API 26+: Uses VibrationEffect constants
  ## API 29+: Has additional effect types

# Dialog handling
proc showAlert*(m: UiManager,
              title: string,
              message: string,
              positiveButton: Option[string] = none(string),
              negativeButton: Option[string] = none(string),
              neutralButton: Option[string] = none(string),
              listener: Option[DialogButtonListener] = none(DialogButtonListener),
              cancelable: bool = true): bool
  ## Shows alert dialog
  ## API 26+: Uses AlertDialog.Builder
  
proc showListDialog*(m: UiManager,
                   title: string,
                   items: seq[string],
                   listener: ItemSelectedListener,
                   cancelable: bool = true): bool
  ## Shows list selection dialog
  ## API 26+: Uses AlertDialog.Builder with list items
  
proc showProgressDialog*(m: UiManager,
                       title: string,
                       message: string,
                       indeterminate: bool = true,
                       max: int = 100,
                       cancelable: bool = true): int
  ## Shows progress dialog
  ## Returns dialog ID
  ## API 26+: Uses ProgressDialog
  ## API 27+: ProgressDialog is deprecated but still functional
  
proc updateProgressDialog*(m: UiManager, dialogId: int, progress: int): bool
  ## Updates progress dialog
  
proc dismissDialog*(m: UiManager, dialogId: int): bool
  ## Dismisses dialog