import jnim

jclass android.app.Dialog* of JVMObject:
  proc getContext*(): Context
  proc getActionBar*(): ActionBar
  proc setOwnerActivity*(activity: Activity)
  proc getOwnerActivity*(): Activity
  proc isShowing*(): jboolean
  proc create*()
  proc show*()
  proc hide*()
  proc dismiss*()
  proc onSaveInstanceState*(): Bundle
  proc onRestoreInstanceState*(savedInstanceState: Bundle)
  proc getWindow*(): Window
  proc getCurrentFocus*(): View
  proc findViewById*(id: jint): T
  proc requireViewById*(id: jint): T
  proc setContentView*(layoutResID: jint)
  proc setContentView*(view: View)
  proc setContentView*(view: View, params: ViewGroup.LayoutParams)
  proc addContentView*(view: View, params: ViewGroup.LayoutParams)
  proc setTitle*(title: CharSequence)
  proc setTitle*(titleId: jint)
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyLongPress*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyMultiple*(keyCode: jint, repeatCount: jint, event: KeyEvent): jboolean
  proc onBackPressed*()
  proc onKeyShortcut*(keyCode: jint, event: KeyEvent): jboolean
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc onTrackballEvent*(event: MotionEvent): jboolean
  proc onGenericMotionEvent*(event: MotionEvent): jboolean
  proc onWindowAttributesChanged*(params: WindowManager.LayoutParams)
  proc onContentChanged*()
  proc onWindowFocusChanged*(hasFocus: jboolean)
  proc onAttachedToWindow*()
  proc onDetachedFromWindow*()
  proc onWindowDismissed*(finishTask: jboolean, suppressWindowTransition: jboolean)
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc dispatchKeyShortcutEvent*(event: KeyEvent): jboolean
  proc dispatchTouchEvent*(ev: MotionEvent): jboolean
  proc dispatchTrackballEvent*(ev: MotionEvent): jboolean
  proc dispatchGenericMotionEvent*(ev: MotionEvent): jboolean
  proc dispatchPopulateAccessibilityEvent*(event: AccessibilityEvent): jboolean
  proc onCreatePanelView*(featureId: jint): View
  proc onCreatePanelMenu*(featureId: jint, menu: Menu): jboolean
  proc onPreparePanel*(featureId: jint, view: View, menu: Menu): jboolean
  proc onMenuOpened*(featureId: jint, menu: Menu): jboolean
  proc onMenuItemSelected*(featureId: jint, item: MenuItem): jboolean
  proc onPanelClosed*(featureId: jint, menu: Menu)
  proc onCreateOptionsMenu*(menu: Menu): jboolean
  proc onPrepareOptionsMenu*(menu: Menu): jboolean
  proc onOptionsItemSelected*(item: MenuItem): jboolean
  proc onOptionsMenuClosed*(menu: Menu)
  proc openOptionsMenu*()
  proc closeOptionsMenu*()
  proc invalidateOptionsMenu*()
  proc onCreateContextMenu*(menu: ContextMenu, v: View, menuInfo: ContextMenuInfo)
  proc registerForContextMenu*(view: View)
  proc unregisterForContextMenu*(view: View)
  proc openContextMenu*(view: View)
  proc onContextItemSelected*(item: MenuItem): jboolean
  proc onContextMenuClosed*(menu: Menu)
  proc onSearchRequested*(searchEvent: SearchEvent): jboolean
  proc onSearchRequested*(): jboolean
  proc getSearchEvent*(): SearchEvent
  proc onWindowStartingActionMode*(callback: ActionMode.Callback): ActionMode
  proc onWindowStartingActionMode*(callback: ActionMode.Callback, type: jint): ActionMode
  proc onActionModeStarted*(mode: ActionMode)
  proc onActionModeFinished*(mode: ActionMode)
  proc takeKeyEvents*(get: jboolean)
  proc requestWindowFeature*(featureId: jint): jboolean
  proc setFeatureDrawableResource*(featureId: jint, resId: jint)
  proc setFeatureDrawableUri*(featureId: jint, uri: Uri)
  proc setFeatureDrawable*(featureId: jint, drawable: Drawable)
  proc setFeatureDrawableAlpha*(featureId: jint, alpha: jint)
  proc getLayoutInflater*(): LayoutInflater
  proc setCancelable*(flag: jboolean)
  proc setCanceledOnTouchOutside*(cancel: jboolean)
  proc cancel*()
  proc setOnCancelListener*(listener: OnCancelListener)
  proc setCancelMessage*(msg: Message)
  proc setOnDismissListener*(listener: OnDismissListener)
  proc setOnShowListener*(listener: OnShowListener)
  proc setDismissMessage*(msg: Message)
  proc setDismissOverride*(override: Runnable)
  proc takeCancelAndDismissListeners*(msg: string, cancel: OnCancelListener, dismiss: OnDismissListener): jboolean
  proc setVolumeControlStream*(streamType: jint)
  proc getVolumeControlStream*(): jint
  proc setOnKeyListener*(onKeyListener: OnKeyListener)
  proc getOnBackInvokedDispatcher*(): OnBackInvokedDispatcher

