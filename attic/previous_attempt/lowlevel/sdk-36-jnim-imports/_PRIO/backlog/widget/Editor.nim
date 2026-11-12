import jnim

jclass android.widget.Editor* of JVMObject:
  proc getFlagCursorDragFromAnywhereEnabled*(): jboolean
  proc setFlagCursorDragFromAnywhereEnabled*(enabled: jboolean)
  proc setCursorDragMinAngleFromVertical*(degreesFromVertical: jint)
  proc getFlagInsertionHandleGesturesEnabled*(): jboolean
  proc setFlagInsertionHandleGesturesEnabled*(enabled: jboolean)
  proc getDefaultOnReceiveContentListener*(): TextViewOnReceiveContentListener
  proc setError*(error: CharSequence, icon: Drawable)
  proc getWordIterator*(): WordIterator
  proc performLongClick*(handled: jboolean): jboolean
  proc onTouchEvent*(event: MotionEvent)
  proc beginBatchEdit*()
  proc endBatchEdit*()
  proc getInsertionController*(): InsertionPointCursorController
  proc getSelectionController*(): SelectionModifierCursorController
  proc getCursorDrawable*(): Drawable
  proc onCommitCorrection*(info: CorrectionInfo)
  proc isBlinking*(): jboolean
  proc addSpanWatchers*(text: Spannable)
  proc onCreateContextMenu*(menu: ContextMenu)
  proc setTextContextMenuItems*(menu: ContextMenu)
  proc adjustIconSpacing*(menu: ContextMenu)
  proc setLineChangeSlopMinMaxForTesting*(min: jint, max: jint)
  proc getCurrentLineAdjustedForSlop*(layout: Layout, prevLine: jint, y: jfloat): jint
  HANDLE_TYPE_SELECTION_START*: jint {.`static`.}
  HANDLE_TYPE_SELECTION_END*: jint {.`static`.}

jclass android.widget.Editor.AssistantCallbackHelper* of JVMObject:
  proc clearCallbackHandlers*()
  proc getOnClickListener*(key: MenuItem): OnClickListener
  proc updateAssistMenuItems*(menu: Menu, listener: MenuItem.OnMenuItemClickListener)
  proc onAssistMenuItemClicked*(assistMenuItem: MenuItem): jboolean

jclass android.widget.Editor.HandleView* of JVMObject:
  proc getIdealVerticalOffset*(): jfloat
  proc offsetHasBeenChanged*(): jboolean
  proc invalidate*()
  proc show*()
  proc hide*()
  proc isShowing*(): jboolean
  proc getCurrentCursorOffset*(): jint
  proc getHorizontal*(layout: Layout, offset: jint): jfloat
  proc getLineForOffset*(layout: Layout, offset: jint): jint
  proc updatePosition*(parentPositionX: jint, parentPositionY: jint, parentPositionChanged: jboolean, parentScrolled: jboolean)
  proc onTouchEvent*(ev: MotionEvent): jboolean
  proc isDragging*(): jboolean
  proc onDetached*()

jclass android.widget.Editor.SelectionHandleView* of JVMObject:
  proc getCurrentCursorOffset*(): jint
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc getHorizontal*(layout: Layout, offset: jint): jfloat

jclass android.widget.Editor.InsertionPointCursorController* of JVMObject:
  proc onTouchEvent*(event: MotionEvent)
  proc show*()
  proc hide*()
  proc onTouchModeChanged*(isInTouchMode: jboolean)
  proc getHandle*(): InsertionHandleView
  proc onDetached*()
  proc isCursorBeingModified*(): jboolean
  proc isActive*(): jboolean
  proc invalidateHandle*()

jclass android.widget.Editor.SelectionModifierCursorController* of JVMObject:
  proc show*()
  proc hide*()
  proc enterDrag*(dragAcceleratorMode: jint)
  proc onTouchEvent*(event: MotionEvent)
  proc getMinTouchOffset*(): jint
  proc getMaxTouchOffset*(): jint
  proc resetTouchOffsets*()
  proc isSelectionStartDragged*(): jboolean
  proc isCursorBeingModified*(): jboolean
  proc isDragAcceleratorActive*(): jboolean
  proc onTouchModeChanged*(isInTouchMode: jboolean)
  proc onDetached*()
  proc isActive*(): jboolean
  proc invalidateHandles*()

jclass android.widget.Editor.UndoInputFilter* of JVMObject:
  proc saveInstanceState*(parcel: Parcel)
  proc restoreInstanceState*(parcel: Parcel)
  proc beginBatchEdit*()
  proc endBatchEdit*()
  proc filter*(source: CharSequence, start: jint, end: jint, dest: Spanned, dstart: jint, dend: jint): CharSequence

jclass android.widget.Editor.EditOperation* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc commit*()
  proc undo*()
  proc redo*()
  proc forceMergeWith*(edit: EditOperation)
  proc toString*(): string

jclass android.widget.AssistantCallbackHelper* of JVMObject:
  proc clearCallbackHandlers*()
  proc getOnClickListener*(key: MenuItem): OnClickListener
  proc updateAssistMenuItems*(menu: Menu, listener: MenuItem.OnMenuItemClickListener)
  proc onAssistMenuItemClicked*(assistMenuItem: MenuItem): jboolean

jclass android.widget.HandleView* of View:
  proc getIdealVerticalOffset*(): jfloat
  proc offsetHasBeenChanged*(): jboolean
  proc invalidate*()
  proc show*()
  proc hide*()
  proc isShowing*(): jboolean
  proc getCurrentCursorOffset*(): jint
  proc getHorizontal*(layout: Layout, offset: jint): jfloat
  proc getLineForOffset*(layout: Layout, offset: jint): jint
  proc updatePosition*(parentPositionX: jint, parentPositionY: jint, parentPositionChanged: jboolean, parentScrolled: jboolean)
  proc onTouchEvent*(ev: MotionEvent): jboolean
  proc isDragging*(): jboolean
  proc onDetached*()

jclass android.widget.SelectionHandleView* of HandleView:
  proc getCurrentCursorOffset*(): jint
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc getHorizontal*(layout: Layout, offset: jint): jfloat

jclass android.widget.InsertionPointCursorController* of JVMObject:
  proc onTouchEvent*(event: MotionEvent)
  proc show*()
  proc hide*()
  proc onTouchModeChanged*(isInTouchMode: jboolean)
  proc getHandle*(): InsertionHandleView
  proc onDetached*()
  proc isCursorBeingModified*(): jboolean
  proc isActive*(): jboolean
  proc invalidateHandle*()

jclass android.widget.SelectionModifierCursorController* of JVMObject:
  proc show*()
  proc hide*()
  proc enterDrag*(dragAcceleratorMode: jint)
  proc onTouchEvent*(event: MotionEvent)
  proc getMinTouchOffset*(): jint
  proc getMaxTouchOffset*(): jint
  proc resetTouchOffsets*()
  proc isSelectionStartDragged*(): jboolean
  proc isCursorBeingModified*(): jboolean
  proc isDragAcceleratorActive*(): jboolean
  proc onTouchModeChanged*(isInTouchMode: jboolean)
  proc onDetached*()
  proc isActive*(): jboolean
  proc invalidateHandles*()

jclass android.widget.UndoInputFilter* of JVMObject:
  proc saveInstanceState*(parcel: Parcel)
  proc restoreInstanceState*(parcel: Parcel)
  proc beginBatchEdit*()
  proc endBatchEdit*()
  proc filter*(source: CharSequence, start: jint, end: jint, dest: Spanned, dstart: jint, dend: jint): CharSequence

jclass android.widget.EditOperation* of UndoOperation:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc commit*()
  proc undo*()
  proc redo*()
  proc forceMergeWith*(edit: EditOperation)
  proc toString*(): string
  CREATOR*: Parcelable.ClassLoaderCreator[EditOperation] {.`static`.}

