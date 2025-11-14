import jnim

jclass android.widget.PopupWindow* of JVMObject:
  proc setEnterTransition*(enterTransition: Transition)
  proc getEnterTransition*(): Transition
  proc setExitTransition*(exitTransition: Transition)
  proc getExitTransition*(): Transition
  proc getEpicenterBounds*(): Rect
  proc setEpicenterBounds*(bounds: Rect)
  proc getBackground*(): Drawable
  proc setBackgroundDrawable*(background: Drawable)
  proc getElevation*(): jfloat
  proc setElevation*(elevation: jfloat)
  proc getAnimationStyle*(): jint
  proc setIgnoreCheekPress*()
  proc setAnimationStyle*(animationStyle: jint)
  proc getContentView*(): View
  proc setContentView*(contentView: View)
  proc setTouchInterceptor*(l: OnTouchListener)
  proc isFocusable*(): jboolean
  proc setFocusable*(focusable: jboolean)
  proc getInputMethodMode*(): jint
  proc setInputMethodMode*(mode: jint)
  proc setSoftInputMode*(mode: jint)
  proc getSoftInputMode*(): jint
  proc isTouchable*(): jboolean
  proc setTouchable*(touchable: jboolean)
  proc isOutsideTouchable*(): jboolean
  proc setOutsideTouchable*(touchable: jboolean)
  proc isClippingEnabled*(): jboolean
  proc setClippingEnabled*(enabled: jboolean)
  proc isClipToScreenEnabled*(): jboolean
  proc setClipToScreenEnabled*(enabled: jboolean)
  proc isClippedToScreen*(): jboolean
  proc setIsClippedToScreen*(enabled: jboolean)
  proc isSplitTouchEnabled*(): jboolean
  proc setSplitTouchEnabled*(enabled: jboolean)
  proc isLayoutInScreenEnabled*(): jboolean
  proc setLayoutInScreenEnabled*(enabled: jboolean)
  proc isLaidOutInScreen*(): jboolean
  proc setIsLaidOutInScreen*(enabled: jboolean)
  proc isAttachedInDecor*(): jboolean
  proc setAttachedInDecor*(enabled: jboolean)
  proc setLayoutInsetDecor*(enabled: jboolean)
  proc setWindowLayoutType*(layoutType: jint)
  proc getWindowLayoutType*(): jint
  proc isTouchModal*(): jboolean
  proc setTouchModal*(touchModal: jboolean)
  proc setWindowLayoutMode*(widthSpec: jint, heightSpec: jint)
  proc getHeight*(): jint
  proc setHeight*(height: jint)
  proc getWidth*(): jint
  proc setWidth*(width: jint)
  proc setOverlapAnchor*(overlapAnchor: jboolean)
  proc getOverlapAnchor*(): jboolean
  proc isShowing*(): jboolean
  proc showAtLocation*(parent: View, gravity: jint, x: jint, y: jint)
  proc showAtLocation*(token: IBinder, gravity: jint, x: jint, y: jint)
  proc showAsDropDown*(anchor: View)
  proc showAsDropDown*(anchor: View, xoff: jint, yoff: jint)
  proc showAsDropDown*(anchor: View, xoff: jint, yoff: jint, gravity: jint)
  proc isAboveAnchor*(): jboolean
  proc getMaxAvailableHeight*(anchor: View): jint
  proc getMaxAvailableHeight*(anchor: View, yOffset: jint): jint
  proc getMaxAvailableHeight*(anchor: View, yOffset: jint, ignoreBottomDecorations: jboolean): jint
  proc dismiss*()
  proc setOnDismissListener*(onDismissListener: OnDismissListener)
  proc update*()
  proc update*(width: jint, height: jint)
  proc update*(x: jint, y: jint, width: jint, height: jint)
  proc update*(x: jint, y: jint, width: jint, height: jint, force: jboolean)
  proc update*(anchor: View, width: jint, height: jint)
  proc update*(anchor: View, xoff: jint, yoff: jint, width: jint, height: jint)
  INPUT_METHOD_FROM_FOCUSABLE*: jint {.`static`.}
  INPUT_METHOD_NEEDED*: jint {.`static`.}
  INPUT_METHOD_NOT_NEEDED*: jint {.`static`.}

jclass android.widget.PopupWindow.OnDismissListener* of JVMObject:
  proc onDismiss*()

jclass android.widget.OnDismissListener* of JVMObject:
  proc onDismiss*()

