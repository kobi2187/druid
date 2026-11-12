import jnim

jclass android.widget.SelectionActionModeHelper* of JVMObject:
  proc startSelectionActionModeAsync*(adjustSelection: jboolean)
  proc startLinkActionModeAsync*(start: jint, end: jint)
  proc invalidateActionModeAsync*()
  proc onSelectionAction*(menuItemId: jint, actionLabel: string)
  proc onSelectionDrag*()
  proc onTextChanged*(start: jint, end: jint)
  proc resetSelection*(textIndex: jint): jboolean
  proc getTextClassification*(): TextClassification
  proc onDestroyActionMode*()
  proc onDraw*(canvas: Canvas)
  proc isDrawingHighlight*(): jboolean
  proc mergeRectangleIntoList*(list: List[T], candidate: RectF, extractor: Function[T, RectF], packer: Function[RectF, T]) {.`static`.}
  proc movePointInsideNearestRectangle*(point: PointF, list: List[T], extractor: Function[T, RectF]): PointF {.`static`.}

