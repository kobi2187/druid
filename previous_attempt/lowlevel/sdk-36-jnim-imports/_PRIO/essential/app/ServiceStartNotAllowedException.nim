import jnim

jclass android.app.ServiceStartNotAllowedException* of IllegalStateException:
  proc newInstance*(foreground: jboolean, message: string): ServiceStartNotAllowedException {.`static`.}
  proc getCause*(): Throwable

