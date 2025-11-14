import jnim

jclass android.view.Window* of JVMObject:
  proc getContext*(): Context
  proc getWindowStyle*(): TypedArray
  proc setContainer*(container: Window)
  proc getContainer*(): Window
  proc hasChildren*(): jboolean
  proc destroy*()
  proc isDestroyed*(): jboolean
  proc setWindowManager*(wm: WindowManager, appToken: IBinder, appName: string)
  proc setWindowManager*(wm: WindowManager, appToken: IBinder, appName: string, hardwareAccelerated: jboolean)
  proc getWindowManager*(): WindowManager
  proc setCallback*(callback: Callback)
  proc getCallback*(): Callback
  proc addOnFrameMetricsAvailableListener*(listener: OnFrameMetricsAvailableListener, handler: Handler)
  proc removeOnFrameMetricsAvailableListener*(listener: OnFrameMetricsAvailableListener)
  proc setOnWindowDismissedCallback*(dcb: OnWindowDismissedCallback)
  proc dispatchOnWindowDismissed*(finishTask: jboolean, suppressWindowTransition: jboolean)
  proc setOnWindowSwipeDismissedCallback*(sdcb: OnWindowSwipeDismissedCallback)
  proc dispatchOnWindowSwipeDismissed*()
  proc setWindowControllerCallback*(wccb: WindowControllerCallback)
  proc getWindowControllerCallback*(): WindowControllerCallback
  proc setDecorCallback*(decorCallback: DecorCallback)
  proc setSystemBarAppearance*(appearance: jint)
  proc getSystemBarAppearance*(): jint
  proc dispatchOnSystemBarAppearanceChanged*(appearance: jint)
  proc onDrawLegacyNavigationBarBackgroundChanged*(drawLegacyNavigationBarBackground: jboolean): jboolean
  proc setRestrictedCaptionAreaListener*(listener: OnRestrictedCaptionAreaChangedListener)
  proc setHideOverlayWindows*(hide: jboolean)
  proc takeSurface*(callback: SurfaceHolder.Callback2)
  proc takeInputQueue*(callback: InputQueue.Callback)
  proc isFloating*(): jboolean
  proc setLayout*(width: jint, height: jint)
  proc setGravity*(gravity: jint)
  proc setType*(type: jint)
  proc setFormat*(format: jint)
  proc setWindowAnimations*(resId: jint)
  proc setSoftInputMode*(mode: jint)
  proc addFlags*(flags: jint)
  proc addPrivateFlags*(flags: jint)
  proc addSystemFlags*(flags: jint)
  proc clearFlags*(flags: jint)
  proc setFlags*(flags: jint, mask: jint)
  proc setColorMode*(colorMode: jint)
  proc setDesiredHdrHeadroom*(desiredHeadroom: jfloat)
  proc getDesiredHdrHeadroom*(): jfloat
  proc setFrameRateBoostOnTouchEnabled*(enabled: jboolean)
  proc getFrameRateBoostOnTouchEnabled*(): jboolean
  proc setFrameRatePowerSavingsBalanced*(enabled: jboolean)
  proc isFrameRatePowerSavingsBalanced*(): jboolean
  proc setPreferMinimalPostProcessing*(isPreferred: jboolean)
  proc getColorMode*(): jint
  proc isWideColorGamut*(): jboolean
  proc setDimAmount*(amount: jfloat)
  proc setDecorFitsSystemWindows*(decorFitsSystemWindows: jboolean)
  proc decorFitsSystemWindows*(): jboolean
  proc setAttributes*(a: WindowManager.LayoutParams)
  proc getAttributes*(): WindowManager.LayoutParams
  proc setCloseOnTouchOutside*(close: jboolean)
  proc setCloseOnTouchOutsideIfNotSet*(close: jboolean)
  proc shouldCloseOnTouchOutside*(): jboolean
  proc alwaysReadCloseOnTouchAttr*()
  proc shouldCloseOnTouch*(context: Context, event: MotionEvent): jboolean
  proc setSustainedPerformanceMode*(enable: jboolean)
  proc requestFeature*(featureId: jint): jboolean
  proc makeActive*()
  proc isActive*(): jboolean
  proc findViewById*(id: jint): T
  proc requireViewById*(id: jint): T
  proc setContentView*(layoutResID: jint)
  proc setContentView*(view: View)
  proc setContentView*(view: View, params: ViewGroup.LayoutParams)
  proc addContentView*(view: View, params: ViewGroup.LayoutParams)
  proc clearContentView*()
  proc getCurrentFocus*(): View
  proc getLayoutInflater*(): LayoutInflater
  proc setTitle*(title: CharSequence)
  proc setTitleColor*(textColor: jint)
  proc openPanel*(featureId: jint, event: KeyEvent)
  proc closePanel*(featureId: jint)
  proc togglePanel*(featureId: jint, event: KeyEvent)
  proc invalidatePanelMenu*(featureId: jint)
  proc performPanelShortcut*(featureId: jint, keyCode: jint, event: KeyEvent, flags: jint): jboolean
  proc performPanelIdentifierAction*(featureId: jint, id: jint, flags: jint): jboolean
  proc closeAllPanels*()
  proc performContextMenuIdentifierAction*(id: jint, flags: jint): jboolean
  proc onConfigurationChanged*(newConfig: Configuration)
  proc setElevation*(elevation: jfloat)
  proc getElevation*(): jfloat
  proc setClipToOutline*(clipToOutline: jboolean)
  proc setBackgroundDrawableResource*(resId: jint)
  proc setBackgroundDrawable*(drawable: Drawable)
  proc setBackgroundBlurRadius*(blurRadius: jint)
  proc setFeatureDrawableResource*(featureId: jint, resId: jint)
  proc setFeatureDrawableUri*(featureId: jint, uri: Uri)
  proc setFeatureDrawable*(featureId: jint, drawable: Drawable)
  proc setFeatureDrawableAlpha*(featureId: jint, alpha: jint)
  proc setFeatureInt*(featureId: jint, value: jint)
  proc takeKeyEvents*(get: jboolean)
  proc superDispatchKeyEvent*(event: KeyEvent): jboolean
  proc superDispatchKeyShortcutEvent*(event: KeyEvent): jboolean
  proc superDispatchTouchEvent*(event: MotionEvent): jboolean
  proc superDispatchTrackballEvent*(event: MotionEvent): jboolean
  proc superDispatchGenericMotionEvent*(event: MotionEvent): jboolean
  proc getDecorView*(): View
  proc getStatusBarBackgroundView*(): View
  proc getNavigationBarBackgroundView*(): View
  proc peekDecorView*(): View
  proc saveHierarchyState*(): Bundle
  proc restoreHierarchyState*(savedInstanceState: Bundle)
  proc getDefaultFeatures*(context: Context): jint {.`static`.}
  proc hasFeature*(feature: jint): jboolean
  proc setChildDrawable*(featureId: jint, drawable: Drawable)
  proc setChildInt*(featureId: jint, value: jint)
  proc isShortcutKey*(keyCode: jint, event: KeyEvent): jboolean
  proc setVolumeControlStream*(streamType: jint)
  proc getVolumeControlStream*(): jint
  proc setMediaController*(controller: MediaController)
  proc getMediaController*(): MediaController
  proc setUiOptions*(uiOptions: jint)
  proc setUiOptions*(uiOptions: jint, mask: jint)
  proc setIcon*(resId: jint)
  proc setDefaultIcon*(resId: jint)
  proc setLogo*(resId: jint)
  proc setDefaultLogo*(resId: jint)
  proc setLocalFocus*(hasFocus: jboolean, inTouchMode: jboolean)
  proc injectInputEvent*(event: InputEvent)
  proc getTransitionManager*(): TransitionManager
  proc setTransitionManager*(tm: TransitionManager)
  proc getContentScene*(): Scene
  proc setEnterTransition*(transition: Transition)
  proc setReturnTransition*(transition: Transition)
  proc setExitTransition*(transition: Transition)
  proc setReenterTransition*(transition: Transition)
  proc getEnterTransition*(): Transition
  proc getReturnTransition*(): Transition
  proc getExitTransition*(): Transition
  proc getReenterTransition*(): Transition
  proc setSharedElementEnterTransition*(transition: Transition)
  proc setSharedElementReturnTransition*(transition: Transition)
  proc getSharedElementEnterTransition*(): Transition
  proc getSharedElementReturnTransition*(): Transition
  proc setSharedElementExitTransition*(transition: Transition)
  proc setSharedElementReenterTransition*(transition: Transition)
  proc getSharedElementExitTransition*(): Transition
  proc getSharedElementReenterTransition*(): Transition
  proc setAllowEnterTransitionOverlap*(allow: jboolean)
  proc getAllowEnterTransitionOverlap*(): jboolean
  proc setAllowReturnTransitionOverlap*(allow: jboolean)
  proc getAllowReturnTransitionOverlap*(): jboolean
  proc getTransitionBackgroundFadeDuration*(): jlong
  proc setTransitionBackgroundFadeDuration*(fadeDurationMillis: jlong)
  proc getSharedElementsUseOverlay*(): jboolean
  proc setSharedElementsUseOverlay*(sharedElementsUseOverlay: jboolean)
  proc getStatusBarColor*(): jint
  proc setStatusBarColor*(color: jint)
  proc getNavigationBarColor*(): jint
  proc setNavigationBarColor*(color: jint)
  proc setNavigationBarDividerColor*(dividerColor: jint)
  proc getNavigationBarDividerColor*(): jint
  proc setStatusBarContrastEnforced*(ensureContrast: jboolean)
  proc isStatusBarContrastEnforced*(): jboolean
  proc setNavigationBarContrastEnforced*(enforceContrast: jboolean)
  proc isNavigationBarContrastEnforced*(): jboolean
  proc setSystemGestureExclusionRects*(rects: List[Rect])
  proc getSystemGestureExclusionRects*(): List[Rect]
  proc requestScrollCapture*(listener: IScrollCaptureResponseListener)
  proc registerScrollCaptureCallback*(callback: ScrollCaptureCallback)
  proc unregisterScrollCaptureCallback*(callback: ScrollCaptureCallback)
  proc setTheme*(resId: jint)
  proc setOverlayWithDecorCaptionEnabled*(enabled: jboolean)
  proc isOverlayWithDecorCaptionEnabled*(): jboolean
  proc notifyRestrictedCaptionAreaCallback*(left: jint, top: jint, right: jint, bottom: jint)
  proc setDecorCaptionShade*(decorCaptionShade: jint)
  proc setResizingCaptionDrawable*(drawable: Drawable)
  proc onMultiWindowModeChanged*()
  proc onPictureInPictureModeChanged*(isInPictureInPictureMode: jboolean)
  proc getInsetsController*(): WindowInsetsController
  proc getRootSurfaceControl*(): AttachedSurfaceControl
  proc getOnBackInvokedDispatcher*(): OnBackInvokedDispatcher
  FEATURE_OPTIONS_PANEL*: jint {.`static`.}
  FEATURE_NO_TITLE*: jint {.`static`.}
  FEATURE_PROGRESS*: jint {.`static`.}
  FEATURE_LEFT_ICON*: jint {.`static`.}
  FEATURE_RIGHT_ICON*: jint {.`static`.}
  FEATURE_INDETERMINATE_PROGRESS*: jint {.`static`.}
  FEATURE_CONTEXT_MENU*: jint {.`static`.}
  FEATURE_CUSTOM_TITLE*: jint {.`static`.}
  FEATURE_ACTION_BAR*: jint {.`static`.}
  FEATURE_ACTION_BAR_OVERLAY*: jint {.`static`.}
  FEATURE_ACTION_MODE_OVERLAY*: jint {.`static`.}
  FEATURE_SWIPE_TO_DISMISS*: jint {.`static`.}
  FEATURE_CONTENT_TRANSITIONS*: jint {.`static`.}
  FEATURE_ACTIVITY_TRANSITIONS*: jint {.`static`.}
  FEATURE_MAX*: jint {.`static`.}
  PROGRESS_VISIBILITY_ON*: jint {.`static`.}
  PROGRESS_VISIBILITY_OFF*: jint {.`static`.}
  PROGRESS_INDETERMINATE_ON*: jint {.`static`.}
  PROGRESS_INDETERMINATE_OFF*: jint {.`static`.}
  PROGRESS_START*: jint {.`static`.}
  PROGRESS_END*: jint {.`static`.}
  PROGRESS_SECONDARY_START*: jint {.`static`.}
  PROGRESS_SECONDARY_END*: jint {.`static`.}
  STATUS_BAR_BACKGROUND_TRANSITION_NAME*: string {.`static`.}
  NAVIGATION_BAR_BACKGROUND_TRANSITION_NAME*: string {.`static`.}
  ID_ANDROID_CONTENT*: jint {.`static`.}
  DECOR_CAPTION_SHADE_AUTO*: jint {.`static`.}
  DECOR_CAPTION_SHADE_LIGHT*: jint {.`static`.}
  DECOR_CAPTION_SHADE_DARK*: jint {.`static`.}

jclass android.view.Window.Callback* of JVMObject:
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc dispatchKeyShortcutEvent*(event: KeyEvent): jboolean
  proc dispatchTouchEvent*(event: MotionEvent): jboolean
  proc dispatchTrackballEvent*(event: MotionEvent): jboolean
  proc dispatchGenericMotionEvent*(event: MotionEvent): jboolean
  proc dispatchPopulateAccessibilityEvent*(event: AccessibilityEvent): jboolean
  proc onCreatePanelView*(featureId: jint): View
  proc onWindowAttributesChanged*(attrs: WindowManager.LayoutParams)
  proc onContentChanged*()
  proc onWindowFocusChanged*(hasFocus: jboolean)
  proc onAttachedToWindow*()
  proc onDetachedFromWindow*()
  proc onSearchRequested*(): jboolean
  proc onSearchRequested*(searchEvent: SearchEvent): jboolean
  proc onWindowStartingActionMode*(callback: ActionMode.Callback): ActionMode
  proc onWindowStartingActionMode*(callback: ActionMode.Callback, type: jint): ActionMode
  proc onActionModeStarted*(mode: ActionMode)
  proc onActionModeFinished*(mode: ActionMode)
  proc onProvideKeyboardShortcuts*(data: List[KeyboardShortcutGroup], menu: Menu, deviceId: jint)
  proc onPointerCaptureChanged*(hasCapture: jboolean)

jclass android.view.Callback* of JVMObject:
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc dispatchKeyShortcutEvent*(event: KeyEvent): jboolean
  proc dispatchTouchEvent*(event: MotionEvent): jboolean
  proc dispatchTrackballEvent*(event: MotionEvent): jboolean
  proc dispatchGenericMotionEvent*(event: MotionEvent): jboolean
  proc dispatchPopulateAccessibilityEvent*(event: AccessibilityEvent): jboolean
  proc onCreatePanelView*(featureId: jint): View
  proc onWindowAttributesChanged*(attrs: WindowManager.LayoutParams)
  proc onContentChanged*()
  proc onWindowFocusChanged*(hasFocus: jboolean)
  proc onAttachedToWindow*()
  proc onDetachedFromWindow*()
  proc onSearchRequested*(): jboolean
  proc onSearchRequested*(searchEvent: SearchEvent): jboolean
  proc onWindowStartingActionMode*(callback: ActionMode.Callback): ActionMode
  proc onWindowStartingActionMode*(callback: ActionMode.Callback, type: jint): ActionMode
  proc onActionModeStarted*(mode: ActionMode)
  proc onActionModeFinished*(mode: ActionMode)
  proc onProvideKeyboardShortcuts*(data: List[KeyboardShortcutGroup], menu: Menu, deviceId: jint)
  proc onPointerCaptureChanged*(hasCapture: jboolean)





