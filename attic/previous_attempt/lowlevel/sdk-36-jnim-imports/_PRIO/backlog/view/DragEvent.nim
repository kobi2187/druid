import jnim

jclass android.view.DragEvent* of JVMObject:
  proc obtain*(action: jint, x: jfloat, y: jfloat, offsetX: jfloat, offsetY: jfloat, displayId: jint, flags: jint, localState: JObject, description: ClipDescription, data: ClipData, dragSurface: SurfaceControl, dragAndDropPermissions: IDragAndDropPermissions, result: jboolean): DragEvent {.`static`.}
  proc obtain*(source: DragEvent): DragEvent {.`static`.}
  proc getAction*(): jint
  proc getX*(): jfloat
  proc getY*(): jfloat
  proc getOffsetX*(): jfloat
  proc getOffsetY*(): jfloat
  proc getDisplayId*(): jint
  proc getClipData*(): ClipData
  proc getClipDescription*(): ClipDescription
  proc getDragSurface*(): SurfaceControl
  proc getDragFlags*(): jint
  proc getDragAndDropPermissions*(): IDragAndDropPermissions
  proc getLocalState*(): JObject
  proc getResult*(): jboolean
  proc recycle*()
  proc actionToString*(action: jint): string {.`static`.}
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  ACTION_DRAG_STARTED*: jint {.`static`.}
  ACTION_DRAG_LOCATION*: jint {.`static`.}
  ACTION_DROP*: jint {.`static`.}
  ACTION_DRAG_ENDED*: jint {.`static`.}
  ACTION_DRAG_ENTERED*: jint {.`static`.}
  ACTION_DRAG_EXITED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[DragEvent] {.`static`.}

