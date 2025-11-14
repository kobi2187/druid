import jnim

jclass android.view.SurfaceControlActivePicture* of JVMObject:
  proc getLayerId*(): jint
  proc getOwnerUid*(): jint
  proc getPictureProfileHandle*(): PictureProfileHandle

