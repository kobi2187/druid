import jnim

jclass android.widget.AbsoluteLayout* of ViewGroup:
  proc generateLayoutParams*(attrs: AttributeSet): ViewGroup.LayoutParams
  proc shouldDelayChildPressedState*(): jboolean

jclass android.widget.AbsoluteLayout.LayoutParams* of JVMObject:
  proc debug*(output: string): string

jclass android.widget.LayoutParams* of LayoutParams:
  proc debug*(output: string): string
  x*: jint
  y*: jint

