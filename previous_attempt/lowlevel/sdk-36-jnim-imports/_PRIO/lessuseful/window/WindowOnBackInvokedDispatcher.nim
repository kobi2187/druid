import jnim

jclass android.window.WindowOnBackInvokedDispatcher* of JVMObject:
  proc onMotionEvent*(ev: MotionEvent)
  proc attachToWindow*(windowSession: IWindowSession, window: IWindow, viewRoot: ViewRootImpl, imeBackAnimationController: ImeBackAnimationController)
  proc detachFromWindow*()
  proc registerOnBackInvokedCallback*(priority: jint, callback: OnBackInvokedCallback)
  proc registerOnBackInvokedCallbackUnchecked*(callback: OnBackInvokedCallback, priority: jint)
  proc unregisterOnBackInvokedCallback*(callback: OnBackInvokedCallback)
  proc isBackGestureInProgress*(): jboolean
  proc registerSystemOnBackInvokedCallback*(callback: OnBackInvokedCallback)
  proc clear*()
  proc tryInvokeSystemNavigationObserverCallback*()
  proc getTopCallback*(): OnBackInvokedCallback
  proc updateContext*(context: Context)
  proc onConfigurationChanged*(configuration: Configuration)
  proc isOnBackInvokedCallbackEnabled*(): jboolean
  proc dump*(prefix: string, writer: PrintWriter)
  proc isOnBackInvokedCallbackEnabled*(context: Context): jboolean {.`static`.}
  proc setImeOnBackInvokedDispatcher*(imeDispatcher: ImeOnBackInvokedDispatcher)
  proc hasImeOnBackInvokedDispatcher*(): jboolean
  proc isOnBackInvokedCallbackEnabled*(activityInfo: ActivityInfo, applicationInfo: ApplicationInfo, contextSupplier: Supplier[Context]): jboolean {.`static`.}
  mTouchTracker*: BackTouchTracker
  mProgressAnimator*: BackProgressAnimator
  mOnBackInvokedCallbacks*: TreeMap[Integer, ArrayList[OnBackInvokedCallback]]
  mSystemNavigationObserverCallback*: OnBackInvokedCallback

jclass android.window.WindowOnBackInvokedDispatcher.Checker* of JVMObject:
  proc checkApplicationCallbackRegistration*(priority: jint, callback: OnBackInvokedCallback): jboolean

jclass android.window.Checker* of JVMObject:
  proc checkApplicationCallbackRegistration*(priority: jint, callback: OnBackInvokedCallback): jboolean

