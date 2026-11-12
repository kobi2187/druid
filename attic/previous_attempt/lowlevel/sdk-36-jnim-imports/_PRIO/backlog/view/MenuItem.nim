import jnim

jclass android.view.MenuItem* of JVMObject:
  proc getItemId*(): jint
  proc getGroupId*(): jint
  proc getOrder*(): jint
  proc setTitle*(title: CharSequence): MenuItem
  proc setTitle*(title: jint): MenuItem
  proc getTitle*(): CharSequence
  proc setTitleCondensed*(title: CharSequence): MenuItem
  proc getTitleCondensed*(): CharSequence
  proc setIcon*(icon: Drawable): MenuItem
  proc setIcon*(iconRes: jint): MenuItem
  proc getIcon*(): Drawable
  proc setIconTintList*(tint: ColorStateList): MenuItem
  proc getIconTintList*(): ColorStateList
  proc getIconTintMode*(): PorterDuff.Mode
  proc setIntent*(intent: Intent): MenuItem
  proc getIntent*(): Intent
  proc setShortcut*(numericChar: jchar, alphaChar: jchar): MenuItem
  proc setShortcut*(numericChar: jchar, alphaChar: jchar, numericModifiers: jint, alphaModifiers: jint): MenuItem
  proc setNumericShortcut*(numericChar: jchar): MenuItem
  proc setNumericShortcut*(numericChar: jchar, numericModifiers: jint): MenuItem
  proc getNumericShortcut*(): jchar
  proc getNumericModifiers*(): jint
  proc setAlphabeticShortcut*(alphaChar: jchar): MenuItem
  proc setAlphabeticShortcut*(alphaChar: jchar, alphaModifiers: jint): MenuItem
  proc getAlphabeticShortcut*(): jchar
  proc getAlphabeticModifiers*(): jint
  proc setCheckable*(checkable: jboolean): MenuItem
  proc isCheckable*(): jboolean
  proc setChecked*(checked: jboolean): MenuItem
  proc isChecked*(): jboolean
  proc setVisible*(visible: jboolean): MenuItem
  proc isVisible*(): jboolean
  proc setEnabled*(enabled: jboolean): MenuItem
  proc isEnabled*(): jboolean
  proc hasSubMenu*(): jboolean
  proc getSubMenu*(): SubMenu
  proc setOnMenuItemClickListener*(menuItemClickListener: MenuItem.OnMenuItemClickListener): MenuItem
  proc getMenuInfo*(): ContextMenuInfo
  proc setShowAsAction*(actionEnum: jint)
  proc setShowAsActionFlags*(actionEnum: jint): MenuItem
  proc setActionView*(view: View): MenuItem
  proc setActionView*(resId: jint): MenuItem
  proc getActionView*(): View
  proc setActionProvider*(actionProvider: ActionProvider): MenuItem
  proc getActionProvider*(): ActionProvider
  proc expandActionView*(): jboolean
  proc collapseActionView*(): jboolean
  proc isActionViewExpanded*(): jboolean
  proc setOnActionExpandListener*(listener: OnActionExpandListener): MenuItem
  SHOW_AS_ACTION_NEVER*: jint {.`static`.}
  SHOW_AS_ACTION_IF_ROOM*: jint {.`static`.}
  SHOW_AS_ACTION_ALWAYS*: jint {.`static`.}
  SHOW_AS_ACTION_WITH_TEXT*: jint {.`static`.}
  SHOW_AS_ACTION_COLLAPSE_ACTION_VIEW*: jint {.`static`.}

jclass android.view.MenuItem.OnMenuItemClickListener* of JVMObject:
  proc onMenuItemClick*(item: MenuItem): jboolean

jclass android.view.MenuItem.OnActionExpandListener* of JVMObject:
  proc onMenuItemActionExpand*(item: MenuItem): jboolean
  proc onMenuItemActionCollapse*(item: MenuItem): jboolean

jclass android.view.OnMenuItemClickListener* of JVMObject:
  proc onMenuItemClick*(item: MenuItem): jboolean

jclass android.view.OnActionExpandListener* of JVMObject:
  proc onMenuItemActionExpand*(item: MenuItem): jboolean
  proc onMenuItemActionCollapse*(item: MenuItem): jboolean

