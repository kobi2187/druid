import jnim

jclass android.util.PathParser* of JVMObject:
  proc createPathFromPathData*(pathString: string): Path {.`static`.}
  proc createPathFromPathData*(outPath: Path, data: PathData) {.`static`.}
  proc canMorph*(pathDataFrom: PathData, pathDataTo: PathData): jboolean {.`static`.}
  proc interpolatePathData*(outData: PathData, fromData: PathData, toData: PathData, fraction: jfloat): jboolean {.`static`.}

jclass android.util.PathParser.PathData* of JVMObject:
  proc getNativePtr*(): jlong
  proc setPathData*(source: PathData)

jclass android.util.PathData* of JVMObject:
  proc getNativePtr*(): jlong
  proc setPathData*(source: PathData)

