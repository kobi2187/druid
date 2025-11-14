import jnim

jclass android.view.InsetsSource* of JVMObject:
  proc set*(other: InsetsSource)
  proc setFrame*(left: jint, top: jint, right: jint, bottom: jint): InsetsSource
  proc setFrame*(frame: Rect): InsetsSource
  proc setVisibleFrame*(visibleFrame: Rect): InsetsSource
  proc setVisible*(visible: jboolean): InsetsSource
  proc setFlags*(flags: jint): InsetsSource
  proc setFlags*(flags: jint, mask: jint): InsetsSource
  proc updateSideHint*(bounds: Rect): InsetsSource
  proc setBoundingRects*(rects: seq[Rect]): InsetsSource
  proc getId*(): jint
  proc getType*(): jint
  proc getFrame*(): Rect
  proc getVisibleFrame*(): Rect
  proc isVisible*(): jboolean
  proc getFlags*(): jint
  proc hasFlags*(flags: jint): jboolean
  proc getBoundingRects*(): seq[Rect]
  proc calculateInsets*(relativeFrame: Rect, ignoreVisibility: jboolean): Insets
  proc calculateVisibleInsets*(relativeFrame: Rect): Insets
  proc calculateBoundingRects*(relativeFrame: Rect, ignoreVisibility: jboolean): seq[Rect]
  proc createId*(owner: JObject, index: jint, type: jint): jint {.`static`.}
  proc getIndex*(id: jint): jint {.`static`.}
  proc getType*(id: jint): jint {.`static`.}
  proc flagsToString*(flags: jint): string {.`static`.}
  proc dumpDebug*(proto: ProtoOutputStream, fieldId: jlong)
  proc dump*(prefix: string, pw: PrintWriter)
  proc equals*(o: JObject): jboolean
  proc equals*(o: JObject, excludeInvisibleImeFrames: jboolean): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  ID_IME*: jint {.`static`.}
  ID_IME_CAPTION_BAR*: jint {.`static`.}
  FLAG_SUPPRESS_SCRIM*: jint {.`static`.}
  FLAG_INSETS_ROUNDED_CORNER*: jint {.`static`.}
  FLAG_FORCE_CONSUMING*: jint {.`static`.}
  FLAG_ANIMATE_RESIZING*: jint {.`static`.}
  FLAG_FORCE_CONSUMING_OPAQUE_CAPTION_BAR*: jint {.`static`.}
  CREATOR*: Creator[InsetsSource] {.`static`.}

