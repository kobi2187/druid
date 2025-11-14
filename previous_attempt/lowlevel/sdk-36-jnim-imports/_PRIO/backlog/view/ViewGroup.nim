import jnim

jclass android.view.ViewGroup* of View:
  proc getDescendantFocusability*(): jint
  proc setDescendantFocusability*(focusability: jint)
  proc requestChildFocus*(child: View, focused: View)
  proc focusableViewAvailable*(v: View)
  proc showContextMenuForChild*(originalView: View): jboolean
  proc isShowingContextMenuWithCoords*(): jboolean
  proc showContextMenuForChild*(originalView: View, x: jfloat, y: jfloat): jboolean
  proc startActionModeForChild*(originalView: View, callback: ActionMode.Callback): ActionMode
  proc startActionModeForChild*(originalView: View, callback: ActionMode.Callback, type: jint): ActionMode
  proc dispatchActivityResult*(who: string, requestCode: jint, resultCode: jint, data: Intent): jboolean
  proc focusSearch*(focused: View, direction: jint): View
  proc requestChildRectangleOnScreen*(child: View, rectangle: Rect, immediate: jboolean): jboolean
  proc requestSendAccessibilityEvent*(child: View, event: AccessibilityEvent): jboolean
  proc onRequestSendAccessibilityEvent*(child: View, event: AccessibilityEvent): jboolean
  proc onRequestSendAccessibilityEventInternal*(child: View, event: AccessibilityEvent): jboolean
  proc childHasTransientStateChanged*(child: View, childHasTransientState: jboolean)
  proc hasTransientState*(): jboolean
  proc dispatchUnhandledMove*(focused: View, direction: jint): jboolean
  proc clearChildFocus*(child: View)
  proc clearFocus*()
  proc getFocusedChild*(): View
  proc hasFocus*(): jboolean
  proc findFocus*(): View
  proc addFocusables*(views: ArrayList[View], direction: jint, focusableMode: jint)
  proc addKeyboardNavigationClusters*(views: Collection[View], direction: jint)
  proc setTouchscreenBlocksFocus*(touchscreenBlocksFocus: jboolean)
  proc getTouchscreenBlocksFocus*(): jboolean
  proc findViewsWithText*(outViews: ArrayList[View], text: CharSequence, flags: jint)
  proc findViewByAccessibilityIdTraversal*(accessibilityId: jint): View
  proc findViewByAutofillIdTraversal*(autofillId: jint): View
  proc findAutofillableViewsByTraversal*(autofillableViews: List[View])
  proc dispatchWindowFocusChanged*(hasFocus: jboolean)
  proc addTouchables*(views: ArrayList[View])
  proc makeOptionalFitsSystemWindows*()
  proc makeFrameworkOptionalFitsSystemWindows*()
  proc dispatchDisplayHint*(hint: jint)
  proc dispatchWindowVisibilityChanged*(visibility: jint)
  proc dispatchConfigurationChanged*(newConfig: Configuration)
  proc recomputeViewAttributes*(child: View)
  proc bringChildToFront*(child: View)
  proc dispatchDragEvent*(event: DragEvent): jboolean
  proc dispatchWindowSystemUiVisiblityChanged*(visible: jint)
  proc dispatchSystemUiVisibilityChanged*(visible: jint)
  proc dispatchKeyEventPreIme*(event: KeyEvent): jboolean
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc dispatchKeyShortcutEvent*(event: KeyEvent): jboolean
  proc dispatchTrackballEvent*(event: MotionEvent): jboolean
  proc dispatchCapturedPointerEvent*(event: MotionEvent): jboolean
  proc dispatchPointerCaptureChanged*(hasCapture: jboolean)
  proc onResolvePointerIcon*(event: MotionEvent, pointerIndex: jint): PointerIcon
  proc addChildrenForAccessibility*(outChildren: ArrayList[View])
  proc onInterceptHoverEvent*(event: MotionEvent): jboolean
  proc dispatchTouchEvent*(ev: MotionEvent): jboolean
  proc buildTouchDispatchChildList*(): ArrayList[View]
  proc transformPointToViewLocal*(point: seq[jfloat], child: View)
  proc setMotionEventSplittingEnabled*(split: jboolean)
  proc isMotionEventSplittingEnabled*(): jboolean
  proc isTransitionGroup*(): jboolean
  proc setTransitionGroup*(isTransitionGroup: jboolean)
  proc requestDisallowInterceptTouchEvent*(disallowIntercept: jboolean)
  proc onInterceptTouchEvent*(ev: MotionEvent): jboolean
  proc requestFocus*(direction: jint, previouslyFocusedRect: Rect): jboolean
  proc restoreDefaultFocus*(): jboolean
  proc restoreFocusInCluster*(direction: jint): jboolean
  proc restoreFocusNotInCluster*(): jboolean
  proc dispatchStartTemporaryDetach*()
  proc dispatchFinishTemporaryDetach*()
  proc dispatchPopulateAccessibilityEventInternal*(event: AccessibilityEvent): jboolean
  proc dispatchProvideStructure*(structure: ViewStructure)
  proc dispatchProvideAutofillStructure*(structure: ViewStructure, flags: jint)
  proc dispatchProvideContentCaptureStructure*()
  proc resetSubtreeAutofillIds*()
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc addExtraDataToAccessibilityNodeInfo*(info: AccessibilityNodeInfo, extraDataKey: string, arguments: Bundle)
  proc getAccessibilityClassName*(): CharSequence
  proc notifySubtreeAccessibilityStateChanged*(child: View, source: View, changeType: jint)
  proc notifySubtreeAccessibilityStateChangedIfNeeded*()
  proc onNestedPrePerformAccessibilityAction*(target: View, action: jint, args: Bundle): jboolean
  proc createSnapshot*(canvasProvider: ViewDebug.CanvasProvider, skipChildren: jboolean): Bitmap
  proc getOverlay*(): ViewGroupOverlay
  proc getChildDrawingOrder*(drawingPosition: jint): jint
  proc getClipChildren*(): jboolean
  proc setClipChildren*(clipChildren: jboolean)
  proc setClipToPadding*(clipToPadding: jboolean)
  proc getClipToPadding*(): jboolean
  proc dispatchSetSelected*(selected: jboolean)
  proc dispatchSetActivated*(activated: jboolean)
  proc dispatchDrawableHotspotChanged*(x: jfloat, y: jfloat)
  proc addTransientView*(view: View, index: jint)
  proc removeTransientView*(view: View)
  proc getTransientViewCount*(): jint
  proc getTransientViewIndex*(position: jint): jint
  proc getTransientView*(position: jint): View
  proc addView*(child: View)
  proc addView*(child: View, index: jint)
  proc addView*(child: View, width: jint, height: jint)
  proc addView*(child: View, params: LayoutParams)
  proc addView*(child: View, index: jint, params: LayoutParams)
  proc updateViewLayout*(view: View, params: ViewGroup.LayoutParams)
  proc setOnHierarchyChangeListener*(listener: OnHierarchyChangeListener)
  proc onViewAdded*(child: View)
  proc onViewRemoved*(child: View)
  proc removeView*(view: View)
  proc removeViewInLayout*(view: View)
  proc removeViewsInLayout*(start: jint, count: jint)
  proc removeViewAt*(index: jint)
  proc removeViews*(start: jint, count: jint)
  proc setLayoutTransition*(transition: LayoutTransition)
  proc getLayoutTransition*(): LayoutTransition
  proc removeAllViews*()
  proc removeAllViewsInLayout*()
  proc onDescendantInvalidated*(child: View, target: View)
  proc invalidateChild*(child: View, dirty: Rect)
  proc invalidateChildInParent*(location: seq[jint], dirty: Rect): ViewParent
  proc offsetDescendantRectToMyCoords*(descendant: View, rect: Rect)
  proc offsetRectIntoDescendantCoords*(descendant: View, rect: Rect)
  proc offsetChildrenTopAndBottom*(offset: jint)
  proc getChildVisibleRect*(child: View, r: Rect, offset: android.graphics.Point): jboolean
  proc getChildVisibleRect*(child: View, r: Rect, offset: android.graphics.Point, forceParentCheck: jboolean): jboolean
  proc layout*(l: jint, t: jint, r: jint, b: jint)
  proc startLayoutAnimation*()
  proc scheduleLayoutAnimation*()
  proc setLayoutAnimation*(controller: LayoutAnimationController)
  proc getLayoutAnimation*(): LayoutAnimationController
  proc isAnimationCacheEnabled*(): jboolean
  proc setAnimationCacheEnabled*(enabled: jboolean)
  proc isAlwaysDrawnWithCacheEnabled*(): jboolean
  proc setAlwaysDrawnWithCacheEnabled*(always: jboolean)
  proc getPersistentDrawingCache*(): jint
  proc setPersistentDrawingCache*(drawingCacheToKeep: jint)
  proc getLayoutMode*(): jint
  proc setLayoutMode*(layoutMode: jint)
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc indexOfChild*(child: View): jint
  proc getChildCount*(): jint
  proc getChildAt*(index: jint): View
  proc getChildMeasureSpec*(spec: jint, padding: jint, childDimension: jint): jint {.`static`.}
  proc clearDisappearingChildren*()
  proc startViewTransition*(view: View)
  proc endViewTransition*(view: View)
  proc suppressLayout*(suppress: jboolean)
  proc isLayoutSuppressed*(): jboolean
  proc gatherTransparentRegion*(region: Region): jboolean
  proc requestTransparentRegion*(child: View)
  proc subtractObscuredTouchableRegion*(touchableRegion: Region, view: View)
  proc getChildLocalHitRegion*(child: View, region: Region, matrix: Matrix, isHover: jboolean): jboolean
  proc dispatchApplyWindowInsets*(insets: WindowInsets): WindowInsets
  proc setWindowInsetsAnimationCallback*(callback: WindowInsetsAnimation.Callback)
  proc hasWindowInsetsAnimationCallback*(): jboolean
  proc dispatchWindowInsetsAnimationPrepare*(animation: WindowInsetsAnimation)
  proc dispatchWindowInsetsAnimationStart*(animation: WindowInsetsAnimation, bounds: Bounds): Bounds
  proc dispatchWindowInsetsAnimationProgress*(insets: WindowInsets, runningAnimations: List[WindowInsetsAnimation]): WindowInsets
  proc dispatchWindowInsetsAnimationEnd*(animation: WindowInsetsAnimation)
  proc dispatchScrollCaptureSearch*(localVisibleRect: Rect, windowOffset: Point, targets: Consumer[ScrollCaptureTarget])
  proc getLayoutAnimationListener*(): Animation.AnimationListener
  proc jumpDrawablesToCurrentState*()
  proc setAddStatesFromChildren*(addsStates: jboolean)
  proc addStatesFromChildren*(): jboolean
  proc childDrawableStateChanged*(child: View)
  proc setLayoutAnimationListener*(animationListener: Animation.AnimationListener)
  proc requestTransitionStart*(transition: LayoutTransition)
  proc resolveRtlPropertiesIfNeeded*(): jboolean
  proc resolveLayoutDirection*(): jboolean
  proc resolveTextDirection*(): jboolean
  proc resolveTextAlignment*(): jboolean
  proc resolvePadding*()
  proc resolveLayoutParams*()
  proc resetResolvedLayoutDirection*()
  proc resetResolvedTextDirection*()
  proc resetResolvedTextAlignment*()
  proc resetResolvedPadding*()
  proc shouldDelayChildPressedState*(): jboolean
  proc onStartNestedScroll*(child: View, target: View, nestedScrollAxes: jint): jboolean
  proc onNestedScrollAccepted*(child: View, target: View, axes: jint)
  proc onStopNestedScroll*(child: View)
  proc onNestedScroll*(target: View, dxConsumed: jint, dyConsumed: jint, dxUnconsumed: jint, dyUnconsumed: jint)
  proc onNestedPreScroll*(target: View, dx: jint, dy: jint, consumed: seq[jint])
  proc onNestedFling*(target: View, velocityX: jfloat, velocityY: jfloat, consumed: jboolean): jboolean
  proc onNestedPreFling*(target: View, velocityX: jfloat, velocityY: jfloat): jboolean
  proc getNestedScrollAxes*(): jint
  proc captureTransitioningViews*(transitioningViews: List[View])
  proc findNamedViews*(namedElements: Map[string, View])
  proc onDescendantUnbufferedRequested*()
  proc dispatchCreateViewTranslationRequest*(viewIds: Map[AutofillId, seq[jlong]], supportedFormats: seq[jint], capability: TranslationCapability, requests: List[ViewTranslationRequest])
  proc findOnBackInvokedDispatcherForChild*(child: View, requester: View): OnBackInvokedDispatcher
  proc setRequestedFrameRate*(frameRate: jfloat)
  proc propagateRequestedFrameRate*(frameRate: jfloat, forceOverride: jboolean)
  FOCUS_BEFORE_DESCENDANTS*: jint {.`static`.}
  FOCUS_AFTER_DESCENDANTS*: jint {.`static`.}
  FOCUS_BLOCK_DESCENDANTS*: jint {.`static`.}
  PERSISTENT_NO_CACHE*: jint {.`static`.}
  PERSISTENT_ANIMATION_CACHE*: jint {.`static`.}
  PERSISTENT_SCROLLING_CACHE*: jint {.`static`.}
  PERSISTENT_ALL_CACHES*: jint {.`static`.}
  LAYOUT_MODE_CLIP_BOUNDS*: jint {.`static`.}
  LAYOUT_MODE_OPTICAL_BOUNDS*: jint {.`static`.}
  LAYOUT_MODE_DEFAULT*: jint {.`static`.}

jclass android.view.ViewGroup.LayoutParams* of JVMObject:
  proc resolveLayoutDirection*(layoutDirection: jint)
  proc debug*(output: string): string
  proc onDebugDraw*(view: View, canvas: Canvas, paint: Paint)

jclass android.view.ViewGroup.MarginLayoutParams* of JVMObject:
  proc copyMarginsFrom*(source: MarginLayoutParams)
  proc setMargins*(left: jint, top: jint, right: jint, bottom: jint)
  proc setMarginsRelative*(start: jint, top: jint, end: jint, bottom: jint)
  proc setMarginStart*(start: jint)
  proc getMarginStart*(): jint
  proc setMarginEnd*(end: jint)
  proc getMarginEnd*(): jint
  proc isMarginRelative*(): jboolean
  proc setLayoutDirection*(layoutDirection: jint)
  proc getLayoutDirection*(): jint
  proc resolveLayoutDirection*(layoutDirection: jint)
  proc isLayoutRtl*(): jboolean
  proc onDebugDraw*(view: View, canvas: Canvas, paint: Paint)


jclass android.view.LayoutParams* of JVMObject:
  proc resolveLayoutDirection*(layoutDirection: jint)
  proc debug*(output: string): string
  proc onDebugDraw*(view: View, canvas: Canvas, paint: Paint)
  FILL_PARENT*: jint {.`static`.}
  MATCH_PARENT*: jint {.`static`.}
  WRAP_CONTENT*: jint {.`static`.}
  width*: jint
  height*: jint
  layoutAnimationParameters*: LayoutAnimationController.AnimationParameters

jclass android.view.MarginLayoutParams* of LayoutParams:
  proc copyMarginsFrom*(source: MarginLayoutParams)
  proc setMargins*(left: jint, top: jint, right: jint, bottom: jint)
  proc setMarginsRelative*(start: jint, top: jint, end: jint, bottom: jint)
  proc setMarginStart*(start: jint)
  proc getMarginStart*(): jint
  proc setMarginEnd*(end: jint)
  proc getMarginEnd*(): jint
  proc isMarginRelative*(): jboolean
  proc setLayoutDirection*(layoutDirection: jint)
  proc getLayoutDirection*(): jint
  proc resolveLayoutDirection*(layoutDirection: jint)
  proc isLayoutRtl*(): jboolean
  proc onDebugDraw*(view: View, canvas: Canvas, paint: Paint)
  leftMargin*: jint
  topMargin*: jint
  rightMargin*: jint
  bottomMargin*: jint
  DEFAULT_MARGIN_RELATIVE*: jint {.`static`.}

