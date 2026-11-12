import jnim

jclass android.view.DisplayShape* of JVMObject:
  proc fromResources*(res: Resources, displayUniqueId: string, physicalDisplayWidth: jint, physicalDisplayHeight: jint, displayWidth: jint, displayHeight: jint): DisplayShape {.`static`.}
  proc createDefaultDisplayShape*(displayWidth: jint, displayHeight: jint, isScreenRound: jboolean): DisplayShape {.`static`.}
  proc fromSpecString*(spec: string, physicalPixelDisplaySizeRatio: jfloat, displayWidth: jint, displayHeight: jint): DisplayShape {.`static`.}
  proc getSpecString*(res: Resources, displayUniqueId: string): string {.`static`.}
  proc setRotation*(rotation: jint): DisplayShape
  proc setOffset*(offsetX: jint, offsetY: jint): DisplayShape
  proc setScale*(scale: jfloat): DisplayShape
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc getPath*(): Path
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  NONE*: DisplayShape {.`static`.}
  mDisplayShapeSpec*: string
  CREATOR*: Creator[DisplayShape] {.`static`.}

