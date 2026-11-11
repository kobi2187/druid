import jnim

jclass android.widget.ScrollBarDrawable* of Drawable:
  proc setAlwaysDrawHorizontalTrack*(alwaysDrawTrack: jboolean)
  proc setAlwaysDrawVerticalTrack*(alwaysDrawTrack: jboolean)
  proc getAlwaysDrawVerticalTrack*(): jboolean
  proc getAlwaysDrawHorizontalTrack*(): jboolean
  proc setParameters*(range: jint, offset: jint, extent: jint, vertical: jboolean)
  proc draw*(canvas: Canvas)
  proc isStateful*(): jboolean
  proc setVerticalThumbDrawable*(thumb: Drawable)
  proc getVerticalTrackDrawable*(): Drawable
  proc getVerticalThumbDrawable*(): Drawable
  proc getHorizontalTrackDrawable*(): Drawable
  proc getHorizontalThumbDrawable*(): Drawable
  proc setVerticalTrackDrawable*(track: Drawable)
  proc setHorizontalThumbDrawable*(thumb: Drawable)
  proc setHorizontalTrackDrawable*(track: Drawable)
  proc getSize*(vertical: jboolean): jint
  proc mutate*(): ScrollBarDrawable
  proc setAlpha*(alpha: jint)
  proc getAlpha*(): jint
  proc setColorFilter*(colorFilter: ColorFilter)
  proc getColorFilter*(): ColorFilter
  proc getOpacity*(): jint
  proc invalidateDrawable*(who: Drawable)
  proc scheduleDrawable*(who: Drawable, what: Runnable, when: jlong)
  proc unscheduleDrawable*(who: Drawable, what: Runnable)
  proc toString*(): string

