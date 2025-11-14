import jnim

jclass android.preference.DialogPreference* of Preference:
  proc setDialogTitle*(dialogTitle: CharSequence)
  proc setDialogTitle*(dialogTitleResId: jint)
  proc getDialogTitle*(): CharSequence
  proc setDialogMessage*(dialogMessage: CharSequence)
  proc setDialogMessage*(dialogMessageResId: jint)
  proc getDialogMessage*(): CharSequence
  proc setDialogIcon*(dialogIcon: Drawable)
  proc setDialogIcon*(dialogIconRes: jint)
  proc getDialogIcon*(): Drawable
  proc setPositiveButtonText*(positiveButtonText: CharSequence)
  proc setPositiveButtonText*(positiveButtonTextResId: jint)
  proc getPositiveButtonText*(): CharSequence
  proc setNegativeButtonText*(negativeButtonText: CharSequence)
  proc setNegativeButtonText*(negativeButtonTextResId: jint)
  proc getNegativeButtonText*(): CharSequence
  proc setDialogLayoutResource*(dialogLayoutResId: jint)
  proc getDialogLayoutResource*(): jint
  proc onClick*(dialog: DialogInterface, which: jint)
  proc onDismiss*(dialog: DialogInterface)
  proc getDialog*(): Dialog
  proc onActivityDestroy*()

