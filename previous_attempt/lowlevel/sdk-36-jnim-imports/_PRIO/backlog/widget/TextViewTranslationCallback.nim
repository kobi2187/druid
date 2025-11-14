import jnim

jclass android.widget.TextViewTranslationCallback* of JVMObject:
  proc onShowTranslation*(view: View): jboolean
  proc onHideTranslation*(view: View): jboolean
  proc onClearTranslation*(view: View): jboolean
  proc isShowingTranslation*(): jboolean
  proc isAnimationRunning*(): jboolean
  proc enableContentPadding*()
  proc setAnimationDurationMillis*(durationMillis: jint)

