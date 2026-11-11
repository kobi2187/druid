import jnim

jclass android.app.AlertDialog* of Dialog:
  proc getButton*(whichButton: jint): Button
  proc getListView*(): ListView
  proc setTitle*(title: CharSequence)
  proc setCustomTitle*(customTitleView: View)
  proc setMessage*(message: CharSequence)
  proc setMessageMovementMethod*(movementMethod: MovementMethod)
  proc setMessageHyphenationFrequency*(hyphenationFrequency: jint)
  proc setView*(view: View)
  proc setView*(view: View, viewSpacingLeft: jint, viewSpacingTop: jint, viewSpacingRight: jint, viewSpacingBottom: jint)
  proc setButton*(whichButton: jint, text: CharSequence, msg: Message)
  proc setButton*(whichButton: jint, text: CharSequence, listener: OnClickListener)
  proc setButton*(text: CharSequence, msg: Message)
  proc setButton2*(text: CharSequence, msg: Message)
  proc setButton3*(text: CharSequence, msg: Message)
  proc setButton*(text: CharSequence, listener: OnClickListener)
  proc setButton2*(text: CharSequence, listener: OnClickListener)
  proc setButton3*(text: CharSequence, listener: OnClickListener)
  proc setIcon*(resId: jint)
  proc setIcon*(icon: Drawable)
  proc setIconAttribute*(attrId: jint)
  proc setInverseBackgroundForced*(forceInverseBackground: jboolean)
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  THEME_TRADITIONAL*: jint {.`static`.}
  THEME_HOLO_DARK*: jint {.`static`.}
  THEME_HOLO_LIGHT*: jint {.`static`.}
  THEME_DEVICE_DEFAULT_DARK*: jint {.`static`.}
  THEME_DEVICE_DEFAULT_LIGHT*: jint {.`static`.}
  LAYOUT_HINT_NONE*: jint {.`static`.}
  LAYOUT_HINT_SIDE*: jint {.`static`.}

jclass android.app.AlertDialog.Builder* of JVMObject:
  proc getContext*(): Context
  proc setTitle*(titleId: jint): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setCustomTitle*(customTitleView: View): Builder
  proc setMessage*(messageId: jint): Builder
  proc setMessage*(message: CharSequence): Builder
  proc setIcon*(iconId: jint): Builder
  proc setIcon*(icon: Drawable): Builder
  proc setIconAttribute*(attrId: jint): Builder
  proc setPositiveButton*(textId: jint, listener: OnClickListener): Builder
  proc setPositiveButton*(text: CharSequence, listener: OnClickListener): Builder
  proc setNegativeButton*(textId: jint, listener: OnClickListener): Builder
  proc setNegativeButton*(text: CharSequence, listener: OnClickListener): Builder
  proc setNeutralButton*(textId: jint, listener: OnClickListener): Builder
  proc setNeutralButton*(text: CharSequence, listener: OnClickListener): Builder
  proc setCancelable*(cancelable: jboolean): Builder
  proc setOnCancelListener*(onCancelListener: OnCancelListener): Builder
  proc setOnDismissListener*(onDismissListener: OnDismissListener): Builder
  proc setOnKeyListener*(onKeyListener: OnKeyListener): Builder
  proc setItems*(itemsId: jint, listener: OnClickListener): Builder
  proc setItems*(items: seq[CharSequence], listener: OnClickListener): Builder
  proc setAdapter*(adapter: ListAdapter, listener: OnClickListener): Builder
  proc setCursor*(cursor: Cursor, listener: OnClickListener, labelColumn: string): Builder
  proc setMultiChoiceItems*(itemsId: jint, checkedItems: seq[jboolean], listener: OnMultiChoiceClickListener): Builder
  proc setMultiChoiceItems*(items: seq[CharSequence], checkedItems: seq[jboolean], listener: OnMultiChoiceClickListener): Builder
  proc setMultiChoiceItems*(cursor: Cursor, isCheckedColumn: string, labelColumn: string, listener: OnMultiChoiceClickListener): Builder
  proc setSingleChoiceItems*(itemsId: jint, checkedItem: jint, listener: OnClickListener): Builder
  proc setSingleChoiceItems*(cursor: Cursor, checkedItem: jint, labelColumn: string, listener: OnClickListener): Builder
  proc setSingleChoiceItems*(items: seq[CharSequence], checkedItem: jint, listener: OnClickListener): Builder
  proc setSingleChoiceItems*(adapter: ListAdapter, checkedItem: jint, listener: OnClickListener): Builder
  proc setOnItemSelectedListener*(listener: AdapterView.OnItemSelectedListener): Builder
  proc setView*(layoutResId: jint): Builder
  proc setView*(view: View): Builder
  proc setView*(view: View, viewSpacingLeft: jint, viewSpacingTop: jint, viewSpacingRight: jint, viewSpacingBottom: jint): Builder
  proc setInverseBackgroundForced*(useInverseBackground: jboolean): Builder
  proc setRecycleOnMeasureEnabled*(enabled: jboolean): Builder
  proc create*(): AlertDialog
  proc show*(): AlertDialog

jclass android.app.Builder* of JVMObject:
  proc getContext*(): Context
  proc setTitle*(titleId: jint): Builder
  proc setTitle*(title: CharSequence): Builder
  proc setCustomTitle*(customTitleView: View): Builder
  proc setMessage*(messageId: jint): Builder
  proc setMessage*(message: CharSequence): Builder
  proc setIcon*(iconId: jint): Builder
  proc setIcon*(icon: Drawable): Builder
  proc setIconAttribute*(attrId: jint): Builder
  proc setPositiveButton*(textId: jint, listener: OnClickListener): Builder
  proc setPositiveButton*(text: CharSequence, listener: OnClickListener): Builder
  proc setNegativeButton*(textId: jint, listener: OnClickListener): Builder
  proc setNegativeButton*(text: CharSequence, listener: OnClickListener): Builder
  proc setNeutralButton*(textId: jint, listener: OnClickListener): Builder
  proc setNeutralButton*(text: CharSequence, listener: OnClickListener): Builder
  proc setCancelable*(cancelable: jboolean): Builder
  proc setOnCancelListener*(onCancelListener: OnCancelListener): Builder
  proc setOnDismissListener*(onDismissListener: OnDismissListener): Builder
  proc setOnKeyListener*(onKeyListener: OnKeyListener): Builder
  proc setItems*(itemsId: jint, listener: OnClickListener): Builder
  proc setItems*(items: seq[CharSequence], listener: OnClickListener): Builder
  proc setAdapter*(adapter: ListAdapter, listener: OnClickListener): Builder
  proc setCursor*(cursor: Cursor, listener: OnClickListener, labelColumn: string): Builder
  proc setMultiChoiceItems*(itemsId: jint, checkedItems: seq[jboolean], listener: OnMultiChoiceClickListener): Builder
  proc setMultiChoiceItems*(items: seq[CharSequence], checkedItems: seq[jboolean], listener: OnMultiChoiceClickListener): Builder
  proc setMultiChoiceItems*(cursor: Cursor, isCheckedColumn: string, labelColumn: string, listener: OnMultiChoiceClickListener): Builder
  proc setSingleChoiceItems*(itemsId: jint, checkedItem: jint, listener: OnClickListener): Builder
  proc setSingleChoiceItems*(cursor: Cursor, checkedItem: jint, labelColumn: string, listener: OnClickListener): Builder
  proc setSingleChoiceItems*(items: seq[CharSequence], checkedItem: jint, listener: OnClickListener): Builder
  proc setSingleChoiceItems*(adapter: ListAdapter, checkedItem: jint, listener: OnClickListener): Builder
  proc setOnItemSelectedListener*(listener: AdapterView.OnItemSelectedListener): Builder
  proc setView*(layoutResId: jint): Builder
  proc setView*(view: View): Builder
  proc setView*(view: View, viewSpacingLeft: jint, viewSpacingTop: jint, viewSpacingRight: jint, viewSpacingBottom: jint): Builder
  proc setInverseBackgroundForced*(useInverseBackground: jboolean): Builder
  proc setRecycleOnMeasureEnabled*(enabled: jboolean): Builder
  proc create*(): AlertDialog
  proc show*(): AlertDialog

