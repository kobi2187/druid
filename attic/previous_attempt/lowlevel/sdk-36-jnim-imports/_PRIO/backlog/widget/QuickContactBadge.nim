import jnim

jclass android.widget.QuickContactBadge* of ImageView:
  proc drawableHotspotChanged*(x: jfloat, y: jfloat)
  proc setMode*(size: jint)
  proc setPrioritizedMimeType*(prioritizedMimeType: string)
  proc setImageToDefault*()
  proc assignContactUri*(contactUri: Uri)
  proc assignContactFromEmail*(emailAddress: string, lazyLookup: jboolean)
  proc assignContactFromEmail*(emailAddress: string, lazyLookup: jboolean, extras: Bundle)
  proc assignContactFromPhone*(phoneNumber: string, lazyLookup: jboolean)
  proc assignContactFromPhone*(phoneNumber: string, lazyLookup: jboolean, extras: Bundle)
  proc setOverlay*(overlay: Drawable)
  proc onClick*(v: View)
  proc getAccessibilityClassName*(): CharSequence
  proc setExcludeMimes*(excludeMimes: seq[string])

