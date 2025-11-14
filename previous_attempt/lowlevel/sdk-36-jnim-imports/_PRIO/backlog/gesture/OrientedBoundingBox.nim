import jnim

jclass android.gesture.OrientedBoundingBox* of JVMObject:
  proc toPath*(): Path
  squareness*: jfloat
  width*: jfloat
  height*: jfloat
  orientation*: jfloat
  centerX*: jfloat
  centerY*: jfloat

