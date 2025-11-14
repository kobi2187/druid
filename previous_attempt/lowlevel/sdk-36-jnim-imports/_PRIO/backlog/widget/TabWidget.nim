import jnim

jclass android.widget.TabWidget* of LinearLayout:
  proc getChildTabViewAt*(index: jint): View
  proc getTabCount*(): jint
  proc setDividerDrawable*(drawable: Drawable)
  proc setDividerDrawable*(resId: jint)
  proc setLeftStripDrawable*(drawable: Drawable)
  proc setLeftStripDrawable*(resId: jint)
  proc getLeftStripDrawable*(): Drawable
  proc setRightStripDrawable*(drawable: Drawable)
  proc setRightStripDrawable*(resId: jint)
  proc getRightStripDrawable*(): Drawable
  proc setStripEnabled*(stripEnabled: jboolean)
  proc isStripEnabled*(): jboolean
  proc childDrawableStateChanged*(child: View)
  proc dispatchDraw*(canvas: Canvas)
  proc setCurrentTab*(index: jint)
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityEventInternal*(event: AccessibilityEvent)
  proc focusCurrentTab*(index: jint)
  proc setEnabled*(enabled: jboolean)
  proc addView*(child: View)
  proc removeAllViews*()
  proc onResolvePointerIcon*(event: MotionEvent, pointerIndex: jint): PointerIcon
  proc onFocusChange*(v: View, hasFocus: jboolean)

