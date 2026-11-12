import jnim

jclass android.widget.ActivityChooserView* of ViewGroup:
  proc setActivityChooserModel*(dataModel: ActivityChooserModel)
  proc setExpandActivityOverflowButtonDrawable*(drawable: Drawable)
  proc setExpandActivityOverflowButtonContentDescription*(resourceId: jint)
  proc setProvider*(provider: ActionProvider)
  proc showPopup*(): jboolean
  proc dismissPopup*(): jboolean
  proc isShowingPopup*(): jboolean
  proc getDataModel*(): ActivityChooserModel
  proc setOnDismissListener*(listener: PopupWindow.OnDismissListener)
  proc setInitialActivityCount*(itemCount: jint)
  proc setDefaultActionButtonContentDescription*(resourceId: jint)

