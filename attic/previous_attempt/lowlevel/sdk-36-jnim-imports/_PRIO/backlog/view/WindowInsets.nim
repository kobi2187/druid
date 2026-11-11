import jnim

jclass android.view.WindowInsets* of JVMObject:
  proc createCompatTypeMap*(insets: Rect): seq[Insets] {.`static`.}
  proc assignCompatInsets*(typeInsetsMap: seq[Insets], insets: Rect) {.`static`.}
  proc getSystemWindowInsetsAsRect*(): Rect
  proc getSystemWindowInsets*(): Insets
  proc getInsets*(typeMask: jint): Insets
  proc getInsetsIgnoringVisibility*(typeMask: jint): Insets
  proc isVisible*(typeMask: jint): jboolean
  proc getSystemWindowInsetLeft*(): jint
  proc getSystemWindowInsetTop*(): jint
  proc getSystemWindowInsetRight*(): jint
  proc getSystemWindowInsetBottom*(): jint
  proc hasSystemWindowInsets*(): jboolean
  proc hasInsets*(): jboolean
  proc getBoundingRects*(typeMask: jint): List[Rect]
  proc getBoundingRectsIgnoringVisibility*(typeMask: jint): List[Rect]
  proc getDisplayCutout*(): DisplayCutout
  proc getRoundedCorner*(position: jint): RoundedCorner
  proc getPrivacyIndicatorBounds*(): Rect
  proc getDisplayShape*(): DisplayShape
  proc consumeDisplayCutout*(): WindowInsets
  proc isConsumed*(): jboolean
  proc isRound*(): jboolean
  proc consumeSystemWindowInsets*(): WindowInsets
  proc replaceSystemWindowInsets*(left: jint, top: jint, right: jint, bottom: jint): WindowInsets
  proc replaceSystemWindowInsets*(systemWindowInsets: Rect): WindowInsets
  proc getStableInsets*(): Insets
  proc getStableInsetTop*(): jint
  proc getStableInsetLeft*(): jint
  proc getStableInsetRight*(): jint
  proc getStableInsetBottom*(): jint
  proc hasStableInsets*(): jboolean
  proc getSystemGestureInsets*(): Insets
  proc getMandatorySystemGestureInsets*(): Insets
  proc getTappableElementInsets*(): Insets
  proc consumeStableInsets*(): WindowInsets
  proc getForceConsumingTypes*(): jint
  proc isForceConsumingOpaqueCaptionBar*(): jboolean
  proc getSuppressScrimTypes*(): jint
  proc toString*(): string
  proc inset*(r: Rect): WindowInsets
  proc inset*(insets: Insets): WindowInsets
  proc inset*(left: jint, top: jint, right: jint, bottom: jint): WindowInsets
  proc getFrame*(): Size
  proc insetUnchecked*(left: jint, top: jint, right: jint, bottom: jint): WindowInsets
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CONSUMED*: WindowInsets {.`static`.}

jclass android.view.WindowInsets.Builder* of JVMObject:
  proc setSystemWindowInsets*(systemWindowInsets: Insets): Builder
  proc setSystemGestureInsets*(insets: Insets): Builder
  proc setMandatorySystemGestureInsets*(insets: Insets): Builder
  proc setTappableElementInsets*(insets: Insets): Builder
  proc setInsets*(typeMask: jint, insets: Insets): Builder
  proc setInsetsIgnoringVisibility*(typeMask: jint, insets: Insets): Builder
  proc setVisible*(typeMask: jint, visible: jboolean): Builder
  proc setStableInsets*(stableInsets: Insets): Builder
  proc setDisplayCutout*(displayCutout: DisplayCutout): Builder
  proc setRoundedCorners*(roundedCorners: RoundedCorners): Builder
  proc setRoundedCorner*(position: jint, roundedCorner: RoundedCorner): Builder
  proc setPrivacyIndicatorBounds*(bounds: PrivacyIndicatorBounds): Builder
  proc setPrivacyIndicatorBounds*(bounds: Rect): Builder
  proc setDisplayShape*(displayShape: DisplayShape): Builder
  proc setRound*(round: jboolean): Builder
  proc setAlwaysConsumeSystemBars*(alwaysConsumeSystemBars: jboolean): Builder
  proc setForceConsumingTypes*(forceConsumingTypes: jint): Builder
  proc setForceConsumingOpaqueCaptionBar*(forceConsumingOpaqueCaptionBar: jboolean): Builder
  proc setSuppressScrimTypes*(suppressScrimTypes: jint): Builder
  proc setBoundingRects*(typeMask: jint, rects: List[Rect]): Builder
  proc setBoundingRectsIgnoringVisibility*(typeMask: jint, rects: List[Rect]): Builder
  proc setFrame*(width: jint, height: jint): Builder
  proc build*(): WindowInsets

jclass android.view.WindowInsets.Type* of JVMObject:
  proc toString*(types: jint): string {.`static`.}
  proc statusBars*(): jint {.`static`.}
  proc navigationBars*(): jint {.`static`.}
  proc captionBar*(): jint {.`static`.}
  proc ime*(): jint {.`static`.}
  proc systemGestures*(): jint {.`static`.}
  proc mandatorySystemGestures*(): jint {.`static`.}
  proc tappableElement*(): jint {.`static`.}
  proc displayCutout*(): jint {.`static`.}
  proc systemOverlays*(): jint {.`static`.}
  proc systemBars*(): jint {.`static`.}
  proc defaultVisible*(): jint {.`static`.}
  proc all*(): jint {.`static`.}
  proc hasCompatSystemBars*(types: jint): jboolean {.`static`.}

jclass android.view.WindowInsets.Side* of JVMObject:
  proc all*(): jint {.`static`.}

jclass android.view.Builder* of JVMObject:
  proc setSystemWindowInsets*(systemWindowInsets: Insets): Builder
  proc setSystemGestureInsets*(insets: Insets): Builder
  proc setMandatorySystemGestureInsets*(insets: Insets): Builder
  proc setTappableElementInsets*(insets: Insets): Builder
  proc setInsets*(typeMask: jint, insets: Insets): Builder
  proc setInsetsIgnoringVisibility*(typeMask: jint, insets: Insets): Builder
  proc setVisible*(typeMask: jint, visible: jboolean): Builder
  proc setStableInsets*(stableInsets: Insets): Builder
  proc setDisplayCutout*(displayCutout: DisplayCutout): Builder
  proc setRoundedCorners*(roundedCorners: RoundedCorners): Builder
  proc setRoundedCorner*(position: jint, roundedCorner: RoundedCorner): Builder
  proc setPrivacyIndicatorBounds*(bounds: PrivacyIndicatorBounds): Builder
  proc setPrivacyIndicatorBounds*(bounds: Rect): Builder
  proc setDisplayShape*(displayShape: DisplayShape): Builder
  proc setRound*(round: jboolean): Builder
  proc setAlwaysConsumeSystemBars*(alwaysConsumeSystemBars: jboolean): Builder
  proc setForceConsumingTypes*(forceConsumingTypes: jint): Builder
  proc setForceConsumingOpaqueCaptionBar*(forceConsumingOpaqueCaptionBar: jboolean): Builder
  proc setSuppressScrimTypes*(suppressScrimTypes: jint): Builder
  proc setBoundingRects*(typeMask: jint, rects: List[Rect]): Builder
  proc setBoundingRectsIgnoringVisibility*(typeMask: jint, rects: List[Rect]): Builder
  proc setFrame*(width: jint, height: jint): Builder
  proc build*(): WindowInsets

jclass android.view.Type* of JVMObject:
  proc toString*(types: jint): string {.`static`.}
  proc statusBars*(): jint {.`static`.}
  proc navigationBars*(): jint {.`static`.}
  proc captionBar*(): jint {.`static`.}
  proc ime*(): jint {.`static`.}
  proc systemGestures*(): jint {.`static`.}
  proc mandatorySystemGestures*(): jint {.`static`.}
  proc tappableElement*(): jint {.`static`.}
  proc displayCutout*(): jint {.`static`.}
  proc systemOverlays*(): jint {.`static`.}
  proc systemBars*(): jint {.`static`.}
  proc defaultVisible*(): jint {.`static`.}
  proc all*(): jint {.`static`.}
  proc hasCompatSystemBars*(types: jint): jboolean {.`static`.}

jclass android.view.Side* of JVMObject:
  proc all*(): jint {.`static`.}
  LEFT*: jint {.`static`.}
  TOP*: jint {.`static`.}
  RIGHT*: jint {.`static`.}
  BOTTOM*: jint {.`static`.}

