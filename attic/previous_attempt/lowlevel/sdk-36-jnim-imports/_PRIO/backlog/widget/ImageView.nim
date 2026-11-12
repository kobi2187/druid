import jnim

jclass android.widget.ImageView* of View:
  proc jumpDrawablesToCurrentState*()
  proc invalidateDrawable*(dr: Drawable)
  proc hasOverlappingRendering*(): jboolean
  proc onPopulateAccessibilityEventInternal*(event: AccessibilityEvent)
  proc getAdjustViewBounds*(): jboolean
  proc setAdjustViewBounds*(adjustViewBounds: jboolean)
  proc getMaxWidth*(): jint
  proc setMaxWidth*(maxWidth: jint)
  proc getMaxHeight*(): jint
  proc setMaxHeight*(maxHeight: jint)
  proc getDrawable*(): Drawable
  proc setImageResource*(resId: jint)
  proc setImageResourceAsync*(resId: jint): Runnable
  proc setImageURI*(uri: Uri)
  proc setImageURIAsync*(uri: Uri): Runnable
  proc setImageDrawable*(drawable: Drawable)
  proc setImageIcon*(icon: Icon)
  proc setImageIconAsync*(icon: Icon): Runnable
  proc setImageTintList*(tint: ColorStateList)
  proc getImageTintList*(): ColorStateList
  proc setImageTintMode*(tintMode: PorterDuff.Mode)
  proc setImageTintBlendMode*(blendMode: BlendMode)
  proc getImageTintMode*(): PorterDuff.Mode
  proc getImageTintBlendMode*(): BlendMode
  proc setImageBitmap*(bm: Bitmap)
  proc setImageState*(state: seq[jint], merge: jboolean)
  proc setSelected*(selected: jboolean)
  proc setImageLevel*(level: jint)
  proc setScaleType*(scaleType: ScaleType)
  proc getScaleType*(): ScaleType
  proc getImageMatrix*(): Matrix
  proc setImageMatrix*(matrix: Matrix)
  proc getCropToPadding*(): jboolean
  proc setCropToPadding*(cropToPadding: jboolean)
  proc onCreateDrawableState*(extraSpace: jint): seq[jint]
  proc onRtlPropertiesChanged*(layoutDirection: jint)
  proc drawableHotspotChanged*(x: jfloat, y: jfloat)
  proc animateTransform*(matrix: Matrix)
  proc getBaseline*(): jint
  proc setBaseline*(baseline: jint)
  proc setBaselineAlignBottom*(aligned: jboolean)
  proc getBaselineAlignBottom*(): jboolean
  proc setColorFilter*(color: jint, mode: PorterDuff.Mode)
  proc setColorFilter*(color: jint)
  proc clearColorFilter*()
  proc setXfermode*(mode: Xfermode)
  proc getColorFilter*(): ColorFilter
  proc setColorFilter*(cf: ColorFilter)
  proc getImageAlpha*(): jint
  proc setImageAlpha*(alpha: jint)
  proc setAlpha*(alpha: jint)
  proc isOpaque*(): jboolean
  proc onVisibilityAggregated*(isVisible: jboolean)
  proc setVisibility*(visibility: jint)
  proc getAccessibilityClassName*(): CharSequence
  proc isDefaultFocusHighlightNeeded*(background: Drawable, foreground: Drawable): jboolean

