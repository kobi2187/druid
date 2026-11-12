import jnim

jclass android.gesture.Gesture* of JVMObject:
  proc clone*(): JObject
  proc getStrokes*(): ArrayList[GestureStroke]
  proc getStrokesCount*(): jint
  proc addStroke*(stroke: GestureStroke)
  proc getLength*(): jfloat
  proc getBoundingBox*(): RectF
  proc toPath*(): Path
  proc toPath*(path: Path): Path
  proc toPath*(width: jint, height: jint, edge: jint, numSample: jint): Path
  proc toPath*(path: Path, width: jint, height: jint, edge: jint, numSample: jint): Path
  proc getID*(): jlong
  proc toBitmap*(width: jint, height: jint, edge: jint, numSample: jint, color: jint): Bitmap
  proc toBitmap*(width: jint, height: jint, inset: jint, color: jint): Bitmap
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[Gesture] {.`static`.}

