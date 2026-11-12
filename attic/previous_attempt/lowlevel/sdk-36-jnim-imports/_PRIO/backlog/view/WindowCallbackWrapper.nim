import jnim

jclass android.view.WindowCallbackWrapper* of JVMObject:
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc dispatchKeyShortcutEvent*(event: KeyEvent): jboolean
  proc dispatchTouchEvent*(event: MotionEvent): jboolean
  proc dispatchTrackballEvent*(event: MotionEvent): jboolean
  proc dispatchGenericMotionEvent*(event: MotionEvent): jboolean
  proc dispatchPopulateAccessibilityEvent*(event: AccessibilityEvent): jboolean
  proc onCreatePanelView*(featureId: jint): View
  proc onCreatePanelMenu*(featureId: jint, menu: Menu): jboolean
  proc onPreparePanel*(featureId: jint, view: View, menu: Menu): jboolean
  proc onMenuOpened*(featureId: jint, menu: Menu): jboolean
  proc onMenuItemSelected*(featureId: jint, item: MenuItem): jboolean
  proc onWindowAttributesChanged*(attrs: WindowManager.LayoutParams)
  proc onContentChanged*()
  proc onWindowFocusChanged*(hasFocus: jboolean)
  proc onAttachedToWindow*()
  proc onDetachedFromWindow*()
  proc onPanelClosed*(featureId: jint, menu: Menu)
  proc onSearchRequested*(searchEvent: SearchEvent): jboolean
  proc onSearchRequested*(): jboolean
  proc onWindowStartingActionMode*(callback: ActionMode.Callback): ActionMode
  proc onWindowStartingActionMode*(callback: ActionMode.Callback, type: jint): ActionMode
  proc onActionModeStarted*(mode: ActionMode)
  proc onActionModeFinished*(mode: ActionMode)
  proc onProvideKeyboardShortcuts*(data: List[KeyboardShortcutGroup], menu: Menu, deviceId: jint)
  proc onPointerCaptureChanged*(hasCapture: jboolean)

