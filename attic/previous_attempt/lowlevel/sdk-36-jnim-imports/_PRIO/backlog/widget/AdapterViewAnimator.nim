import jnim

jclass android.widget.AdapterViewAnimator* of AdapterView:
  proc setDisplayedChild*(whichChild: jint)
  proc getDisplayedChild*(): jint
  proc showNext*()
  proc showPrevious*()
  proc onTouchEvent*(ev: MotionEvent): jboolean
  proc onSaveInstanceState*(): Parcelable
  proc onRestoreInstanceState*(state: Parcelable)
  proc getCurrentView*(): View
  proc getInAnimation*(): ObjectAnimator
  proc setInAnimation*(inAnimation: ObjectAnimator)
  proc getOutAnimation*(): ObjectAnimator
  proc setOutAnimation*(outAnimation: ObjectAnimator)
  proc setInAnimation*(context: Context, resourceID: jint)
  proc setOutAnimation*(context: Context, resourceID: jint)
  proc setAnimateFirstView*(animate: jboolean)
  proc getBaseline*(): jint
  proc getAdapter*(): Adapter
  proc setAdapter*(adapter: Adapter)
  proc setRemoteViewsAdapter*(intent: Intent)
  proc setRemoteViewsAdapterAsync*(intent: Intent): Runnable
  proc setRemoteViewsAdapter*(intent: Intent, isAsync: jboolean)
  proc setRemoteViewsOnClickHandler*(handler: InteractionHandler)
  proc setSelection*(position: jint)
  proc getSelectedView*(): View
  proc deferNotifyDataSetChanged*()
  proc onRemoteAdapterConnected*(): jboolean
  proc onRemoteAdapterDisconnected*()
  proc advance*()
  proc fyiWillBeAdvancedByHostKThx*()
  proc getAccessibilityClassName*(): CharSequence

