import jnim

jclass android.view.ActionProvider* of JVMObject:
  proc onCreateActionView*(): View
  proc onCreateActionView*(forItem: MenuItem): View
  proc overridesItemVisibility*(): jboolean
  proc isVisible*(): jboolean
  proc refreshVisibility*()
  proc onPerformDefaultAction*(): jboolean
  proc hasSubMenu*(): jboolean
  proc onPrepareSubMenu*(subMenu: SubMenu)
  proc subUiVisibilityChanged*(isVisible: jboolean)
  proc setSubUiVisibilityListener*(listener: SubUiVisibilityListener)
  proc setVisibilityListener*(listener: VisibilityListener)
  proc reset*()

jclass android.view.ActionProvider.SubUiVisibilityListener* of JVMObject:
  proc onSubUiVisibilityChanged*(isVisible: jboolean)

jclass android.view.ActionProvider.VisibilityListener* of JVMObject:
  proc onActionProviderVisibilityChanged*(isVisible: jboolean)

jclass android.view.SubUiVisibilityListener* of JVMObject:
  proc onSubUiVisibilityChanged*(isVisible: jboolean)

jclass android.view.VisibilityListener* of JVMObject:
  proc onActionProviderVisibilityChanged*(isVisible: jboolean)

