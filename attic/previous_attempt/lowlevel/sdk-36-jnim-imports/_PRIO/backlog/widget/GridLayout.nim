import jnim

jclass android.widget.GridLayout* of ViewGroup:
  proc getOrientation*(): jint
  proc setOrientation*(orientation: jint)
  proc getRowCount*(): jint
  proc setRowCount*(rowCount: jint)
  proc getColumnCount*(): jint
  proc setColumnCount*(columnCount: jint)
  proc getUseDefaultMargins*(): jboolean
  proc setUseDefaultMargins*(useDefaultMargins: jboolean)
  proc getAlignmentMode*(): jint
  proc setAlignmentMode*(alignmentMode: jint)
  proc isRowOrderPreserved*(): jboolean
  proc setRowOrderPreserved*(rowOrderPreserved: jboolean)
  proc isColumnOrderPreserved*(): jboolean
  proc setColumnOrderPreserved*(columnOrderPreserved: jboolean)
  proc getPrinter*(): Printer
  proc setPrinter*(printer: Printer)
  proc generateLayoutParams*(attrs: AttributeSet): LayoutParams
  proc onViewAdded*(child: View)
  proc onViewRemoved*(child: View)
  proc requestLayout*()
  proc getAccessibilityClassName*(): CharSequence
  proc spec*(start: jint, size: jint, alignment: Alignment, weight: jfloat): Spec {.`static`.}
  proc spec*(start: jint, alignment: Alignment, weight: jfloat): Spec {.`static`.}
  proc spec*(start: jint, size: jint, weight: jfloat): Spec {.`static`.}
  proc spec*(start: jint, weight: jfloat): Spec {.`static`.}
  proc spec*(start: jint, size: jint, alignment: Alignment): Spec {.`static`.}
  proc spec*(start: jint, alignment: Alignment): Spec {.`static`.}
  proc spec*(start: jint, size: jint): Spec {.`static`.}
  proc spec*(start: jint): Spec {.`static`.}
  HORIZONTAL*: jint {.`static`.}
  VERTICAL*: jint {.`static`.}
  UNDEFINED*: jint {.`static`.}
  ALIGN_BOUNDS*: jint {.`static`.}
  ALIGN_MARGINS*: jint {.`static`.}
  TOP*: Alignment {.`static`.}
  BOTTOM*: Alignment {.`static`.}
  START*: Alignment {.`static`.}
  END*: Alignment {.`static`.}
  LEFT*: Alignment {.`static`.}
  RIGHT*: Alignment {.`static`.}
  CENTER*: Alignment {.`static`.}
  BASELINE*: Alignment {.`static`.}
  FILL*: Alignment {.`static`.}

jclass android.widget.GridLayout.LayoutParams* of JVMObject:
  proc setGravity*(gravity: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.widget.GridLayout.Spec* of JVMObject:
  proc equals*(that: JObject): jboolean
  proc hashCode*(): jint

jclass android.widget.LayoutParams* of MarginLayoutParams:
  proc setGravity*(gravity: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  rowSpec*: Spec
  columnSpec*: Spec

jclass android.widget.Spec* of JVMObject:
  proc equals*(that: JObject): jboolean
  proc hashCode*(): jint

