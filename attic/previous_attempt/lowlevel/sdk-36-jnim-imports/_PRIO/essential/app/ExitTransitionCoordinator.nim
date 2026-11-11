import jnim

jclass android.app.ExitTransitionCoordinator* of ActivityTransitionCoordinator:
  proc resetViews*()
  proc startExit*()
  proc startExit*(activity: Activity)
  proc stop*(activity: Activity)

jclass android.app.ExitTransitionCoordinator.ActivityExitTransitionCallbacks* of JVMObject:
  proc isReturnTransitionAllowed*(): jboolean
  proc onFinish*()


jclass android.app.ActivityExitTransitionCallbacks* of JVMObject:
  proc isReturnTransitionAllowed*(): jboolean
  proc onFinish*()

