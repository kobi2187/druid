import jnim

jclass android.widget.ToastPresenter* of JVMObject:
  proc getTextToastView*(context: Context, text: CharSequence): View {.`static`.}
  proc getTextToastViewWithIcon*(context: Context, text: CharSequence, icon: Drawable): View {.`static`.}
  proc getPackageName*(): string
  proc getLayoutParams*(): WindowManager.LayoutParams
  proc getView*(): View
  proc getToken*(): IBinder
  proc updateLayoutParams*(xOffset: jint, yOffset: jint, horizontalMargin: jfloat, verticalMargin: jfloat, gravity: jint)
  proc show*(view: View, token: IBinder, windowToken: IBinder, duration: jint, gravity: jint, xOffset: jint, yOffset: jint, horizontalMargin: jfloat, verticalMargin: jfloat, callback: ITransientNotificationCallback)
  proc show*(view: View, token: IBinder, windowToken: IBinder, duration: jint, gravity: jint, xOffset: jint, yOffset: jint, horizontalMargin: jfloat, verticalMargin: jfloat, callback: ITransientNotificationCallback, removeWindowAnimations: jboolean)
  proc hide*(callback: ITransientNotificationCallback)
  proc trySendAccessibilityEvent*(view: View, packageName: string)
  TEXT_TOAST_LAYOUT*: jint {.`static`.}
  TEXT_TOAST_LAYOUT_WITH_ICON*: jint {.`static`.}

