import jnim

jclass android.widget.AbsListView* of AdapterView:
  proc setAdapter*(adapter: ListAdapter)
  proc getCheckedItemCount*(): jint
  proc isItemChecked*(position: jint): jboolean
  proc getCheckedItemPosition*(): jint
  proc getCheckedItemPositions*(): SparseBooleanArray
  proc getCheckedItemIds*(): seq[jlong]
  proc clearChoices*()
  proc setItemChecked*(position: jint, value: jboolean)
  proc performItemClick*(view: View, position: jint, id: jlong): jboolean
  proc getChoiceMode*(): jint
  proc setChoiceMode*(choiceMode: jint)
  proc setMultiChoiceModeListener*(listener: MultiChoiceModeListener)
  proc setFastScrollEnabled*(enabled: jboolean)
  proc setFastScrollStyle*(styleResId: jint)
  proc setFastScrollAlwaysVisible*(alwaysShow: jboolean)
  proc isFastScrollAlwaysVisible*(): jboolean
  proc getVerticalScrollbarWidth*(): jint
  proc isFastScrollEnabled*(): jboolean
  proc setVerticalScrollbarPosition*(position: jint)
  proc setScrollBarStyle*(style: jint)
  proc setSmoothScrollbarEnabled*(enabled: jboolean)
  proc isSmoothScrollbarEnabled*(): jboolean
  proc setOnScrollListener*(l: OnScrollListener)
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc performAccessibilityActionInternal*(action: jint, arguments: Bundle): jboolean
  proc isScrollingCacheEnabled*(): jboolean
  proc setScrollingCacheEnabled*(enabled: jboolean)
  proc setTextFilterEnabled*(textFilterEnabled: jboolean)
  proc isTextFilterEnabled*(): jboolean
  proc getFocusedRect*(r: Rect)
  proc isStackFromBottom*(): jboolean
  proc setStackFromBottom*(stackFromBottom: jboolean)
  proc onSaveInstanceState*(): Parcelable
  proc onRestoreInstanceState*(state: Parcelable)
  proc setFilterText*(filterText: string)
  proc getTextFilter*(): CharSequence
  proc requestLayout*()
  proc getSelectedView*(): View
  proc getListPaddingTop*(): jint
  proc getListPaddingBottom*(): jint
  proc getListPaddingLeft*(): jint
  proc getListPaddingRight*(): jint
  proc onInitializeAccessibilityNodeInfoForItem*(view: View, position: jint, info: AccessibilityNodeInfo)
  proc isSelectedChildViewEnabled*(): jboolean
  proc setSelectedChildViewEnabled*(selectedChildViewEnabled: jboolean)
  proc shouldDrawSelector*(): jboolean
  proc setDrawSelectorOnTop*(onTop: jboolean)
  proc isDrawSelectorOnTop*(): jboolean
  proc setSelector*(resID: jint)
  proc setSelector*(sel: Drawable)
  proc getSelector*(): Drawable
  proc setScrollIndicators*(up: View, down: View)
  proc verifyDrawable*(dr: Drawable): jboolean
  proc jumpDrawablesToCurrentState*()
  proc onWindowFocusChanged*(hasWindowFocus: jboolean)
  proc onRtlPropertiesChanged*(layoutDirection: jint)
  proc onCancelPendingInputEvents*()
  proc showContextMenu*(): jboolean
  proc showContextMenu*(x: jfloat, y: jfloat): jboolean
  proc showContextMenuForChild*(originalView: View): jboolean
  proc showContextMenuForChild*(originalView: View, x: jfloat, y: jfloat): jboolean
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  proc dispatchDrawableHotspotChanged*(x: jfloat, y: jfloat)
  proc pointToPosition*(x: jint, y: jint): jint
  proc pointToRowId*(x: jint, y: jint): jlong
  proc onTouchModeChanged*(isInTouchMode: jboolean)
  proc onTouchEvent*(ev: MotionEvent): jboolean
  proc onGenericMotionEvent*(event: MotionEvent): jboolean
  proc fling*(velocityY: jint)
  proc onStartNestedScroll*(child: View, target: View, nestedScrollAxes: jint): jboolean
  proc onNestedScrollAccepted*(child: View, target: View, axes: jint)
  proc onNestedScroll*(target: View, dxConsumed: jint, dyConsumed: jint, dxUnconsumed: jint, dyUnconsumed: jint)
  proc onNestedFling*(target: View, velocityX: jfloat, velocityY: jfloat, consumed: jboolean): jboolean
  proc draw*(canvas: Canvas)
  proc requestDisallowInterceptTouchEvent*(disallowIntercept: jboolean)
  proc onInterceptHoverEvent*(event: MotionEvent): jboolean
  proc onResolvePointerIcon*(event: MotionEvent, pointerIndex: jint): PointerIcon
  proc onInterceptTouchEvent*(ev: MotionEvent): jboolean
  proc addTouchables*(views: ArrayList[View])
  proc setFriction*(friction: jfloat)
  proc setVelocityScale*(scale: jfloat)
  proc smoothScrollToPosition*(position: jint)
  proc smoothScrollToPositionFromTop*(position: jint, offset: jint, duration: jint)
  proc smoothScrollToPositionFromTop*(position: jint, offset: jint)
  proc smoothScrollToPosition*(position: jint, boundPosition: jint)
  proc smoothScrollBy*(distance: jint, duration: jint)
  proc scrollListBy*(y: jint)
  proc canScrollList*(direction: jint): jboolean
  proc invalidateViews*()
  proc onCreateInputConnection*(outAttrs: EditorInfo): InputConnection
  proc checkInputConnectionProxy*(view: View): jboolean
  proc clearTextFilter*()
  proc hasTextFilter*(): jboolean
  proc onGlobalLayout*()
  proc beforeTextChanged*(s: CharSequence, start: jint, count: jint, after: jint)
  proc onTextChanged*(s: CharSequence, start: jint, before: jint, count: jint)
  proc afterTextChanged*(s: Editable)
  proc onFilterComplete*(count: jint)
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc setTranscriptMode*(mode: jint)
  proc getTranscriptMode*(): jint
  proc getSolidColor*(): jint
  proc setCacheColorHint*(color: jint)
  proc getCacheColorHint*(): jint
  proc reclaimViews*(views: List[View])
  proc setRemoteViewsAdapter*(intent: Intent)
  proc setRemoteViewsAdapterAsync*(intent: Intent): Runnable
  proc setRemoteViewsAdapter*(intent: Intent, isAsync: jboolean)
  proc setRemoteViewsInteractionHandler*(handler: InteractionHandler)
  proc deferNotifyDataSetChanged*()
  proc onRemoteAdapterConnected*(): jboolean
  proc onRemoteAdapterDisconnected*()
  proc setEdgeEffectColor*(color: jint)
  proc setBottomEdgeEffectColor*(color: jint)
  proc setTopEdgeEffectColor*(color: jint)
  proc getTopEdgeEffectColor*(): jint
  proc getBottomEdgeEffectColor*(): jint
  proc setRecyclerListener*(listener: RecyclerListener)
  proc onProvideContentCaptureStructure*(structure: ViewStructure, flags: jint)
  proc setSelectionFromTop*(position: jint, y: jint)
  TRANSCRIPT_MODE_DISABLED*: jint {.`static`.}
  TRANSCRIPT_MODE_NORMAL*: jint {.`static`.}
  TRANSCRIPT_MODE_ALWAYS_SCROLL*: jint {.`static`.}
  CHOICE_MODE_NONE*: jint {.`static`.}
  CHOICE_MODE_SINGLE*: jint {.`static`.}
  CHOICE_MODE_MULTIPLE*: jint {.`static`.}
  CHOICE_MODE_MULTIPLE_MODAL*: jint {.`static`.}
  mEdgeGlowTop*: EdgeEffect
  mEdgeGlowBottom*: EdgeEffect

jclass android.widget.AbsListView.OnScrollListener* of JVMObject:
  proc onScrollStateChanged*(view: AbsListView, scrollState: jint)
  proc onScroll*(view: AbsListView, firstVisibleItem: jint, visibleItemCount: jint, totalItemCount: jint)

jclass android.widget.AbsListView.SelectionBoundsAdjuster* of JVMObject:
  proc adjustListItemSelectionBounds*(bounds: Rect)

jclass android.widget.AbsListView.MultiChoiceModeListener* of JVMObject:
  proc onItemCheckedStateChanged*(mode: ActionMode, position: jint, id: jlong, checked: jboolean)

jclass android.widget.OnScrollListener* of JVMObject:
  proc onScrollStateChanged*(view: AbsListView, scrollState: jint)
  proc onScroll*(view: AbsListView, firstVisibleItem: jint, visibleItemCount: jint, totalItemCount: jint)
  SCROLL_STATE_IDLE*: jint {.`static`.}
  SCROLL_STATE_TOUCH_SCROLL*: jint {.`static`.}
  SCROLL_STATE_FLING*: jint {.`static`.}

jclass android.widget.SelectionBoundsAdjuster* of JVMObject:
  proc adjustListItemSelectionBounds*(bounds: Rect)

jclass android.widget.MultiChoiceModeListener* of Callback:
  proc onItemCheckedStateChanged*(mode: ActionMode, position: jint, id: jlong, checked: jboolean)

jclass android.widget.LayoutParams* of LayoutParams:

