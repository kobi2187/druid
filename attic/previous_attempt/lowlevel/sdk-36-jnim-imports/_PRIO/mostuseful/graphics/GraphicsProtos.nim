import jnim

jclass android.graphics.GraphicsProtos* of JVMObject:
  proc dumpPointProto*(point: Point, protoOutputStream: ProtoOutputStream, fieldId: jlong) {.`static`.}

